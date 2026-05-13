Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BE4CD484C
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 05:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC8710E2E2;
	Wed, 13 May 2026 05:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aanF6Zm3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE2B10E2EA
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 05:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778649147; x=1810185147;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LJiQWDn06PX7l/iBbaCSAJMYtOW+hk+DNV7InMXsvNc=;
 b=aanF6Zm3JfMFFXqVgn8jtwtpqdcFE/CwUZ6kSTm8hvACXapxWhRZCwFj
 gFWriurQv3OPWo8JYJD1/CFKli+tgmXqM5NRBUOL6dMB/DhloCQCdR3Gi
 NzFg7UAdlJz4RraQLmUkp2RYQ+Vq5PP7vUFmLra5rUSdgHuIt0JPwKIPh
 o9fK8bGNP3f3MwkPsLA3bvdKBFnJS95yTv/1aRz3/pWXu+HppvJDdHQwp
 6VAWRVeeT9iVgE9B9AjNdqKXe8sNmGHu/K9P/G6bsAfmYToSNbzT/Y2bH
 R6u+WmvFy9lIVtM6+5KJFWl1i3nvuCtBHpfsrvA283W5GJHf/JroZc/+S Q==;
X-CSE-ConnectionGUID: NxQw6MULSC+nS8ZFsetRNQ==
X-CSE-MsgGUID: cEYJAUgNQgiWAQM237aLlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78711973"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="78711973"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 22:12:27 -0700
X-CSE-ConnectionGUID: 8+ED2EP5TCWGLsyN+cm5Yg==
X-CSE-MsgGUID: e1MF7c/dQhyeho9F/TksKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="261467680"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 22:12:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:12:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 22:12:26 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2er0cBaKHZM8ptpgSUB19Yx9afmlWEco5I+kpgbYr1J9DtIenqnYzIi91/H6MFIrU++ZnPbWtE/wrBXtQAdPIGN7WppqHjeP1CeBBdLxY3lqmlKa2pf4aT3IugzcRFwOCieEFD2FNzjL7k2mgHuAhlt+Y3wV4UQmTabFw2vXoKzi4zTa1srYJBGhf6tNYs+eWsjJ+RBc+loDQDXxEIhiZickL/lJzacdwioT4q+xTnxCKuY7JTyEw/HaJsWXZbnYCWGW+0fK3lX6W4AovOrBUP/5jZ+ahi+pvWKJXk8J3x02e7o1iFYFaPMT4hdec5bzWXzfXIa7C52/HRO7Efh+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJiQWDn06PX7l/iBbaCSAJMYtOW+hk+DNV7InMXsvNc=;
 b=FmRFNNH9kQaDYsWs2311eE3kzPYMmrKZbnQa4mwzzag1tfCgEXT3+BlDGFOFMfeVg6vhTpT/Z8F2LyIP+0jzlOhDT9A7euOa137/p1nDXfRZN2/5JeMBany/ol39jIabj/tIk95VeaezbcJZWK2sDxXaH74hNkLAIImCFIEszcq06/A1oWdhLL6P86SJ8bDBdEYjSVl2Oi9iRWnAegCwaFlo7JPfNSTFLVdtJt4spsOIyRv8YJeDMddVaJuKsKZJVxGN8bFldRoc/1MXcSduQGC3TymnsussuH2glx9b8LY/1/XjX5lIECqWMFkvgUOvW2/Jsk3T9C2AXX41uVWAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 BL4PR11MB8870.namprd11.prod.outlook.com (2603:10b6:208:5a8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.23; Wed, 13 May 2026 05:12:23 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9891.017; Wed, 13 May 2026
 05:12:23 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 01/25] tests/kms_async_flips: Use correct format_mod
 list
Thread-Topic: [PATCH i-g-t 01/25] tests/kms_async_flips: Use correct
 format_mod list
