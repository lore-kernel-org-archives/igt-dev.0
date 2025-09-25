Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C3BCAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 05:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4A410E26B;
	Thu, 25 Sep 2025 05:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7mocDbC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D30D10E26B
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 05:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758777544; x=1790313544;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tf37HUx9xh3KAiDh6Y+L3t/4PmUOuxZDuRjN7LRT/TE=;
 b=U7mocDbC1u7J3mPIKDZyoLYqU8pPxqdIJB6nt82reoMWkzXhG0+zypQK
 Eqt26+Zv1D5+bmMSJ1mOriVOc/kX2Wv5evHVR+ue2sBgwGehdHjDhd1Om
 fWBNWBlxDFAwlDBjKqnB66e/uDvJwL26AYQyZrwQ/qmTT12YDb3TEDogP
 WrfigFmULOS+lceKEt1yq6qi5fyREhlcDeHBuDNPGXKcVhNLrLFjfmzas
 y7+kqzIBK4ApAeLyazszqrw5EQdOPHeRu6lKTnK0Jpxkwr2APZOzNLv6P
 AEQaEM2ITVzpTfKpWbIcaIpMPjII2EE41pwO3oSyOGDqlh+wptOtlpDZf w==;
X-CSE-ConnectionGUID: auGXTx9vT1CaD4SxZeSjmw==
X-CSE-MsgGUID: ELLbcrCTSbi99/mUfBAvfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64724824"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="64724824"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 22:19:03 -0700
X-CSE-ConnectionGUID: W4FI4KJyTy2b2LyB5Jn33g==
X-CSE-MsgGUID: 7EPObLGGRuyEaysUUi5vMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176375007"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 22:19:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 22:19:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 22:19:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 22:19:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=II6kGXzOnAV+s/I66E3zTF4G2wvPMfFZ4sWkmdJ9I5AKSCXlm31lDCKqkxddNzg2lBdwv3nYjx716WdTxSM52mbaOvsNr5GXyugYg8PN54TT0bTcnh5Mh3y260AcLaF/m786XobmAPPA+CBJfysS8dYWO3/7vrYo2O3mxQgt0SdegvgbrDze+UW6AlTrik+zmnYGUUmns/8fnHU2vBmDYjnZVMRqs0ios3dAFTLEInMY686javIaBmJ4xxTfYGt25+7bujK710Is0h3cjU7D+3Bcm78HkJ6vVkeFH2RAhYO6m/TZTcaUtmZ3SxG3DfGAmsRJhtP5309nO5VDVptXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tf37HUx9xh3KAiDh6Y+L3t/4PmUOuxZDuRjN7LRT/TE=;
 b=LeRi3DfRHvrJcoXkWyRRV88NkEhCOYQ5L6yvTSsSUqLmGcpIVhgBIXtYLwtsjoqAbtK+OhUVdoofDlBKQhcAIzL2SLAGb8ogtUyZEXRv8KhlbcwYVexBWlMbrF7QSO8PMy7eKSZ6AjH9d0N0HoZcotqXzuqPdxa0ULM1fNuUthS92utCCMvsAG+PqI29g87bJBogA7b93F725cWljv4rbHT3IfAF3jLwfrg/Pcity6NxIo84Mi3tMoontMMHJR54MCnDBRPerw22L5fy8fRnPoXkYt98oPTVHd3lbLeEiTEgIr0iOaUqykz2kF5vZ9Qlkxv5ocIQSXMguKCEVGn5tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB6327.namprd11.prod.outlook.com (2603:10b6:8:d1::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Thu, 25 Sep 2025 05:19:00 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:18:59 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] lib/igt_psr: Use 10x timeouts in simulation
 environment
Thread-Topic: [PATCH i-g-t] lib/igt_psr: Use 10x timeouts in simulation
 environment
