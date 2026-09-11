Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99A3C88E45
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 06:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC7A10E09A;
	Fri, 11 Sep 2026 06:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pjc3g39i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EC910E359;
 Fri, 11 Sep 2026 06:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789109779; x=1820645779;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LkxfA+txgGJioOPM/JPedMZeZxLG74ieDSrDIYc7f2Y=;
 b=Pjc3g39iKHu0o94D/RE8kKzMEa6d66X878c7MRgkzboR6950Qo8HsKkf
 wRRk2AIGxuxTogitMraaan9+xL+4QWa2MHOf+oaoKbn+IWE6Lt54wFB1h
 FNLehTZ0uq2WDu0Hw68gIjziZPNtY3/K9BTUT7sxbSZ+3fQmbnsLd2zIA
 DQFYwVBDohv625ZIZ0MATSD0SmzvHXODemsFuyWJdbTSt5mlsaUY7Q3rh
 mBuLgsWhf2MwaFC5nWIsrcDgGzKr/F7QUBTDcJottlnncMxi9IWW8ARIC
 eUfB9IoT+lo2YfottVWfijW6jZHvuLb6BDaYpvbMTXbwXtnWXug4EfrNm Q==;
X-CSE-ConnectionGUID: +0/LfKTxReyypBAw0l+MZw==
X-CSE-MsgGUID: TbdPRGmKTaq1n4eYmjp/mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="106939244"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="106939244"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:56:13 -0700
X-CSE-ConnectionGUID: LB3sUNxxTg+Ikb0d/4UbpQ==
X-CSE-MsgGUID: EIEOEeDOR9WwkSY85ZJeHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="272349367"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:56:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:56:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 23:56:12 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:56:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+MrJG9xuNHswlMAi7+us0MSHunadOMXiube/YzZiTT5X2icsxFqIy+7HzIzHNu8BOspumHHYmX7YRC66q6AEszkMQ1c++11L68wdDZ8owJN4HLRb9kRWs8k1r5POMbnVZkHMS6pN9kKkC+2zW2hmkqqzotTaP72s05HV+sTTJY7PuajtJtH0M+oAr3lcnyErWBQLAKGSW7+9zE1W6HK/JymLB85/xlIpeGFdmDv8f5RWoWbruAkfnMRvpOSP0+9RkJWINkjVil04/fKhJ1kGuPgfvuzFlYq5zITnalOuKdde84Pu2BP1E3YI9A+KBxxxoBzWitTE+EtQfDAaXj3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkxfA+txgGJioOPM/JPedMZeZxLG74ieDSrDIYc7f2Y=;
 b=ln0+g6V/hM2igPxhVBj5sWKeDI0aSmQVya2kwPOZgHhj+7ktqWaDiQ38cxXRuQagmxpbA78/Gcu8UFb9lU/1b4pmOIkcTKh4rCGYrrsjzCdivvMRAnum0zrMiu2xgmD5HNsvpbY7FiV25aRuErr99yjDzOyouyFeKVvCVtP654doOyTRXtMjhQ3aAsIw3836Jcxmgo78Be3UcBrMkgEHcyWAMvaqKBZ54d6ei1KyhpZt0qo7knb+KucM9ehZ+W2+9Eon9nLi37zdd+tw/pxJ+FR6ZutGGjsOtfzqZkN/pnAQc7oDlFA+uYUCpKzBKZXxY52JFPuptVYQdAZ0yBEmcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by CY8PR11MB7242.namprd11.prod.outlook.com (2603:10b6:930:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 06:56:07 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%5]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 06:56:07 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lndF9jb3Jl?=
 =?utf-8?Q?:_Make_build_reproducible?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBsaWIvaWd0X2NvcmU6IE1h?=
 =?utf-8?Q?ke_build_reproducible?=
Thread-Index: AQHdQRh9QQ7j2fIibkqGj6+TNfRui7bI3Zrg
Date: Fri, 11 Sep 2026 06:56:07 +0000
Message-ID: <CH0PR11MB549136D22168D502C4DF2E8DEFBE2@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20260909133320.71100-1-kamil.konieczny@linux.intel.com>
 <178898204040.144085.10572799684504177658@61270ab9df2a>
 <20260910113458.cjtjgyya7cyzlr4t@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260910113458.cjtjgyya7cyzlr4t@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|CY8PR11MB7242:EE_
