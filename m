Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C4DCA6016
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 22:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C685F10EA2E;
	Thu,  8 Oct 2026 22:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elZzPT9o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8325310FDA0
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 22:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791497959; x=1823033959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9lM8i7pTK9iT3ignKQeXhvKhdt9GYVO4ETb3dVOGoSI=;
 b=elZzPT9oOUrlmauswB5JTgUXH7LOvdMVGEXHbD5ocymPjgwqGk7nM51H
 rz4PV7gT7ujh+EUYsO4rRK1dysKQMuf1v9qCkwtwrYzwKbEgeaei/0b9U
 ad4ahFQJLW2s6R7JQYWKnDFC/z/sgfDzFZwcCI7ChtpEMmtEruws062bv
 aQ/T7ckeZmOoWUMnsz16ShUnaWA1YqE8WqP+GPe445b6GDs1xpGo+U/g0
 qDelVan++CivRyb7ThB/vXQxByBXo/sNfgzEUW3waAIYZsCfs6aXcsBXr
 fUFp5d4A73Hkv4yr6rj3eTTrKU1BxMq85ejEQy6pFrAy9ojTiK03wJyKS A==;
X-CSE-ConnectionGUID: MrMtrsTxTQidqrA3fDj24w==
X-CSE-MsgGUID: koU6ulaJQU+qm01/fV6eyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="302668"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="302668"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 15:19:19 -0700
X-CSE-ConnectionGUID: WZ7QzpnAT7W+FHalY2X/ug==
X-CSE-MsgGUID: JmpcDj0EShWU6KHqyaeEYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="519070"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 15:19:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:19:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 15:19:03 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:19:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIplENCgNtFu6tLX4WA9Ptp0eowwA1hOMX1nXtRmQUo8M6T4oB/LT0hqQnwpVzwkGT+HuLbmpbZtBLvHw/GG84kfYXmuXfMb9rJhHByRAOJKJ5GTWE+Db8dZwjKkBGtVcN8bvmIwMDHYs9tNjQqrF8xEHXj62SVA0C92Feo5zSsQApIPAmauDoEgrMJwB80zuBOQzpBn/p906rPhp2WLY8qI/n9dqR0bBGOX/KRH53raN7AA4+9rFfSqKJ8mqyEKX6oNHCOe/SM/fDWShMw+4mC4kAmoFspM+TPJo/pW1Mt5b7QFCXn9l3HbhiN6l3EvflWgCj0cbzi64lccEPPdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lM8i7pTK9iT3ignKQeXhvKhdt9GYVO4ETb3dVOGoSI=;
 b=F00SGd7xFWOy28P6iRq7Tc3lHjQ9eQr5R64r2A41uve3Qb01yD6GRnwEAkSWjfD9xzntqAoVPtqKQ1ClbaztwQfzfQ7HKfZoIpLB2tyKvMHFCX4MRHbLiQejSDTQomNRlIaN0D0CfrJIJd+7FVUgLDaa7lcajvarQChu4atpsMmjymEZ3jJvW1Fbe/7lMlBxbFV6+Xop+tVY6XxGC5hsTjJYSUnu0VQp/cSjxUaXUnzT5YClSGK+NNP8r9OfX2UmRLb9oFNgY+BIuHdG/oAJQENJeSmUYwUofvJWZ8FL1M7/GcM+Jt7cMEHQbAZ81CHivZmW5wxz65CjQD71MzROFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 22:19:01 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 22:19:01 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/4] tests/intel/xe_exec_reset: Fix gt reset fault dmesg
 ignore regex
Thread-Topic: [PATCH 1/4] tests/intel/xe_exec_reset: Fix gt reset fault dmesg
 ignore regex
Thread-Index: AQHdVp+9QaW2ybqbl0aThkK0hNRHc7bzwCiAgAB0FEA=
Date: Thu, 8 Oct 2026 22:19:01 +0000
Message-ID: <DM4PR11MB5456E0CE75A829C8AF64B2BBEA932@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
 <20261007210603.1350158-2-shuicheng.lin@intel.com>
 <20261008150715.6eisnh7fxuyj7krj@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20261008150715.6eisnh7fxuyj7krj@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CH3PR11MB8562:EE_