Thread-Index: AQHcLdbAikXZTWkBT0CPj5qKvkY/37SjW/5w
Date: Thu, 25 Sep 2025 05:18:59 +0000
Message-ID: <DM4PR11MB63120EB5196D6450074ED984901FA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250925044136.3654614-1-jouni.hogander@intel.com>
In-Reply-To: <20250925044136.3654614-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB6327:EE_
x-ms-office365-filtering-correlation-id: 012b1175-5450-4956-1f57-08ddfbf308bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?aGFEUThCWW82R1doNnhYYVZyaEYxbjBXQTN3cmhBd2xMYnFYZXpNZm9NUjdl?=
 =?utf-8?B?VlBFck04ZzR5ZUJ3bmRlaFFTK2tLL1pPRDhPZXh4eTNkZjd1WEpnM2lydlph?=
 =?utf-8?B?Um1tVzk3VlhwU1dqTlpCY3I1YWJid3JrdThMR3ZUK2VUZjJIeXBmNFRQSjhW?=
 =?utf-8?B?QVNVVGxmYWJ1cG4xc1MweXFmOFZWS0FMbXRxaU85QkNzNEtvenRyMXc0aSt4?=
 =?utf-8?B?T3BRODNHdSsxeC94Q0VHNExlRXVQRmlpSGFLdnZ4NnJTTjlKM0NLVzJ5c1Ba?=
 =?utf-8?B?Y1g5MWtYT214MUFLUHR0eTlSRE8rNU1ZRkduMGRGVjR6QWFaam9iQldsaHhj?=
 =?utf-8?B?SEZaR3U3djM2dmt6eXIwcUE4T3RjM3BlcFY1cjVvUlkzTUNaYWtOV0xOTjRY?=
 =?utf-8?B?SlpYNzRKSmVFcWlwR2QrTVVQTWJNaXVNajFNQktDL0lOcjQrdDZHM2VINWtN?=
 =?utf-8?B?THRmalcySzErcWVNUnZXcXNZZWFCc3UwTXJSYm1jc1kxVjRsVWRpV1UrU0VX?=
 =?utf-8?B?c3pzK1dIbjhNVGp5NHFtM2psODlUdkFNN1FQcU80bkkrbUI5dXVRam10TGlZ?=
 =?utf-8?B?clptM2Q4RExGNHRKaWtydk5XYUFNVDJsR1hJNDdFN2RWSzlLSkpNMmFZN2Rs?=
 =?utf-8?B?M3p5SUUyaDdEWWdyQXRQMmhJMzRGc1hNYWtpYWRiM2VTaXJiK05TSTA0bHVk?=
 =?utf-8?B?KzY5WkhGQzNkVnByY3NSbG9kdE5OSGp0WWZRNm9idmpPbTQyWnUrVDFZb2xo?=
 =?utf-8?B?eENPcFk3UGdhRUl4aTFiZ29vcXBwUTl4UmJ3R2lDM0xhYkFVY0l1QWpLT0Vx?=
 =?utf-8?B?akRYT1IwaUJEazcrU3hheXFDc01SanZWQ0w0TFIxU1N3aEY0UjErZTlvT2VU?=
 =?utf-8?B?UFZ2ekNWalVjeThjS0dDTFE1Um92d28rSkxNU08yUE9JMUxDcEtqTGFYeXpK?=
 =?utf-8?B?ckZaZ2tVMlQ1bWVqaFBTZUV0LytHQjR6WW1pYUdzRVV2ZGpYU3FzemFUVVNG?=
 =?utf-8?B?QWN3VGlVZWtwV3NoZW5WZTd3OEIraCtJdkdrZS9rWTJmbmhuK25xbDRwSll3?=
 =?utf-8?B?LzVWRnhqN1ZRMFdxWUV6L0cwa3N4TEdrUGlydFJoN2VXc3lLQ29xK1FtdzQz?=
 =?utf-8?B?aFdJU21qeWpYUjZmNXB4blRtekdxcmh6d21PODlJZEtVdVJSd05ydzhMQVlw?=
 =?utf-8?B?ZlpqVEloeHpkY1JnREJsSE5zcGZnYVJiRmN1MWZDTkczbUF6MTZnZ0VNNTFr?=
 =?utf-8?B?N3BCa2xHc1dadUJGYWJkM3UrRTdTOHBwQnE2dmF0N3pzaDJnM0dEdjJiWDdv?=
 =?utf-8?B?OHNUaEFCT1ozeDhmQkZjbkZXQlp0aTlxUzJCVWRKdSs0emk2Vml1cW1tSHh6?=
 =?utf-8?B?NHZNbFMvZFVpOVlEbDZkTWZZbStkQlNycy9yS0Rtc1FJOFFzYnlWVGcrUFAr?=
 =?utf-8?B?bjkvaVJtZTcwa24zbmNmcjhzSU44RFdWaXVGNWxBNHptV0ZBRWx0amZ5d2RR?=
 =?utf-8?B?Wk5kUElEczY3TzdBV0NBMzBJczRaVkNkc2NBZGtCbkRWMWFIbmZoakhKeWQx?=
 =?utf-8?B?RzRJVUYyZ3dVNzRBZjEyVllncllhaDdnZ0F5Mk45bmtyMGo2eGNua1ZoQUhX?=
 =?utf-8?B?WTlTeEVVYlh0OHNoVmkxaXNwNGVlOWplMGR5eEYrem0yQnJoRVdPWXo2NWYx?=
 =?utf-8?B?dHYwRzJ5OTY2aWN1NWwwL3RJL2FydmxLNkRlVWlTU3djQ2tacm02U0puclZY?=
 =?utf-8?B?cHl0R1JVYitNcFI1QlFSa3ZXMUhqckkvbUdaNW9ZYTlPalk1cjJodUVsQnR4?=
 =?utf-8?B?YTJmUG5HSWhlS1duaE5xcHp3VFVlb21MOVkyWEpkZGV1ZGo0NGU3MXh6ejUy?=
 =?utf-8?B?eGxVZUpoYmYrN0x6S0hOSTRQOEdUYkRsTEN4WFhaMEROYk85RWQ1SEtCaHYr?=
 =?utf-8?B?YUdtNEtLSkoxVHM0TnBmTklac2F2WnJ2UXBYUk0vUGRLQmJBeERhaU5Gd1dX?=
 =?utf-8?Q?Bj5+9oJlV25jhvzh2hE1+xOir3Timw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFB6NGhncFlUWmJjOFZiRFZoaDRPUXNqekxCUFl3YVF5ckdqUGlkUG9UQStS?=
 =?utf-8?B?b2F5ZzUvU24yVUxRYkZSR3FsRWZLdXJKbG8zS3RTWncyTnF2MStiU2hpMzl1?=
 =?utf-8?B?L3I5cmVPZWZtMXJYeEpxMHNRSXVhSFFvRmtRTnM1akNjSzlNem85c0thUE8y?=
 =?utf-8?B?dXJpZ1dScWJRRnFKbkpGM3RmRG9LbmNHdUg0Z1RiWVhUZHl5WlpjUlR4Y2NN?=
 =?utf-8?B?S3VIak1hSHk3ZzJoMEVPcmNzRCtmZUVEcXptTnBxQk9HRndVK3BsbmtFSXJr?=
 =?utf-8?B?K2dzUjdnK1B2QTNkNUI3dStKLy9KVG1SZ3U2UDQwd0lEaUs3M1kwUHlpR0o3?=
 =?utf-8?B?WEpmWG9WZE5OT2ppYzhPU0dwdVUxakhmV3NVYnJDQkwwRUFIdlBsWm9PUnl1?=
 =?utf-8?B?eXc4SkZXdm5uelhsWFFGU1hsd1FxVThJZlpWREhISU1NM3VYU0FVRVlXbHBx?=
 =?utf-8?B?dFlPcHB4bGFxWE1kSklZSWg5Z0pJMVk2MUtxbG1XVWdoT1hZdytWaFpxVXNt?=
 =?utf-8?B?N3hnRGVDejUrdlFGRm02RnRLNG9LanVGSE1IdFgvTlRKMHhUUFNIQnNrS3or?=
 =?utf-8?B?ditUN29iUXVFcWs3ZzdsZVp5VkJ2RTI4UVB5c3MzSXRJNllpQzJkaXdRa2Jl?=
 =?utf-8?B?MnA4bm5rNWRaOC9VSGx0NGVJS1JkSGYrdm0yZ2F5L0lXZnpodVZaWHJiVXZ3?=
 =?utf-8?B?R2Z4ZUZpM0ZIaWo5ZmxPdjh5Z21MVkhTZXJIaUM0SFQraVFyTXZhRTRZMFN2?=
 =?utf-8?B?SldmTURqYk4wQjh3NEUyWS9JRldZdHJ2bTByZEErWXlCL2Q1cGlIU1BtdlI3?=
 =?utf-8?B?ZkFybCtjbkV4ay9CaURpRkQwc0lQbFR5VE9HUVNVcGJaL0tPZ1lIa0RjeFhz?=
 =?utf-8?B?bEtxTTdtcE1CcFpwNkJCL1dMTEJuaCtwT1dHallEN0RCbzYzcmtKQXFWa0Jj?=
 =?utf-8?B?c0RQUHprdDFqT29aMjczY3AvNlBkNG5qOGY4Y0g4R0Y5Uy94SUhWbHZEV1Rx?=
 =?utf-8?B?YzRqU0Vob1RzWXg4SEppcCsybGl3NlFSZSsvUDFuOHQ2SU1XYkQxWFpkOUhr?=
 =?utf-8?B?cGpiclRGRFdsVG5KNFU2ekx3VmZhK29QK0xkV01ibEJTSTduOVA3M1p1ek1K?=
 =?utf-8?B?UzlWMll3ZTdBbEZyeFBZVjJWWnNnTGZUTWtMVDA5MFArMXFZeUc1aTBBejJ5?=
 =?utf-8?B?SzdFMVlwL1U0UFFVSTVWL0t5dGZLZmRWc0FMbCt3WnVJQ3RHUzY3OGNJT0s1?=
 =?utf-8?B?YW5ZKzdHemxsRkFDZjFENHJEREVGUUdTRWtvbWJ5a1BvRlhCVmEwU0sraXhk?=
 =?utf-8?B?eExhVHQ4TkYrRjA2UjlMQTBYQ0xxRXc1ZGNCL2xaVFRoYmxoMDdZYXVLbE5l?=
 =?utf-8?B?QUl6OHAzd1o4R3dTV2RpaFVqcysyWjB3N01FTXE1Q21Va09YRXV5SVVGVncx?=
 =?utf-8?B?OWVmdzhZanBCbHJINHM0K09DckhsMHZ4dXBzRDdtRnVXNzVWOFdHQ2hDaEdM?=
 =?utf-8?B?MXhUMldITXR4K2I5VDNRWDdNTFN6R0c5Zzg3M2Z5b2pTUFN1UUQzZ2huWGFL?=
 =?utf-8?B?NFV1bjQ0MVVseWxGWUN4MFpSWjBYaFQ1Tkd2K29vYy9RVkdxbVc1Rmwzd1Y4?=
 =?utf-8?B?OEZ5U0QzZk5RRTcyYkZDWnRxS3Q0OHFUbWFoVDZwUXJQaHJKMEVzdittSk5t?=
 =?utf-8?B?TFAzZm1tTm85WmpGMmlEMHlUWmZwVHZPdjgzODdOOWw3NEROUTdRZHlONjVE?=
 =?utf-8?B?aUt4WWFsUzlnbW1oZDRwUFNvUmM1K1BhOTVZYjRCOXFXZ0cvbzFPRDBRQ205?=
 =?utf-8?B?Ny81azZIdkdKVFBqV0hibFM2OEZ6eVk5amtpcjQ2RXFMajg5TFFna1VObHhU?=
 =?utf-8?B?ZWpOWnlRT3NSRzNpTXJUZ1lhc09EMzE1SnZ1SFNpTzlpRTUydzcyeVhTR0pq?=
 =?utf-8?B?dTZWME4ySEQ4ajJhb2FmSWZsNnJ3MC9iaEhBd2NTbElZRGFDOWhPZktrd29H?=
 =?utf-8?B?Ym5KeXZPOU1SMzFNSS9kRFNacVRWdEZoVzNZREFINVdDcFpNZEV4UjhwZjQ1?=
 =?utf-8?B?ZFJHZ0pUUklsQVhmenRLRjZYNzdyMXZUM2xIcnlTS3IxRXRrZjlxZXhqeXhQ?=
 =?utf-8?Q?x2Ug=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012b1175-5450-4956-1f57-08ddfbf308bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 05:18:59.8341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ARGquuj6DBDyVKu9Y2tK25cVsgGe7MSEGybKSZSLci0JCPAJ8LTrTmzCbCBO1vBsK5ORqSxURAZoW1FyRhV1Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6327
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

