Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A23106FD66
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 04:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870EF10E03A;
	Fri, 13 Mar 2026 04:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5+/Wm9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AFF10E03A
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 04:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773375695; x=1804911695;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fr4Vu8UZg59WTOEW5D9rlBoHYeimhTQCaBvBbManzRE=;
 b=U5+/Wm9pMyxN+P1bFQs6R7itJLsyi8FJJWmNbmIvm33VXsXaIAinN7DQ
 upcdXAbKZ6NLTSsdGb3M2C8R9HqRneaYEBr2aK6R8Xol8xeOtXCr3a4rS
 gitmi/NjHVl5lB1nvnw5xg4/JaTZdtku1DXhDt4bG5VECuUnYjhX/wim0
 K8M1PFYEOW5MFgBuODQ8c3Fju8TCe0BidZD8IO/vCjbZOY1J9fS2XN4Iq
 B7HW6c0jp6C1kE4ONpYjN7uWY2llX5c+S5ksyKLvabkw3BioUR41rpHa0
 7eXsueLSkCH+/R8/mb5y6F0iWGIQi4Mp9r5Fg9CghehltzSRPc2lvKW7A w==;
X-CSE-ConnectionGUID: QuYSmCvbQ1O27pYkFPwHAw==
X-CSE-MsgGUID: L10aDlLCQ2eXzR8VsAp7Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74561815"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="74561815"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 21:21:34 -0700
X-CSE-ConnectionGUID: 9KnaaYkLRUKTb50Z1o9MUA==
X-CSE-MsgGUID: 1T8/oFJWT3Se5hqvkJiwpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="218799739"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 21:21:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 21:21:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 21:21:33 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 21:21:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+Nd6upNG9fAguQY5mZHNlAKcQz/kilwEbt07s7ngsccPkySTJz7hYP+A8puYcx2H8GXZqWoW3GSUoqDAjMenceV0wIKBhYFXQud1KnEukWH6gSdmNrGxsBECj23/L9x4p8mVIZ4mrOEaf19g6QvdGZqn0m68Ii35RoCGJLqU+iiSDpQ0+6UDKIFaeEeWLE+Ccp9eDMc0+MW+GJ/iFPtUghUfKrwtt0zZVryLL65j+l3eW2aQ87gqqA9A+iIgFECQVa1iSpDV7jIZhiM3fwJKVMydmoJQgSS6zj/mokBCvqHq9ovIJQERC1AirvFwqvtEpRL262iMppbxBVuK/PDsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr4Vu8UZg59WTOEW5D9rlBoHYeimhTQCaBvBbManzRE=;
 b=RLGgFfTgGVZoKC60d3xN/71mF/fusaNHAGQYrLQYtlsMkg+Eq2Ev8WG6iBaKypqctuUK5mP1R+LaoAOlKDb8U2yMCBuF3Yjkddf4QRtzeougPMXqTWlnc/53OtPCL4mHg7Q8rVkb9XrtDPQ8jG/Gfbsq01VQwuBO70/dd2DwOwVVuyRuXgoJ5rFyparVBlRAj0BhnLj8ijgzPnGrckNo/8NXOYSXalqRDrgi2t9C6Rwkya9i+P6sr+zSjJB7aK+pg1/zcEFB+9hKbNtLNikkToSJbmEUVTJP0ZzcS+ZO8fnbQjiYgbtWPZK5PB0Zbq6KAYaLxkhPtYJnC7QZTO0bDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DS0PR11MB6517.namprd11.prod.outlook.com (2603:10b6:8:d3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.6; Fri, 13 Mar 2026 04:21:29 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 04:21:29 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_rotation_crc: Drain queued CRCs to
 avoid stale comparisons
Thread-Topic: [PATCH i-g-t v1] tests/kms_rotation_crc: Drain queued CRCs to
 avoid stale comparisons
Thread-Index: AQHcsdsPkbgNymMqYkKDnpktEddNk7Wqaw+AgAFxtJA=
Date: Fri, 13 Mar 2026 04:21:29 +0000
Message-ID: <PH7PR11MB67969A1EAC866F078D599B16E545A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260312050613.375306-1-sowmiya.s@intel.com>
 <BL1PR11MB6050B22FE76753CEBCF458F8E744A@BL1PR11MB6050.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB6050B22FE76753CEBCF458F8E744A@BL1PR11MB6050.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DS0PR11MB6517:EE_
x-ms-office365-filtering-correlation-id: 9e37ecff-f7a3-451e-0e57-08de80b7ffec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: q9hakZIpXbvJV9ftJ+ofc3tJCWA7ZZrkQDn6GLXucVJizzJPnqUhwfNwlum7EMoSR4w00ccCn167BtqZFWQFh0vZJnVbFny9+XcKI2UcjwJEhuO4Zt3YcovLV9Eo7N+sZMEBTq9uNadACNaaQkTXZF1fnrRq1199OwRX9+WEIH8VB1dLpIc3Zls5bz3aeuqIgrugq7onzzslXCbvjC7x5wFd6yOcJAXpE+JMkVpZD1ICld525mA/00l/9pdUB84C15lW3phm4/LptOIyWFie91uQ5PU5gZitT5ka1jHusOulsDH4O2nxUf3eb8EvtRY/aRc9bQQhqR3NfKJ/Nh74FXc3ZG/x3HncjuL+kn7drs8WfKSf7LnQBkk44uAcGKk0cxtrKmscm1nryS2UIuErp1889QBQX4XZgXU4k6vQgGDbtJ5N+Z5Ij0wdTsppaBTO5mgoPySn06qtE34UwzpR6eSLDSsNdYj8Kz4sCryOMrQcT9JCaJq/t3fi8EfiAUKO8h1h8ChBVMc01BqVeC84IVw/SlZxHkPYj85d8+vJX4R0Guiuz3WGg7fT8yL3cVVhRn8ZyyGZM8UwQ6ap6mBhyVxXre6zpRQBa3GFtTFRfQP32Tlo+mVR1JLA2c2M8bD8ByByXIpsh7K76fQ2ew6WKyMBM7j7JLpPjCaPQ84NsJHCUW7Z0gBIqWJ/T+3cdsz+jsNoP98lZKuRMJz5NqibSw234U3kJRfHXqV3WKsHN34sHoEnH+rtjBbkOltMie7yLfS4zRdk4I2HLyq0w98WBrmX/UPUIs2HTii8k+MvkMI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDBucDYwNjcrY1Z4OHBwa1NDWGZDaVovL29qNnB4dFJYWWNyeXVQVGw5aURv?=
 =?utf-8?B?RUhiN1Jzbk92Z1NMWFIwUURXbmt3blRFaVFoTE9mN2h2b0pZSm9ZL0duR1A2?=
 =?utf-8?B?c29RMDcrNVovNnpYTlpPL3FEOFVlU0RZNS8vS0NvOXRQT3VJODJHUjhFYnQw?=
 =?utf-8?B?L0xsSmFDZ2RyZ1ZzZjkxdTNwVGVwMzJ4c0F3UzJCY2pkOFVBNXBDUFkwa1Fz?=
 =?utf-8?B?THlRdmpOZ20xV3NYSVRZYW5DOElKUUtRM1pRZW9NZk9JWmpXTGJFd25NT2hJ?=
 =?utf-8?B?UWdUcHhmZUhoN0craGF0aVJCUXFHc3hCMVFsOE5YSEk5eHlVbWQrQ2w5SGsy?=
 =?utf-8?B?YktXSGJHQ25WUmhGYzFja0ZDZVE4K2M4Z3MrREtxNWJTay9uTkU5RFc0Rm0v?=
 =?utf-8?B?ZHdtU000a0duUzVFQTYyUkRKY1FzeVJQZlQrS2JUY1RadUwvQ2Z2TGFjWjVM?=
 =?utf-8?B?dEY3aWF5N0hhVUJKUzFXQ0FYUnFrdHRCY1E5SStFbDRJK0pDVnRjZDBDMmJx?=
 =?utf-8?B?QzRZQkdpOTJnVi9NdVJUZ0tuMmZ4MC9hRnFyNDVqbmxGVDNyUW5qb3ZWVXlZ?=
 =?utf-8?B?MVYyMU4yVUdVeGIzek83QUNOaGV5Sm1uSnF3RUY2K0VmYjdUTHJnVDVJUlBr?=
 =?utf-8?B?cklVYjJlY0tmYS8ydWNXRHU2czhzcjBkTC9TSm1OU0FVbnMvZkkxMCtIQmJi?=
 =?utf-8?B?dkl1TGlwZk9EdTczVS9BVTJlV3AvWjdwdWsvVTc5ZVdyRENJWVVqd1dXbzlE?=
 =?utf-8?B?bzg1U01yUlYxbWlwSTRWSEwxRzBzdFVrY29uTnpuMkVVdUx6bm1VOXo1aEp2?=
 =?utf-8?B?K25GZEhGMVNTMHF6a0hqSW8xU2R2VVFOd3h5QUI2dDhaWTRJOFRjLzQ3TC84?=
 =?utf-8?B?bVczYmVMT016NmtJVjhYVWZVbEFQcjFZYjRxMjdyZE9WU3pCWkhkMlh3SkNu?=
 =?utf-8?B?NWpqUWZXVHRmamZjbUhzMVBycTdGTUQyWmo5ajh6bjVpeWFGdHp6L3hWeUNE?=
 =?utf-8?B?ZS92K1RaN2RZOUpQZmozcGovV3kzbWZSNis2NFRIMHdvRTc0Z3pjOEpQUGtT?=
 =?utf-8?B?M0xPekw2YlZ1dnFhODNmTGhuZ2FpOXNXQWNOcU9TeGNGTGtIRkljT0xJY0wv?=
 =?utf-8?B?Z0F4eG9VNWVZVzFKRHFvQWV0UEoxWHBOMi9LbU1ENUN6MkxDOHVSdHVhRVNB?=
 =?utf-8?B?VFpWaHJGMXYyRlNMWlZkTUpzb1VHS1VYQjdTdS9maW9TOTRXeHNwRGdld1lR?=
 =?utf-8?B?NjYyYTJ1ZDZBNmhWM0xlNnhYY0ZuaEdnakhIOE04S2k5R3BpcDhMcEk1QjlY?=
 =?utf-8?B?NzVwNVdZRGJyeXBYNytlb0kzMkZwY0VoSnI5SmFGTUtjeXlWb3FuNmxLdFQ1?=
 =?utf-8?B?THlaVkMzazhoR1J6YUxobXNxTG53OTc4K0lPa2wxYWJmNUdQK3p3dktHK1pu?=
 =?utf-8?B?czY2MXBFa0dHTXFkMVozdlZHbDAyOHd0RDkyQzN1MmZNeWpXL0VpTE9NZ3ph?=
 =?utf-8?B?ZE5xMFNlSVc4RWtkQWMrOHRaa1JoMUlNZ2hLRUJ2QWRvVXU1R04wdzIxZlFE?=
 =?utf-8?B?a3pUL3lYdENwRmtoMjRaWS8zbTY4TDdMR3Y2enFqSWp1dG5NbXlGbzFyOTNY?=
 =?utf-8?B?ZDhERWMvNXhzV3NrRGlXSXJMTVg1Y3hPS21xVGxwUEt6bHd0YlZEcVZ4dXFU?=
 =?utf-8?B?dGs3RE1wQ0FyZHp2dVBRV1E0S25KYzQ3WnlQWU9WVUlha0YybkMzSHNrTVpr?=
 =?utf-8?B?NFVkdXBtaXAwTWg0NXZ4NmVVUndxNmVMWnRYMTd1T0dkQU9FL0RaR1lEWEox?=
 =?utf-8?B?eDhxOG5oNEJ2cXZuTlRzTmtQSlIyODJadDFJNG9LNnE0d21oamthdkttY0dP?=
 =?utf-8?B?QXMrQWwwcFB5UXp5UFRsdWx0cHJkTWtIa0VuU2s2Vit4WHRnVlBRa0g3UnJP?=
 =?utf-8?B?dkM4YjVYWFkzREszbFI1d3pLVlllZHlsK3NUUy9yNGx4bVowWXRKclRrRVdE?=
 =?utf-8?B?VHhNeE5nRVpjbTl2YWo2ejlFSVlsMUU4VGZlQVVjaC94Wk8wRXZ1T3pLVm85?=
 =?utf-8?B?b3plb2VxU3FiZWliTXByN2hHNk9RUGNoRVVlUFBDSGE3NXVTWDFEbHdwcEhz?=
 =?utf-8?B?ZHBUd2JEMU84U1BnalVNZytTaFkrTzlEMlAzSStCSEI1TUU3c1BadldUM05j?=
 =?utf-8?B?OGdyU3AxeFFGNkt6M1V4blo1WThzNEwyYlQwTnpBN0xZNWlSZjNHMGh1R3J0?=
 =?utf-8?B?VjQ5Y1ZzcUU4OERTNklzL0lzWStiZTl6YWROTHlEdmJqdnpYbDZEMzB3TlFU?=
 =?utf-8?Q?ZaH90jhluL5D2ZAxHk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: whWP8aIXhK4Zkm72RaFyj4yxE5YS5AYiTbfJ0gwlwLxxj7jzcexNwuZA2XT/IoSlzIQEuV9MOqGHuCGsEEe+p35haxbn6evOd/1ktqJ7QLrg/57SvPA4Sr2MQNFlHxPXjmOspziQ71QwSLOSh7eCjXD3M6L7S1XeEItzGm/40cFu0cYeHPzhXjvdUwpfCSNctGTrBURZfD7Op0l43UuPfW1WCG+osoqpLYMzjM1TtWYHybc6p48oJA3EyCuTMb+sErVbnq5IUazgxfvj5h3Ib1HlzshEXH673iYgPkIvlb056vJczckS25epqfrl0RKFsV41UhnMhh2VHh0C0cmBuQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e37ecff-f7a3-451e-0e57-08de80b7ffec
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 04:21:29.3973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q6WgsFNPEbUASdugHC+QAaekRK3CGPAKqhYNvncFtc5rKAPiF5P5f0JN4StiMEfwXKSr3gnTIDvlVJU/73M9OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6517
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

SGkgUHJhbmF5LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNhbWFs
YSwgUHJhbmF5IDxwcmFuYXkuc2FtYWxhQGludGVsLmNvbT4NCj4gU2VudDogMTIgTWFyY2ggMjAy
NiAxMTo0NA0KPiBUbzogUywgU293bWl5YSA8c293bWl5YS5zQGludGVsLmNvbT47IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJt
YUBpbnRlbC5jb20+OyBOYWxhZGFsYSwgUmFtYW5haWR1DQo+IDxyYW1hbmFpZHUubmFsYWRhbGFA
aW50ZWwuY29tPjsgUywgU293bWl5YSA8c293bWl5YS5zQGludGVsLmNvbT4NCj4gU3ViamVjdDog
UkU6IFtQQVRDSCBpLWctdCB2MV0gdGVzdHMva21zX3JvdGF0aW9uX2NyYzogRHJhaW4gcXVldWVk
IENSQ3MgdG8NCj4gYXZvaWQgc3RhbGUgY29tcGFyaXNvbnMNCj4gDQo+IA0KPiBIaSBTb3dtaXlh
LA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IGlndC1kZXYg
PGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+
IFNvd21peWEgUw0KPiA+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxMiwgMjAyNiAxMDozNiBBTQ0K
PiA+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBTaGFybWEsIFN3
YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+OyBOYWxhZGFsYSwgUmFtYW5haWR1DQo+ID4g
PHJhbWFuYWlkdS5uYWxhZGFsYUBpbnRlbC5jb20+OyBTLCBTb3dtaXlhIDxzb3dtaXlhLnNAaW50
ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MV0gdGVzdHMva21zX3JvdGF0aW9u
X2NyYzogRHJhaW4gcXVldWVkIENSQ3MgdG8NCj4gPiBhdm9pZCBzdGFsZSBjb21wYXJpc29ucw0K
PiA+DQo+ID4gQ2xlYXIgYW55IHF1ZXVlZCBDUkNzIGJlZm9yZSBjb21wdXRpbmcgdGhlIHRhcmdl
dCB2YmxhbmsgYW5kIHJlYWRpbmcgYQ0KPiA+IHNhbXBsZS4NCj4gPiBUaGlzIGVuc3VyZXMgdGhl
IG5leHQgQ1JDIGNvcnJlc3BvbmRzIHRvIHRoZSBmaXJzdCBmcmFtZSBhZnRlciB0aGUNCj4gPiBj
YWxsZXLigJlzIGNvbW1pdCwgcmVkdWNpbmcgcmFyZSBzdGFsZS1DUkMgbWlzbWF0Y2hlcyBzZWVu
IGFyb3VuZA0KPiA+IG1vZGVzZXRzL1BTUi9EUlJTL0RTQyB0cmFuc2l0aW9ucyBhbmQgRFAgbGlu
ayByZXRyYWlucy4gSW1wcm92ZXMNCj4gPiBkZXRlcm1pbmlzbSBvZiBDUkMtYmFzZWQgdGVzdHMu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTb3dtaXlhIFMgPHNvd21peWEuc0BpbnRlbC5jb20+
DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ttc19yb3RhdGlvbl9jcmMuYyB8IDIgKysNCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ttc19yb3RhdGlvbl9jcmMuYyBiL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMuYyBpbmRleA0KPiA+
IDQ0MjAwNTNmMS4uOWQzMDhmNWI2IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ttc19yb3RhdGlv
bl9jcmMuYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMuYw0KPiA+IEBAIC0xMDIy
LDYgKzEwMjIsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X211bHRpX3BsYW5lX3JvdGF0aW9uKGRhdGFf
dA0KPiA+ICpkYXRhLCBpZ3RfY3J0Y190ICpjcnRjKQ0KPiA+ICAJCQkJCQkJCWNvbnRpbnVlOw0K
PiA+DQo+ID4NCj4gPiAJaWd0X2Rpc3BsYXlfY29tbWl0X2F0b21pYyhkaXNwbGF5LA0KPiA+IERS
TV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VULCBOVUxMKTsNCj4gPiArDQo+ID4gCWlndF9waXBl
X2NyY19kcmFpbihkYXRhLT5waXBlX2NyYyk7DQo+ID4gIAkJCQkJCQlmbGlwc3cgPQ0KPiA+IGln
dF9jcnRjX2dldF92YmxhbmsoY3J0YywNCj4gPg0KPiA+IAkgICAgIDApICsgMTsNCj4gPiAgCQkJ
CQkJCWhhdmVfY3JjID0gZmFsc2U7DQo+ID4gQEAgLTEwMzYsNiArMTAzNyw3IEBAIHN0YXRpYyB2
b2lkIHRlc3RfbXVsdGlfcGxhbmVfcm90YXRpb24oZGF0YV90DQo+ID4gKmRhdGEsIGlndF9jcnRj
X3QgKmNydGMpDQo+ID4gIAkJCQkJCQljb250aW51ZTsNCj4gPg0KPiA+DQo+ID4gCWlndF9kaXNw
bGF5X2NvbW1pdF9hdG9taWMoZGlzcGxheSwNCj4gPiBEUk1fTU9ERV9BVE9NSUNfQUxMT1dfTU9E
RVNFVCwgTlVMTCk7DQo+ID4gKwkJCQkJCWlndF9waXBlX2NyY19kcmFpbihkYXRhLQ0KPiA+ID5w
aXBlX2NyYyk7DQo+IA0KPiBJIHRoaW5rIHRoaXMgc2Vjb25kIGlndF9waXBlX2NyY19kcmFpbigp
IHJ1bnMgYmVmb3JlIHJldGNyY19zdyBpcyByZWFkLCBzbyB0aGlzDQo+IGNhbiBkaXNjYXJkIHRo
ZSBmcmFtZSBDUkMgdGFyZ2V0ZWQgYnkgZmxpcHN3LiBUaGVuDQo+IGlndF9waXBlX2NyY19nZXRf
Zm9yX2ZyYW1lKC4uLiwgZmxpcHN3LCAuLi4pIG1heSByZWFkIGEgbGF0ZXIgZnJhbWUuDQo+IA0K
PiBJIGZlZWwgeW91IGNhbiBrZWVwIHRoZSBmaXJzdCBkcmFpbiBhbmQgbW92ZSB0aGUgc2Vjb25k
IG9uZSBhZnRlciBjb2xsZWN0aW5nDQo+IHJldGNyY19zdy4NCj4gDQo+IFJlZ2FyZHMsDQo+IFBy
YW5heQ0KPiANClllcywgdGhhdCBpcyB0aGUgcmlnaHQgdGhpbmcuIEkgd2lsbCByZW1vdmUgdGhl
IHNlbmQgZHJhaW4uIEFsc28gd2lsbCBtb3ZlIHRoZSBmaXJzdCBkcmFpbiBhZnRlciBjcmMgc3Rh
cnQsIHNvIHRoYXQgd29uJ3QgbWlzcw0KIGN1cnJlbnQgdGFyZ2V0ZWQgZnJhbWUuIA0KDQpSZWdh
cmRzLA0KU293bWl5YS4NCj4gPiAgCQkJCQkJZmxpcGh3ID0NCj4gPiBpZ3RfY3J0Y19nZXRfdmJs
YW5rKGNydGMsDQo+ID4gIAkJCQkJCQkJCSAgICAgMCkNCj4gPiArIDE7DQo+ID4NCj4gPiAtLQ0K
PiA+IDIuNDMuMA0KDQo=