x-ms-office365-filtering-correlation-id: c64162a8-d8a8-490b-9528-08df0fd1c113
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10070799003|13003099007|38070700021|6133799003|10067099003|4143699003|5023799004|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: hCAGtyoDJvUPcdQzPtATiN+r6ir7swHki1tTLByjWrhq+3nnGEWoCVlIFh3GFOK2jyjhtAZrT1GCyEsNx3bno8XpCBpBNxoP3JL+APP5QQQZ/Le0g9Bq40ol3YfaRcq5yBau+AzJdt3J27zBhSusS/s41mcbkYNHIzzP0j9q5C84onQwiXvLV0hCBk90H9lj9xPsx2aOqoNPljYp8RdKKkqX1NaA9aJINkTGvG5fRDlQ+0npAP/5FIjwLuv9T7gyHSJPd/WUEJs1IEe0WDfGfh0tcpnV/jPUjSJqBH++ZP1ixwsCOIemcwC16q5Czo17Lgx8FInZ1N8//8U1jz5idNB49GMzeN1kgoRbw+rzozgByuzRTOL/0Y68b1yk5h0Wr9M5YNml6sTFFF0oxfXdjofPimvb5ttqrgLejo7CWlye5XbxXr2a9cnKkmDJP+z05z/6MxZAJ96tKSOennjlgCWqk/E4CQoai9/dwlzN+GS2dHmcn9sH9iT9tNoO8XBF6nD8Uay7pLZCAvKfL21CSzCZjjj7kLtqOz45W87EzRmyiXZPEfW1Iw78mlQkVYPeoNhige3kUBT3P3aH5sA6FuXgLlv3iTT3mhMwbJNMNukBDFcMRx3PVkUDIAsUnuOs5L558vgbPrZIAmXyMOV5pQZOA8z1I6DEA0pS4anv7Yo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(13003099007)(38070700021)(6133799003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWpwa2VSQ2w2YWxUMldYRWZYZlBKNG1kMFJZbWlZelVLdzVyWEpzS0YvM2pn?=
 =?utf-8?B?U0czSE1jVm5Zc2tjR1hyMzVMWURBSnMwdEJjSWZuY0RJSktyRG9YYXc0Zmdv?=
 =?utf-8?B?SDhBZ0tQSnlqcCtlUjE1Z1ViZHRQZU5zV1VRUjN6TWZHNlYrTFBpZ0Ivb0lG?=
 =?utf-8?B?cUxlNXc4LzdkSTlSeVhjbFRPc053cDN3bTh5YU5TdDg5U2NjVHhhZ2xZb0ZO?=
 =?utf-8?B?QkxHcnB0ZVJtNHB1aGFXakVlNHdEQUVPeHlKbktzRkU2Z2pGYk5DN2p6bGRv?=
 =?utf-8?B?L1NjbVA3dndvUVN1dm1ad2NkK2dsZ01QMG56M1pWZVlWSmlnbENiRWVKYjNW?=
 =?utf-8?B?WVJ5enovc0RJVHQvb0p4eUtuRUUrM3JCZW1SNjV1dnB6RUQ3WlJ1a2trVElH?=
 =?utf-8?B?bi9XaWN0ODZpb1ZibkRsRlhsMjFNcEpNM3NLWkhvOFZoNWZtMWFiSHo0Q041?=
 =?utf-8?B?Zk9MZFJQMkpkQS9tWEJsUXN1b3N1enBCQjZFVVFMMFdRem8rSU1Lc0Y4S1lT?=
 =?utf-8?B?K2NiTks0MVVuTlNzOWpDbW9LaVZ1cU8yUThUWEVvQnBiOTZ2cnVocWtNRlFl?=
 =?utf-8?B?Um9Pb29lWHJKc05hSEwwU2lUSnU4YU5PZGJaY0lIVlBpTXhZS0V4eGVKSmFJ?=
 =?utf-8?B?VkdPVHN5ckp6U0NRb2pMWFFqTk8zRGp1N01uWHZXT3puYmpKSWQ4THpnQXVT?=
 =?utf-8?B?T0I5RXc3ZHFubVRybW1nUk93YnNTQlBqOWp0NXZNSUhWbWlEQm01VW5odGor?=
 =?utf-8?B?KzVFWmpVWFp0Y3lGZWNwYVNYUDhqeWo0TnUwMDcxVnBVZ3Y2Wk15dVd0OGZ1?=
 =?utf-8?B?R1J0Wk5yeTB5VDhrWEJrL1FkTGdZK3pJT0lsUnJMNXdFRGxKenlEb3BjN3ha?=
 =?utf-8?B?dHlBcHhycGFvMWhkYXEwbVhvNHVvTFE1T0wxemJVQndaRDQycjVpTkcxSWkr?=
 =?utf-8?B?UjdmRFdpd21JZWthWWcxc21YcHhQQzg2VmJ6WjBqRWI0ZXlKMUJCaDVweE9T?=
 =?utf-8?B?MnQ0a2IxZk9ETUp2VW5CS1NVWWo2WjNaR2Y3aU1CUkp3QVNoelFxYy91VUZI?=
 =?utf-8?B?d3plVWJTWWF2REtLMHRLSldacld5V0tURzdFa3F2eWZweDZKdXc2cW1MS2Jt?=
 =?utf-8?B?b0NIZU5vQ0pIS0poaTc2WmRkSU52YlhteEJ2L2lML0J0Sy9uUG5ZZndGc2NI?=
 =?utf-8?B?UHMrazdac3B0cTNMTnovWWJqanBlV0tMaGh0ME9YcnJpRjg0dGNxNENkTmlH?=
 =?utf-8?B?T1NPWDAwcnpZNnErcThVM3JMdHR5aVJzc3oxNGloQ05HMWlIWHdLZUVEWTBU?=
 =?utf-8?B?bWczakFNL1Z4UTFHaFlRbUpsb0ZIWWFWNGJqdjJyazdXQ1FtYit0TDJYbzBj?=
 =?utf-8?B?cW5KNTlacUdNc2lVdzlxanpUb2dib1NKZWlPYjZHOVA4ZWd3VmtseU5WTnJD?=
 =?utf-8?B?dWJoUTBKQk9ta3BlUlZHWUV0WVg4aGZpRVQvd2x4Y3YyZEh0Nm1vRGF3dEVl?=
 =?utf-8?B?VnRKUlFCTTd3WENlRTVBRGw2NGEyeWlINGdZbG0zTGNPMWlkT3BpSHZUQzZR?=
 =?utf-8?B?ZTJjQU9CclVYSHd4WTRqNnZ6NTRxZitzT0F0NUlmZGU3V0dCa0xjRld5ZW9q?=
 =?utf-8?B?K2pSdlMrRXRxbXFodHhwOUJDM2tyRWJaa0hia2dXbmxGUkp4OWpkSm52YTJq?=
 =?utf-8?B?bjJ5cE1FSGpnR1BzcW93S3IwcUwwcHI3Y24rMGdDb0xWS3owNWlXdGU3TXpE?=
 =?utf-8?B?ZjNmMW1VNkhKaUs3N2QwZnN4QXNQQ2s1TG44VXdNSlRBQmp2T2tlbUF4TXo0?=
 =?utf-8?B?M2Vwc1o3K1dVS0FqczNKTUdqNVgybitMYUlWT25wWGR4a2ROVmYwc2ZMLzhE?=
 =?utf-8?B?UDF3dnoyMEhuYVBxTWdTNjFqM01lMDhSNnNJN1EwTC9LVXovZGhSWnhOZm4r?=
 =?utf-8?B?SENHZTdIWjU5MjN3U3Yxem9RVmtzelVtZU00VCtRV2lmYi8rckFpWXVlN05i?=
 =?utf-8?B?MmRXU290bGJYTXNBcHRKWHl0OGx4VXgvdUJpZGFlTHh5eXFXYU93cDRFUTdW?=
 =?utf-8?B?c2g3TGtHN1RwTE9jbnlXTmxFUVJvMjZPZ0s4THlnekFSemozRE5WdDJkVzU0?=
 =?utf-8?B?S2J0eTgycHJYUTdpVXpVMjErN1lRS1BCSU9OVEFhRW5CMFcwYkx6WkFnc2Jw?=
 =?utf-8?B?a3hweEFESTlxMWI5eEZRbHVkaDRMSmhqUEFPVlNkOGlNT3ZQd1V6VlJ1cTA0?=
 =?utf-8?B?Um9Ld2NKZmE2TzJQaDVUY2NFRkpoTURJVGRYY3A3QnQ1bXI0VmNQRkpaTy9V?=
 =?utf-8?B?b3ZkdGJmUWNyWU9YVVMxOUZKb2thTkErYWFRZCs1anFhUDIrMmY3K2RpbFMv?=
 =?utf-8?Q?IaMqkj/lKdnJFh1LzbcixO9ypLFzYsM8QODgNOfPHGRTk?=