x-ms-office365-filtering-correlation-id: bf948a79-dbf6-42a3-0665-08df258a27a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|22082099003|18002099003|4143699003|10067099003|11063799006|38070700021|56012099006;
x-microsoft-antispam-message-info: 0Nx25Gux7K0SbiooyAuw/JHjSGadQVvJQNf5Hl/B1LXaNQX+qYH2K7xpBePnv4DxiF3vJ7/C/MImOVwHuL6jwP/oLkvNRhZb7N125YURiH0SZ6nkZx/l7LPuxh1ziNoSeiFFA/TTjEV1vZQahgETXzwpM63Zg+U1j9iZC5flkTH3NpFsYVFLDSDiLxBNoTrDkPzWfF1Nw2N5coPeDhXAQey1iuYyVDhpZoxW7HaM3IcIhTg/4rykSssRyFQgt19c3YI2iXGHF3HgL6U5eIDKYVV2hEoL8CzK4X066kSlMmMZDjizYkmDrByMNgeHxoyouLxOJl2Ks08Ib72E2PHo1egxXE9K7GggBbNXjEedWJxwyAhUGhlmvojbpDHUblmNaG796AAXySUFqLH4JBQ4mehv6bESLYy/YO+U+sVAIL6i0BZOTD4fhiHVj7rX64uSLrnS/A/jeFFbRAf3EsxTE5v1bHlBJk+OtQvtGkap3hLtbBE0cbEg0BjbZ8S4U4nmSlvV06+gvIBo+mjwVYxNx2sBNQ7AQKHVgW84M9EGIzWEOLzw/ZJBv3nbHBMrRe9cwqt0G1kOWR/QKVW1Cfjlm0V80u6HNM4aOYFPBCIOzuriEhfDw+Y0Q5j/rp1S0kIMyYfTcJAsrQa+6QACtSXW11lppkGe00KsrTsRIIo8tOq4DpiW2BYBopRuGy+xCyPEuiLx3ABU996J800paiW0RboQBdNgPTGAPBRFkM39wJs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHBmd0JRdkVyZ2RrRDAyd0VYeTRCQXpHcnc4Vi9NcW9DTjZUczdKQkZYNnk4?=
 =?utf-8?B?UjJPdWNWQkZxcUlMUk1pT3JqUUpEZDgrOW1pL3ZSemthZEpYb3FzNCtweU1s?=
 =?utf-8?B?dStyblo1NWpEY0RxcUh3OTBxMFhab2pkMEtFNys0SmVqRlZHdExEdGZrQUtt?=
 =?utf-8?B?cFVLbVRiM0Q0VkNDNFkwcDEwczF4T09hV3ZXR2Mwb0pRay9wRmhCZ3NtYXJ1?=
 =?utf-8?B?U1JpeHgzaDd5TmdzdWFaN2tOY3NZOExuVzRYUC9nb1RncFBqRHRKOWVPZ3Zy?=
 =?utf-8?B?aTIrZW9GYkFLNzNUWGI2T3pYclUwdXBkTlpTcERFRHhHZnRldks3SDBGUzR6?=
 =?utf-8?B?Q2FrZWpKUWNmU1MwZmFmMTRrWEszR0dwNllQQnlOSmsxZWpsUnJUQzJpcGcw?=
 =?utf-8?B?WHlTUUxUNTc2YTlTTFY5SHM3MTVLb29LZlQvd3c2Q2NKbnFqdGhDTStQbGlX?=
 =?utf-8?B?eHZGb1NVM3huSm5KQnp5ZnlTUHVDNUc1LzBTdkV6MFdHeFRwL0VXWGRHZkdS?=
 =?utf-8?B?QjFITXlBYTVianBPaHlaakppTndDLzVZS2hWdWVseFN1L3BDS3FCWG9NOVQy?=
 =?utf-8?B?S1RkVXRJZmtpaWJIeWtZUjd4QzlSZmlqcFd5M040TDNwT0gzcDVudzcvamNm?=
 =?utf-8?B?Sno4b003N1BCUUhTK0MwTGRoS1ZOd3RUNGErbHZoWWdMVzk3OUdQMW92MGFr?=
 =?utf-8?B?S0QvWTJvVGkrYmh0NXhSMFFWSVpHRXhOVG5Hbk5KS0FnaG1LQnV2RHo2YXpJ?=
 =?utf-8?B?QzJOV3FxNlJCQ0hIV3RxMHY3UlNneTAxNk1LMjNNWVlEYWE3VDUwQ0MwbnJT?=
 =?utf-8?B?dFloalgzY3lVYXJ2NFRzaFVZKzBtU3lJN2RDbk8yTzVOMWkyVTRMaU1mTWpx?=
 =?utf-8?B?M0JVVTY3UGlQMHZhUnRZdDdYenl2ZStlcUNEYlBqc2kybGJ0WElFaGFvcmNj?=
 =?utf-8?B?a3dqY1RZOGRuUVVuWDZpUUF1OXdvRm5sR05xNGV0cUJ0dEtSZjM0WndZSEJC?=
 =?utf-8?B?ODBRNEpndmNxQ1RWM3pnaUM1bW9hc2w0ZzRiMk1HNVpxdXNGS010WDBRSVpI?=
 =?utf-8?B?d2ZSTTg1RU9ZU3kvQ3RCc1R3aWZiSHpsVkwwOHp2VlAxUDZoMk9HeEJhRVQx?=
 =?utf-8?B?WkUvdS9BRGdkdE1GdXdaS3BWelhxU05hb0toY0FTc2JzZkluR0c4UnJGS2gv?=
 =?utf-8?B?aC9MUVRjY1pqbnkzaFdEd0dFbmFrUUIyTUVYK3YxK3hWVFRucVNxZkliRVZ4?=
 =?utf-8?B?VG11SmRrbytJOHFRK1J2QkE0TVpIL3ZwQkpwVXJhZEp3UzRRQ2dFbzJIZFB5?=
 =?utf-8?B?UFBNTnJuNkFNNzBOUDJXODFWcC84azdJYXZndDJIb0lNMm8zdHdXUkVUWk05?=
 =?utf-8?B?WVkzczFhL0xCaWs2WkdzV3JRYmNleWJvamhNdEFIWUxqSkk1cFVZWG9mK1BL?=
 =?utf-8?B?Z0V2ekpaVGVPQ1hiS0dObndYMGpZcFJUbDZ3elpjNDRJd3dSOXNVTE5kclA3?=
 =?utf-8?B?Q1RyOFRHYmdMN1AvdFBUeVhVa0lFUUpDNnVUZHdkRjJjVGtFYnpCWkgvclhs?=
 =?utf-8?B?SmtJZW1ENzN3M1FUMXVlbmp5YWtQdHJNaWdNS1BBK1BUcERoNm9qZzN3U21I?=
 =?utf-8?B?RVpGWE9MRk9hUG10QnRRMGsrNVllaVBpVmpyQzhieHdVaUFISkNDMDhpakQx?=
 =?utf-8?B?THpyck1NdWt1Q3ZEWExnNWFqRWVmSWhGRjBDVGprYmxWY2VpcGF1MzdPMGk4?=
 =?utf-8?B?VDFFOFAzVkJZdVFsdnJnUDFHS0FEMUIxdDJ2ZVEzZE9wTndzZmZ5NnVPaTZl?=
 =?utf-8?B?cWJsa2JWemhvM0c2bzZzR0FTNklqRk41aWZSOHJpSzVtUkF6QWxFYi9qZzRC?=
 =?utf-8?B?TTNJbURMT3U1clYzbU5BdFFxRklUN243dHBadUZXdEZVOC9vMlFLclpwSm84?=
 =?utf-8?B?VTlwZGcxU3NuaW01QVJUWThJb1ZzaHAwRUw1ZVZCL1B1a3Ricjc4UkROa2xi?=
 =?utf-8?B?UHZvV1ljNWsxK0lidjk5Q0ZRUGxNUHN6cFpGSk5jUEVUWGNIT29lYnArL2JZ?=
 =?utf-8?B?aHR5bU1YdE9XNEVNNWgyeXFTRm4rWkp4SW9JTldISzZUdFl3ejZHYkljMWxP?=
 =?utf-8?B?UHFOV2JzWVRkQzNHbVh1NFh2eFY3SjJDZlIrWldtbndzSkpVakI5SFlIV3l4?=
 =?utf-8?B?ejZNeFFMUXVSMXhheFY5SGtuZmh6TzQ1ZXphYXdCL1p4VldGQjF5WVN6WXVy?=
 =?utf-8?B?Zm5MdUxlWHFWcFM1bmsyUWthbmVnT2NWU0hSeERpNjlRU3hkMjQwejVMS1JH?=
 =?utf-8?B?R3J0OHNuRmc5SmpWc2NHM2dDUDZYQ25nTEdtKzV0RlAxUm1sdjZzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CSf/XUuR2Wza1WBet456a4DrJmMqqLpgaBLbZeiosYVjf1XESnSxQYeQhBKn3d8Ozpcrs+PPjurmhZlfYsN86Oxp8K5/C8kSPN1BjRq14LYx5AsN2FKAkCRa8kOw2UDlV/AgNe2T4O6IxuElVepn/tZhAx7Fm2YaodYrt1uCNaozTQwGZoNWWf39otFAuiNt8w4RsvRuTcHEoE7cqIFAj2kxX7Yt4ZUsXyZMgsDpAP/Kc8T+JdlzYQO4mVmdGjMGNKkft0BBv+odvuPtrAGUqGun0JOrss05AFIFL/Zb2ZxGdh6wRC7M0k6rQcttMTxy9sCH3Ye3bzbZxMGnPtdO2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf948a79-dbf6-42a3-0665-08df258a27a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:19:01.0812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjwQ+nuFt+8gjkiPePOiH9/s2YjO0qTI69KBDAhpsKo1FWXxv1QKFo2wD1FGB5LszPobKd2RHDcLdswqX9XKNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
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