TEdUTS4gDQoNClJldmlld2VkLWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhvZ2FuZGVyLCBKb3VuaSA8am91
bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI1LCAy
MDI1IDEwOjEyIEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
QiwgSmVldmFuIDxqZWV2YW4uYkBpbnRlbC5jb20+OyBIb2dhbmRlciwgSm91bmkNCj4gPGpvdW5p
LmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10XSBsaWIvaWd0X3Bz
cjogVXNlIDEweCB0aW1lb3V0cyBpbiBzaW11bGF0aW9uIGVudmlyb25tZW50DQo+IA0KPiBQU1Ig
dGVzdHMgYXJlIHRpbWVvdXRpbmcgaW4gc2ltdWxhdGlvbiBlbnZpcm9ubWVudC4gVXNlIDEwIGFz
IGEgbXVsdGlwbGllciBmb3INCj4gdGltZW91dHMgaW4gc2ltdWxhdGlvbiBlbnZpcm9ubWVudC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3RfcHNyLmMgfCAxMiArKysrKysrLS0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMgaW5kZXggZDViNDE5OGMzLi5j
MDMwNDI4OTkgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfcHNyLmMNCj4gKysrIGIvbGliL2lndF9w
c3IuYw0KPiBAQCAtMTM2LDEyICsxMzYsMTQgQEAgc3RhdGljIGJvb2wgcHNyX2FjdGl2ZV9jaGVj
ayhpbnQgZGVidWdmc19mZCwgZW51bQ0KPiBwc3JfbW9kZSBtb2RlLCBpZ3Rfb3V0cHV0X3QgKm8N
Cj4gIAlyZXR1cm4gYWN0aXZlOw0KPiAgfQ0KPiANCj4gKyNkZWZpbmUgUFNSX1RJTUVPVVQodGlt
ZW91dCkJKGlndF9ydW5faW5fc2ltdWxhdGlvbigpID8gMTAgOiAxICoNCj4gKHRpbWVvdXQpKQ0K
PiArDQo+ICAvKg0KPiAgICogRm9yIFBTUjEsIHdlIHdhaXQgdW50aWwgUFNSIGlzIGFjdGl2ZS4g
V2Ugd2FpdCB1bnRpbCBERUVQX1NMRUVQIGZvciBQU1IyLg0KPiAgICovDQo+ICBib29sIHBzcl93
YWl0X2VudHJ5KGludCBkZWJ1Z2ZzX2ZkLCBlbnVtIHBzcl9tb2RlIG1vZGUsIGlndF9vdXRwdXRf
dA0KPiAqb3V0cHV0KSAgew0KPiAtCXJldHVybiBpZ3Rfd2FpdChwc3JfYWN0aXZlX2NoZWNrKGRl
YnVnZnNfZmQsIG1vZGUsIG91dHB1dCksIDUwMCwNCj4gMjApOw0KPiArCXJldHVybiBpZ3Rfd2Fp
dChwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQsIG1vZGUsIG91dHB1dCksDQo+ICtQU1JfVElN
RU9VVCg1MDApLCAyMCk7DQo+ICB9DQo+IA0KPiAgYm9vbCBwc3Jfd2FpdF91cGRhdGUoaW50IGRl
YnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dF90DQo+ICpvdXRwdXQpIEBA
IC0xNTMsOSArMTU1LDkgQEAgYm9vbCBwc3Jfd2FpdF91cGRhdGUoaW50IGRlYnVnZnNfZmQsIGVu
dW0NCj4gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dF90ICpvdXRwdXQpDQo+ICAJICovDQo+ICAJ
aWYgKG91dHB1dCAhPSBOVUxMICYmDQo+ICAJICAgIG91dHB1dC0+Y29uZmlnLmNvbm5lY3Rvci0+
Y29ubmVjdG9yX3R5cGUgPT0NCj4gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0KQ0KPiAt
CQlyZXR1cm4gaWd0X3dhaXQocHNyX2FjdGl2ZV9jaGVjayhkZWJ1Z2ZzX2ZkLCBtb2RlLCBvdXRw
dXQpLA0KPiA0MCwgMSk7DQo+ICsJCXJldHVybiBpZ3Rfd2FpdChwc3JfYWN0aXZlX2NoZWNrKGRl
YnVnZnNfZmQsIG1vZGUsIG91dHB1dCksDQo+ICtQU1JfVElNRU9VVCg0MCksIDEpOw0KPiAgCWVs
c2UNCj4gLQkJcmV0dXJuIGlndF93YWl0KCFwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQsIG1v
ZGUsIG91dHB1dCksDQo+IDQwLCAxKTsNCj4gKwkJcmV0dXJuIGlndF93YWl0KCFwc3JfYWN0aXZl
X2NoZWNrKGRlYnVnZnNfZmQsIG1vZGUsIG91dHB1dCksDQo+ICtQU1JfVElNRU9VVCg0MCksIDEp
Ow0KPiAgfQ0KPiANCj4gIGJvb2wgcHNyX2xvbmdfd2FpdF91cGRhdGUoaW50IGRlYnVnZnNfZmQs
IGVudW0gcHNyX21vZGUgbW9kZSwNCj4gaWd0X291dHB1dF90ICpvdXRwdXQpIEBAIC0xNjcsOSAr
MTY5LDkgQEAgYm9vbCBwc3JfbG9uZ193YWl0X3VwZGF0ZShpbnQNCj4gZGVidWdmc19mZCwgZW51
bSBwc3JfbW9kZSBtb2RlLCBpZ3Rfb3V0cHV0X3QgKm91dHANCj4gIAkgKi8NCj4gIAlpZiAob3V0
cHV0ICE9IE5VTEwgJiYNCj4gIAkgICAgb3V0cHV0LT5jb25maWcuY29ubmVjdG9yLT5jb25uZWN0
b3JfdHlwZSA9PQ0KPiBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQpDQo+IC0JCXJldHVy
biBpZ3Rfd2FpdChwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQsIG1vZGUsIG91dHB1dCksDQo+
IDUwMCwgMSk7DQo+ICsJCXJldHVybiBpZ3Rfd2FpdChwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNf
ZmQsIG1vZGUsIG91dHB1dCksDQo+ICtQU1JfVElNRU9VVCg1MDApLCAxKTsNCj4gIAllbHNlDQo+
IC0JCXJldHVybiBpZ3Rfd2FpdCghcHNyX2FjdGl2ZV9jaGVjayhkZWJ1Z2ZzX2ZkLCBtb2RlLCBv
dXRwdXQpLA0KPiA1MDAsIDEpOw0KPiArCQlyZXR1cm4gaWd0X3dhaXQoIXBzcl9hY3RpdmVfY2hl
Y2soZGVidWdmc19mZCwgbW9kZSwgb3V0cHV0KSwNCj4gK1BTUl9USU1FT1VUKDUwMCksIDEpOw0K
PiAgfQ0KPiANCj4gIHN0YXRpYyBzc2l6ZV90IHBzcl93cml0ZShpbnQgZGVidWdmc19mZCwgY29u
c3QgY2hhciAqYnVmLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gLS0NCj4gMi40My4wDQoNCg==