x-ms-exchange-antispam-messagedata-1: Rd0OMdi+bC/uSQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Y1e+Dd8htHVfz6DkY17rgmzZqeVMh9+r1T/xXczuk/CBX9RdWJKvkYwD3cKqw4le6jUpRH8cHtzwtTMRuqwrBNBEW3C0nuyHweV7vd/2HZsx16gAFWQhYck2DQO1uKm9NQ0oW3tMs73n2q51D2kMZGDKkglucWYkm99g1K/LFr7P1a/5zEWHuV0vsdlYfOb55nHDtYuYm8/0+S4w4oy/LPw812Wnyf+v/5OrHbfasqd642O6NymDyO92pyQm+ji4fxC77flLZNqJcrQyNbuTpzygWQ0Hr8WwZTipKFoYYKznSq6DCJbKJ87J1qIk60ZphOQ30Rierm5ZO5mRJGquuA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64162a8-d8a8-490b-9528-08df0fd1c113
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 06:56:07.1227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T4aaY/cXtSo0Sl+/IJwBzP+BVfzO19WtRmhpJ0fkH8Jtk6he5UrCSxokOUR2dL8QgbAJFcUVFzmX4AJnOnRw/W0gIbOE3eITT+H7DwlTINk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7242
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTczNzIzLw0K
aTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpLg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEthbWlsIEtvbmllY3pu
eQ0KU2VudDogMTAgU2VwdGVtYmVyIDIwMjYgMTc6MDUNClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KQ2M6IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJq
ZWN0OiBSZTog4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBsaWIvaWd0X2NvcmU6IE1ha2Ug
YnVpbGQgcmVwcm9kdWNpYmxlDQoNCkhpIGlndC1kZXYsDQpPbiAyMDI2LTA5LTA5IGF0IDE5OjI3
OjIwIC0wMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0K
PiBTZXJpZXM6IGxpYi9pZ3RfY29yZTogTWFrZSBidWlsZCByZXByb2R1Y2libGUNCj4gVVJMICAg
OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3MzcyMy8NCj4gU3Rh
dGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hh
bmdlcyBmcm9tIElHVF85MDg4IC0+IElHVFBXXzE1ODE1IA0KPiA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0t
LS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMg
Y29taW5nIHdpdGggSUdUUFdfMTU4MTUgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZp
ZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2Vz
IGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJ
R1RQV18xNTgxNSwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMg
bmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJ
Lg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzE1ODE1L2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lwYXRpbmcg
aG9zdHMgKDM5IC0+IDM4KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+
ICAgTWlzc2luZyAgICAoMSk6IGJhdC1kZzItMTMgDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVz
DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hh
bmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18xNTgxNToNCj4gDQo+
ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMj
Iw0KPiANCj4gICAqIGlndEBpOTE1X21vZHVsZV9sb2FkQGxvYWQ6DQo+ICAgICAtIGZpLWJzdy1u
MzA1MDogICAgICAgW1BBU1NdWzFdIC0+IFtETUVTRy1XQVJOXVsyXQ0KPiAgICBbMV06IGh0dHBz
Oi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzkwODgvZmktYnN3LW4zMDUw
L2lndEBpOTE1X21vZHVsZV9sb2FkQGxvYWQuaHRtbA0KPiAgICBbMl06IA0KPiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE1ODE1L2ZpLWJzdy1uMzA1MC9p
Z3RADQo+IGk5MTVfbW9kdWxlX2xvYWRAbG9hZC5odG1sDQo+IA0KPiAgIA0KDQpUaGlzIGlzIHVu
cmVsYXRlZCwgcGxlYXNlIGZpbGUgYSBidWcgYW5kIHJ1biBGVUxMIGk5MTUgdGVzdGluZy4NCg0K
UmVnYXJkcywNCkthbWlsDQoNCj4gDQo+IA0KPiBCdWlsZCBjaGFuZ2VzDQo+IC0tLS0tLS0tLS0t
LS0NCj4gDQo+ICAgKiBDSTogQ0ktMjAxOTA1MjkgLT4gTm9uZQ0KPiAgICogSUdUOiBJR1RfOTA4
OCAtPiBJR1RQV18xNTgxNQ0KPiAgICogTGludXg6IENJX0RSTV8xOTEwOCAtPiBDSV9EUk1fMTkx
MTQNCj4gDQo+ICAgQ0ktMjAxOTA1Mjk6IDIwMTkwNTI5DQo+ICAgQ0lfRFJNXzE5MTA4OiBkZDgy
MjAzNWM5ZGNkODllNDdjYmZhNzVkYTZmMzExOTYxN2ZiYWRhIEAgZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZ2Z4LWNpL2xpbnV4DQo+ICAgQ0lfRFJNXzE5MTE0OiAwNmE3OTM0Yjc0NGY1
OGYwMjY0MTY0ZmU2MTczZjAwYzIyYjQ3YmM0IEAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5v
cmcvZ2Z4LWNpL2xpbnV4DQo+ICAgSUdUUFdfMTU4MTU6IDE1ODE1DQo+ICAgSUdUXzkwODg6IDU1
YTg4ZDIwZTMyN2Q1YzQ0MGNkM2YzZDY2MTY4NGZiODNmMjkwMjcgQCANCj4gaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLmdpdA0KPiANCj4gPT0gTG9ncyA9
PQ0KPiANCj4gRm9yIG1vcmUgZGV0YWlscyBzZWU6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE1ODE1L2luZGV4Lmh0bWwNCg==