SGkgS2FtaWwsDQpPbiBUaHUsIE9jdCA4LCAyMDI2IDg6MDcgQU0gS2FtaWwgS29uaWVjem55IHdy
b3RlOg0KPiBIaSBTaHVpY2hlbmcsDQo+IE9uIDIwMjYtMTAtMDcgYXQgMjE6MDY6MDAgKzAwMDAs
IFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID4gaWd0X2VtaXRfaWdub3JlX2RtZXNnX3JlZ2V4KCkg
cGFzc2VzIHRoZSByZWdleCB0byBpZ3RfcnVubmVyIHRocm91Z2gNCj4gPiAvZGV2L2ttc2csIGFu
ZCB0aGUga2VybmVsIGVzY2FwZXMgJ1wnIGFzICJceDVjIiBpbiBrbXNnIHJlY29yZHMuDQo+ID4g
aWd0X3J1bm5lciBjb21waWxlcyB0aGUgaWdub3JlIHJlZ2V4IGZyb20gdGhlIGVzY2FwZWQgcmVj
b3JkLCBzbw0KPiA+ICJcKC1FQ0FOQ0VMRURcKSIgdHVybnMgaW50byAiXHg1YygtRUNBTkNFTEVE
XHg1YykiLCB3aGljaCByZXF1aXJlcyBhDQo+ID4gbGl0ZXJhbCBiYWNrc2xhc2ggYW5kIG5ldmVy
IG1hdGNoZXMuIEFzIGEgcmVzdWx0IHRoZSBleHBlY3RlZA0KPiA+ICIoLUVDQU5DRUxFRCkgLi4u
IEdUOiByZXNldCBmYWlsZWQiIGFuZCAiKC1FSU8pIFdFREdFRCIgZXJyb3JzIGFyZQ0KPiA+IHJl
cG9ydGVkIGFzIGRtZXNnLXdhcm4vZG1lc2ctZmFpbCBpbiBndC1yZXNldC1mYXVsdC1pbmplY3Rp
b24uDQo+ID4NCj4gPiBVc2UgYnJhY2tldCBleHByZXNzaW9ucyBmb3IgdGhlIGxpdGVyYWwgcGFy
ZW50aGVzZXMgc28gdGhlIHJlZ2V4DQo+ID4gc3Vydml2ZXMga21zZyBlc2NhcGluZy4NCj4gPg0K
PiA+IENjOiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gPiBDYzog
Sm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiA+IC0tLQ0K
PiA+ICB0ZXN0cy9pbnRlbC94ZV9leGVjX3Jlc2V0LmMgfCAxMSArKysrKysrKy0tLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQuYyBiL3Rlc3RzL2ludGVsL3hl
X2V4ZWNfcmVzZXQuYw0KPiA+IGluZGV4IDUwNzcxYWY1My4uOTAxY2UyZjNmIDEwMDY0NA0KPiA+
IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVs
L3hlX2V4ZWNfcmVzZXQuYw0KPiA+IEBAIC05MjgsMTIgKzkyOCwxNyBAQCBzdGF0aWMgaW50IHRy
eV92bV9jcmVhdGUoaW50IGZkKQ0KPiA+DQo+ID4gIHN0YXRpYyB2b2lkIGlnbm9yZV9ndF9yZXNl
dF9mYXVsdF9kbWVzZyh2b2lkKSAgew0KPiA+IC0JaWd0X2VtaXRfaWdub3JlX2RtZXNnX3JlZ2V4
KCJcXCgtRUNBTkNFTEVEXFwpIC4qIEdUOiByZXNldCBmYWlsZWQiDQo+ID4gLQkJCQkgICAgInxc
XCgtRUlPXFwpIFdFREdFRDogRGV2aWNlIGRlY2xhcmVkDQo+IHdlZGdlZCINCj4gPiArCS8qDQo+
ID4gKwkgKiBUaGUgcmVnZXggaXMgcGFzc2VkIHRvIGlndF9ydW5uZXIgdGhyb3VnaCAvZGV2L2tt
c2csIHdoaWNoDQo+IGVzY2FwZXMNCj4gPiArCSAqICdcXCcgYXMgIlxceDVjIiwgc28gdXNlIGJy
YWNrZXQgZXhwcmVzc2lvbnMgaW5zdGVhZCBvZiBiYWNrc2xhc2gNCj4gPiArCSAqIGVzY2FwZXMg
Zm9yIGxpdGVyYWwgcGFyZW50aGVzZXMuDQo+IA0KPiBNYXliZSB0aGlzIHNob3VsZCBiZSBhZGRl
ZCB0byB0aGlzIGxpYiBmdW5jdGlvbidzIGRlc2NyaXB0aW9uPw0KDQpXaXRoIHBhdGNoIDQsIGJh
Y2tzbGFzaCBpcyBhbHNvIHN1cHBvcnRlZCwgc28gSSdkIHJhdGhlciBub3QgYWRkIGl0IHRvIHRo
ZSBsaWIgZnVuY3Rpb24uDQpBbHNvIHdpdGggeW91ciBzaW1wbGVyIHJlZ2V4ZXMgdGhlIGNvbW1l
bnQgaXMgbm90IG5lZWRlZCBoZXJlIGVpdGhlci4NCkkgd2lsbCBkcm9wIGl0IGluIHYyLg0KDQo+
IA0KPiA+ICsJICovDQo+ID4gKwlpZ3RfZW1pdF9pZ25vcmVfZG1lc2dfcmVnZXgoIlsoXS1FQ0FO
Q0VMRURbKV0gLiogR1Q6IHJlc2V0IGZhaWxlZCINCj4gPiArCQkJCSAgICAifFsoXS1FSU9bKV0g
V0VER0VEOiBEZXZpY2UgZGVjbGFyZWQNCj4gd2VkZ2VkIg0KPiANCj4gT3IgZHJvcCBmaXJzdCAn
KCcgYW5kIHJlcGxhY2UgJyknIHdpdGggZG90PyBXaWxsIGJlIHNpbXBsZXI6DQoNCkFncmVlLiBU
aGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLg0KDQo+IA0KPiAJaWd0X2VtaXRfaWdub3JlX2RtZXNn
X3JlZ2V4KCItRUNBTkNFTEVELiogR1Q6IHJlc2V0IGZhaWxlZCINCj4gCQkJCSAgICAifC1FSU8u
IFdFREdFRDogRGV2aWNlIGRlY2xhcmVkIHdlZGdlZCINCj4gDQo+ID4gIAkJCQkgICAgInxJT0NU
THMgYW5kIGV4ZWN1dGlvbnMgYXJlIG5vdyBibG9ja2VkIg0KPiA+ICAJCQkJICAgICJ8Rm9yIHJl
Y292ZXJ5IHByb2NlZHVyZSwgcmVmZXIgdG8iDQo+ID4gIAkJCQkgICAgInxQbGVhc2UgZmlsZSBh
IF9uZXdfIGJ1ZyByZXBvcnQgYXQiDQo+ID4gLQkJCQkgICAgInxGYWlsZWQgdG8gaW52YWxpZGF0
ZSBHR1RUIFxcKC0NCj4gRU5PVFJFQ09WRVJBQkxFXFwpIg0KPiA+ICsJCQkJICAgICJ8RmFpbGVk
IHRvIGludmFsaWRhdGUgR0dUVCBbKF0tDQo+IEVOT1RSRUNPVkVSQUJMRVspXSINCj4gDQo+IEhl
cmUgYWxzbyBpbWhvIGl0IGNvdWxkIGJlIHNpbXBsZToNCj4gDQo+IAkJCQkgICAgInxGYWlsZWQg
dG8gaW52YWxpZGF0ZSBHR1RUIC4tDQo+IEVOT1RSRUNPVkVSQUJMRSINCg0KQWdyZWUuDQoNClRo
YW5rcywNClNodWljaGVuZw0KDQo+IA0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4g
IAkJCQkgICAgInxHUFUgSEFORyINCj4gPiAgCQkJCSAgICAifEZhaWxlZCB0byByZXNldCIpOw0K
PiA+ICB9DQo+ID4gLS0NCj4gPiAyLjQzLjANCj4gPg0K