Thread-Index: AQHc4gpOws4+kTzbiUiNWrUwgyVP17YLabTw
Date: Wed, 13 May 2026 05:12:23 +0000
Message-ID: <DM4PR11MB63127F274F6D511AB30EFCBC90062@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20260512122143.11013-2-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|BL4PR11MB8870:EE_
x-ms-office365-filtering-correlation-id: a6510709-05d3-4fdb-f437-08deb0ae375e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|38070700021|56012099003|22082099003|11063799003;
x-microsoft-antispam-message-info: Vf2g1RKb7KsCYvcUzZJ14O5fqMW4GaiV17+fyoGRTkGMyODQlEhZluN2YX9D210Oop2utnvwrso833ACr5zfjLtZ032iwpHGkL35a0g2h75asbWCwSP4kGpRGkXDE15apDOsd8WuIkxDkaWlSda+/o8/0m83xtak9Otm+WmmcepGzlynhYYjBQmw2IhZVWhuChY3bLCnKvmTGShFTsWfEOV2JKIcnq1lp6FwmHjZbR4gfb0mM3Zk7gOG9bFwQbGx2bvUGmLdpniQB22JFMCur0GbtRxc5GsrPTlSo16IETZJ42CS3b0pviIaAblmtS9Iyy6CCzygKoWssIGHaDhHuxuqAuRyZxFmL4CiNzQjHs1q1Qm8tBs4hmdc/2bbgZAxvkNJ2ZP7Xci+Z0anSs57qP4AeT+HLE2aLbbrX5viD4XeSKHq5UZX3kc5/usuHJU/+boL2SGYF8ieErFqEtX+bWbh6CsciH5TkoKdJbrUnJ61HBFZljKHE2wJ76Eowp6AQsfCD3jrfK5LNY1PpWDTscp5B5WZNwqzkjfZhFCNAg3MYkO0Rn0ti8ZVoHB+8URAk3Y9w+RHLOb6AyeLP5yj9oyqS4LFU2yJD4kG98P/nXN2q1md/J29HsEiT4JSSCf6APguqFwrYA3KoIsXGp370Upiya8aBebh6wArVZhUHzFDgGH7KcOKkCIy1AeK3WyVQYK8JU0oRyltKkJbLzhviW+Q0Ys6ktdOYuqfF6WZE52gq2TLJjudJfFaa1IUjvpz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(38070700021)(56012099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b01SeGtLbmpmTmh0TDV5djlPTUY1elFDbHdML0pRUVNDTHlwT2JTTzlvQmZh?=
 =?utf-8?B?RnFScDh5WUh5Nk93dDVENElwOGpsbGIwb3c5ZkJiTVdjbHg5ZzIrY05TeUZO?=
 =?utf-8?B?b2RGOFRjUHR1cCtGVlNDeHA2T1EvN1NwTzlLQ2tPcklHcUUvZkw1ZUlYTVVD?=
 =?utf-8?B?K0FtUXo3Q0FCVmdxamZ1RkJyNHFYMU1CajJyWjNIU1NZQzdxcGlZL3lFOTRX?=
 =?utf-8?B?NW5teGRiQzBuRXZzbTR3U3JYeXNFbDVRMGJlNy91cTZDckozL1A5aUVqcVpI?=
 =?utf-8?B?SGVxcUd0SGUyMW5maHVwZWpKbjVlV1JBR3c5QzFiekM5NFJjZzlHR1VBcU5V?=
 =?utf-8?B?Q3JqelBESVNJMjNhMWhla3lMb1UwTElDc2hLT2c1RTR6Zi91ZVBiNW13d1VC?=
 =?utf-8?B?UnM4V0xvV3FBNmpmWnQzR2VlczV5ZG9WNW42NmdWcGIyTkc2N1Y2K1hVMmI2?=
 =?utf-8?B?M0hCLzJVajhIZFJoVjAvaGVUK1ZUb3B6VDNza2JyaC8wSTNwTm1rYXhCYk5Y?=
 =?utf-8?B?SFQrbDUxVVNCOC80T3IyRkRxUHdoZmtZYUN3NjE0SldVM3NqSVdIbFV3a1dp?=
 =?utf-8?B?eUpqQzYyaHgzcVNidUxYak1CekJybHZPdFZsY2liR3UzUVhNZ3NNR2pRbXp2?=
 =?utf-8?B?a3lBcUpid3pGRFVUZ1Bnb0FTbGtMU3JQcGdRTmIwQVlSV2ZFT1pyU1I4a1Nh?=
 =?utf-8?B?d2QyY1dVQytZVys1cXpzY3BRVTQ1a2lOTjZkSE50WnI1cnFTMkVRbW1kdlpC?=
 =?utf-8?B?S2pWeFlGWnFWbHV0WlVWb0RSNTh4d3V5QnpTMVFWRlZtWUpBazh0dUtSRWNx?=
 =?utf-8?B?VFJCa0pJSnZCM0g3cDE5bjlDWU9rWVJQL0xOaUM2YmVycEFnNWg0RHR0MmhQ?=
 =?utf-8?B?VHhSV3F2N0s5Yk9KSklHSmN5dEZ6c0s0TGhLbkpKbXlnODZ1YkF2dURGNG1R?=
 =?utf-8?B?aDZCRVNJeVdycDZWckdyd2swQmxhMk0rU0phRzN1Ymt0b1gzQU5hMUNIVXNi?=
 =?utf-8?B?WEJMZVZyMVhsWUZuZVM2dk9SS3RlWWJkRW00WUN2RFpPUWI3b29RT2lsbzVi?=
 =?utf-8?B?TXlVY1ZaUEwzV1VJTXVITlNzdmhjdytuWC9BU2tyc1JtZmtrdkNoc0lyUmE0?=
 =?utf-8?B?S3VkQlJKRW1XVy9oVURmY2ZGWlgyOGlpMDZMWGxxdmNlZHMrNUpnK3FRUjAz?=
 =?utf-8?B?UEtNWTFtWkRTbWp6MEhQQ2YvZGtPVDQ0VTI4YzBhVlFpdllQOUI1V0l2V1R4?=
 =?utf-8?B?cnQ0OU1oR09SeE45OXRpcExLQWhTM2RUb1FVdnhLeWp4dWNCeEpvSXBKM1p4?=
 =?utf-8?B?Q3VZS0o2cG1xbWlzUThlVGRKY2JUWjZqM0RKZXBpSXkwVFdXa3NCUitsRS9q?=
 =?utf-8?B?dkxNTHB2OGRHMWJWTW9qMXNaQmp1cFBuNVZWNk1tMlg0UlA2eUhJMXdQNndT?=
 =?utf-8?B?WGRmWjlvRnN3SEF2Tkg2TTZYQWVueFk5UUo4cHNnSWxrcmltemJnSkJmK3dQ?=
 =?utf-8?B?M2t3YURFOFdjL3czaDBzVVNXUHZvZVZRckM2N2dWSCttS3FQem0zaWowKzAy?=
 =?utf-8?B?N2t2SXNTVzhMa09OREVEMS9obklpMVpXTzh0THVnYTR2Wms0Y3c4bW5HdmxJ?=
 =?utf-8?B?eW1LK2RUMnZsaW5aUnh5UHk3NnZnS0ZTVW5iMnBWRjNBOWZUdzd5dUpaZEFu?=
 =?utf-8?B?OXVVcEd4UXNhN0FsdmphU3I0TGF0QytHQVg1SlVGS3RWUVoveWQyRWdjaXVw?=
 =?utf-8?B?NjBORDdwR3ZnaG93SXFLS3RCYzlHOGgreFI5cUFkajloekkwaG1aMjV4WDY5?=
 =?utf-8?B?VWx2REJoeDV1dm55MjA4VEh4dUZXVHNqenhFL2xZWkRnOFRZeldMQW44Y1N2?=
 =?utf-8?B?bG1COEgwWGo2ek5CbkdRMzRKYTh3TnpXelkyanQveS9nR2l0TzF6SnFkQU9r?=
 =?utf-8?B?alpJMldJY1BUdUQ3bjYvaHFOVG5Db1lMSmp1dThrZ2M2OTJNejFOSXYzUWQ1?=
 =?utf-8?B?bGprcHFXbFZTR2Rpc3JvRmJVVGxNYW5ZRWxRV3E4aVVSclZJNVlJVnFadHVS?=
 =?utf-8?B?VnRWUzJhYTVpU2dsREhOSGtxNndaS1g0d1RJRmUxNHl1Z3JwR3ZoZVlVZkpo?=
 =?utf-8?B?WHNlcENXRmlXRE8rTDJ4Y1BKa2JXeVNDbGthUi9TUVVRcFRmM3Bxam1Cc2Vz?=
 =?utf-8?B?UU5SWFMyWnEycmE1Mkp5am56ME44OVQ3M0dGV0lQTHc1M3pnYXQ4WmcrcXVZ?=
 =?utf-8?B?ZnRPU1RPNTVrb0VpQUhIVmRqbEdVWWgwVEU4YlNuaUpuNkNwbnl6MmdsNlQw?=
 =?utf-8?Q?cWmImKQHtb6iwMq4t0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CpEG7UDqth5SxUUiGbaOUYKsLBpGSauRdQZOOV2EY81RKQD1Iw9UIxyiL9rusAUVto+3zQ7WnSH3EfCyYg+jLFd+EOnyKSSc6et+iomoFEYlcJuGaEtioiCCdLjAPCGRyoLesnPrZECzXchv2PWukNjQG9LSsHZ+OfhMIJsnuxiAI7OXtl5LEurcLoYUjRggjovOFwsnUZWyFDmUuWzzWF2NUadG4ynl1buXYFViIyvFAh5dFbewsKPpqEKD+Oh2zhh05Sih/wa4rliOHVV9EvSHWmhJzmUNScy4fmtNRy6DS2zBhInxUjhSrKSXzEIo42ATvrbmunSRM3LPMySzkA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6510709-05d3-4fdb-f437-08deb0ae375e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 05:12:23.2554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DcrCkBFngAnUjSeZwcfcuameUeOdnXPMuhK4E3aEcG66P2c7R5i8R96YkF8LUH6NLJBq0dIyCANz0gcKnkairg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8870
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

UmV2aWV3ZWQtYnk6IEplZXZhbiBCIDxqZWV2YW4uYkBpbnRlbC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFZpbGxlDQo+IFN5cmphbGENCj4gU2VudDog
VHVlc2RheSwgTWF5IDEyLCAyMDI2IDU6NTEgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCAwMS8yNV0gdGVzdHMva21zX2FzeW5j
X2ZsaXBzOiBVc2UgY29ycmVjdCBmb3JtYXRfbW9kDQo+IGxpc3QNCj4gDQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBrbXNfYXN5
bmNfZmxpcHMgaXMgdHJ5aW5nIHRvIGl0ZXJhdGUgdGhlIGFzeW5jIGZsaXAgZm9ybWF0L21vZGlm
aWVyIGxpc3QsIGJ1dCBpdA0KPiB0aGVuIG1pc3Rha2VubHkgbG9va3MgYXQgdGhlIG5vbi1hc3lu
YyBmb3JtYXQgbGlzdC4NCj4gUGljayB0aGUgZm9ybWF0IGZyb20gdGhlIGxpc3Qgd2UncmUgYWN0
dWFsbHkgaXRlcmF0aW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9rbXNfYXN5bmNf
ZmxpcHMuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jIGIvdGVz
dHMva21zX2FzeW5jX2ZsaXBzLmMgaW5kZXgNCj4gMzA1YmQ1MTkwNGNlLi4yYzM5NTc0YTA3OWIg
MTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jDQo+ICsrKyBiL3Rlc3RzL2tt
c19hc3luY19mbGlwcy5jDQo+IEBAIC0xMDI2LDcgKzEwMjYsNyBAQCBzdGF0aWMgdm9pZCBydW5f
dGVzdF93aXRoX21vZGlmaWVycyhkYXRhX3QgKmRhdGEsDQo+IHZvaWQgKCp0ZXN0KShkYXRhX3Qg
KikpDQo+ICAJCWZvciAoaW50IGkgPSAwOyBpIDwgZGF0YS0+cGxhbmUtPmFzeW5jX2Zvcm1hdF9t
b2RfY291bnQ7IGkrKykgew0KPiAgCQkJdWludDY0X3QgbW9kaWZpZXIgPSBkYXRhLT5wbGFuZS0+
YXN5bmNfbW9kaWZpZXJzW2ldOw0KPiANCj4gLQkJCWlmIChkYXRhLT5wbGFuZS0+Zm9ybWF0c1tp
XSAhPQ0KPiBEUk1fRk9STUFUX1hSR0I4ODg4KQ0KPiArCQkJaWYgKGRhdGEtPnBsYW5lLT5hc3lu
Y19mb3JtYXRzW2ldICE9DQo+IERSTV9GT1JNQVRfWFJHQjg4ODgpDQo+ICAJCQkJY29udGludWU7
DQo+IA0KPiAgCQkJaWYgKG1vZGlmaWVyID09IERSTV9GT1JNQVRfTU9EX0xJTkVBUikNCj4gLS0N
Cj4gMi41Mi4wDQoNCg==
