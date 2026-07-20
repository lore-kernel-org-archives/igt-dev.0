Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB7AC44515
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 11:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110CD10E15F;
	Mon, 20 Jul 2026 11:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbS2Uc/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9292310E15F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784548558; x=1816084558;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rzcxo/npGAmFIgUZXUJYkaQ1PRsrKArPc9kMmXYt9ZA=;
 b=CbS2Uc/wtt/Urw7SqX30ekgMYf2o1CpryOQKYDVlsBWwz5+3C8dZhcLJ
 YMP1anOJ6zoHCYXKwoV1TsdZBL8VqVczu7rh4aI4c0w2QF2OzdkYaxtlT
 UjAUhnjyDQ2g6Ba/IIfcOJjcCE1oCIDNnKfDyMmwxYtvcizKQr4VFZUw8
 Dp0E5V9geVta6UPE1ERXW89djZGEG+Wvb7UOMDYNez3mGSKhW7s81nDsg
 SW6rSqQg7l2pCe02VhqECMZXpUQTLVVaE03qamrjrPVZO4NmlhDtVugTt
 P0aDWe9mEKRHPxcd/E0R2JO9CuYiBthUw9oDX4g54YmHxbLEW8o5pM1P7 A==;
X-CSE-ConnectionGUID: f3cNEoWIRIOCY2SVvhXbhg==
X-CSE-MsgGUID: AAMyQEfDStKUOLLjM0nZrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="84892546"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="84892546"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 04:55:58 -0700
X-CSE-ConnectionGUID: Hd/APm3YTwKWEb1GSh4V4Q==
X-CSE-MsgGUID: 5Wavb37eRZ+8LgnbZwlXFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="256260097"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 04:55:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 04:55:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 04:55:56 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 04:55:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHazGYhlsOMBIuche2LBeP1y+jAx7GiyevksTjfBzL+Yv7Uq+DGKlvlcDBV5dudtvXVL6DEJN9bWT2X+mN3ywiXPHff5YQIyUyOWAVtTKiJmrq8HeeTWnGrWQDGU5xgQAeUNi6WlEMhkWOh/aqFP+IzdUcoh2qr1nmTZAELWW+F+45/XdzFBOn+iJFMRrO7HCIkEiOJXYDs+cZKaAMFBKykc5XOiMXhO+cymfiYRQeZ7WZ9aeFXTEDQZ+Q9uxAJ/9ftrFE8yfxQenwocb+O1MT4Ys2vw6696i3SCLJtL5F9ZZmSkH3F/SIsgGA0qBgh/5Nh8ywKrYBeuj2SH70n7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rzcxo/npGAmFIgUZXUJYkaQ1PRsrKArPc9kMmXYt9ZA=;
 b=D7Ae010fwiCWYEUGEAI7pPNauP/aIhPlYzj49hYK6XCSVI879EEyvAvRan+bFE+5g66IoVT74IvMYUAAxiu8oYe6l6CafTPzvAPYxlhLaJ+2lvm4jCJRFzxgI3ZAWiPUrhjKh4ZqgDp1zmjeRYK9df1Y3NTBmj8dHzvoOtIE0XLHOJfPUjEkVf/BGoUTaUj+yPSWA8n6D26UZHZGO3QCznhOiZ1ylDvd9aIi2VDzPiE3vU0192tja6ncmPu3Vojtps5wOD3vOOLwV4YUosekJ/rhwK8Dw32xdJXp+iAjY+O9GP0PbHt/4ITPMnSIn9l3zudimdXnW734RYRYOolYrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 11:55:50 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 11:55:50 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_dc: Fix compilation on arm64
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_dc: Fix compilation on arm64
Thread-Index: AQHdGD28jhLBzKL5zEq+FLKnFHqFL7Z2THwA
Date: Mon, 20 Jul 2026 11:55:50 +0000
Message-ID: <DM4PR11MB63127D10638F896C13EC3B1A90C32@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260720114835.35398-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260720114835.35398-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB5872:EE_
x-ms-office365-filtering-correlation-id: 5672bb57-5403-403b-a7f1-08dee655d835
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: JDdMLYukxHV84e//JBmC3CEcJvuMNW4+H/tBrGj5Av6LesnHjJtNaKWRYQVCc9CePCDd0MMiVenMBMCcLiklSRqHQ6aHt0VIRIp1A7SNlkkEc6i0ko4JRgFDoueuVIV9ZkErdwqM++xqUp+kiNJPpq6mW9PbYw7bvZRYf6JMBUM0V3DZMhs/8Oj77KcE80k4HiQVV7Cm9ylqqIyXhmrdlE9HOxfAq/nZSZeZO7QeEuh+5OSbA5jHi3cc31uLWjxTq7csN0hYCvsTTf2Nx5pm4cdwMULBYN3TJyxplpdoLKF6CTUKKHdCFuRibelX0yFzOt1iB+v7RHQWlaSqMd5hXvHnAx1nx5emCTwqt4JrRVTVG5Q5Gx24/JwMMTxlzSnjalMqo5F1oUmzV/1+DL49u5ws/OfrMO3T/lRSgwaQbZWmMf8JappZoGaT2z0M115mJMNJCU50VW0+BDoOl7fqRLvz02TXfnOMBkzAN7EIh0imFOUkrw9yJaB+qILsVLxFlDBiSK60vSMdbdJC6auxqvG/6lusu57TaEm/CAyMlY1CQPuOyoa/9q6BP9+XFi+Qaf4bJvijRDpJLd5i18YRZK3aei0OSbTrfxppNCp08ACgw5T8lAC6jjgyOSx1wI6D1i1Za1j7UrvdtKkQ2rIBY1ljtHIgI4lmPZjXuhjqqNkajgDc9yfGzo4Nzjr/WkAp0Q29F201R4GCKsa32LYW1dOOOU4kCTyVNGqMqBoOSUs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0pENnFVUXJYZTZwMVhNbnhmdGxpZWtFdDc2WVJ0RjcvZzl0SU0wekZld1VE?=
 =?utf-8?B?OU5LclpkMmozOWZvNzFtdEt6MEpOaXdHeGtQWkpPcTc0SjYvSnkvYWZlZU82?=
 =?utf-8?B?a2ZidCtSNmc3eVZJQUFndUlROXF4a1VWQ2NYU0F4TFdNZGo1WC9YSlBKMkFw?=
 =?utf-8?B?dTR1TXBrbnNLZFN6N044OGM1ZkVZU21aQkltTGdaTTBvUVdaN2thWFczeGht?=
 =?utf-8?B?UkkxeG5vV09UbnNmbS91UWFBVWRoSjRrcWU0VlcramRHSDVwOXdBQmJwc1d5?=
 =?utf-8?B?WVFRdjNHYWxqQ05GeW91R1I2QTFTN0tJbkFVaVFUeGFNZmM3UDhHaklKbDZU?=
 =?utf-8?B?M1M1ZXdTN2NlUnpEN1NGWTVRdEk2ZFpLSkRYdy9hRVRHNG12N1VpNE0rc3Zw?=
 =?utf-8?B?TzdFNFdxeHZ2UzVVdlArT0xwS1Z3eWdvNVFOM21sci9QcFFXdkhUckVIZk5p?=
 =?utf-8?B?NnJ5ODNyVC9aQ1ppYmt2V1FuTXJmNUZ2TzVqaW1uMk1BcUFncFh3RUNQckhY?=
 =?utf-8?B?a1pDd0hSNURxTjZUbGMvbXdHVStvNVAvMkNBWk5zU2I4MXFHL3RrOUloSkpr?=
 =?utf-8?B?MWdCR1JUVkg0VmJPbk1nR3NPMDJJMkVOKzh0RUdCOHRpTUJQZFNuM0lrMzh3?=
 =?utf-8?B?dHVRTzZnR0JOelZDN1NJMlJHWndiKzdmSG5LZ3htSm9KOTdPN09jYmFsWitF?=
 =?utf-8?B?Ymw4QkkwWm16YnVPWVFDeUdJRk1vNzNXTmVYYVg3ODNFN0p0TG5IQTZSU3Ev?=
 =?utf-8?B?RVN0RVBNMi9wLzR3eXBzY2J4QlRudWdBUmErV2lBUVBUM1VxbTJQS3dadzVX?=
 =?utf-8?B?ak05S3hQeHFiczFYcVJNdXZlUkY5MTdEK1RuZkZNYm8zWi9zT3Nyb2ZZb1gy?=
 =?utf-8?B?YTRqYXRyU0ZGZkNaM2lBVXFHamJoZGNoK0kyaVYzVGRwQWhwVEl3eVdZcE5X?=
 =?utf-8?B?YlBWZldWb1RHdHRLbDg4MXpOYWtZMEhtaTNFYnRoWDNDTVhMY0RtRTJ2SVdr?=
 =?utf-8?B?TTRuSlEzWHFhKzhJcElCRXQwRWRQa1k0andidkdxT3owRTNLamVXK1Y0Z05z?=
 =?utf-8?B?RENXam0vZFZEVmxTY1N1N3ZkOUlJN0pVUmV4RkwzNm1MVU5GZzBWdi9wSStx?=
 =?utf-8?B?SG9iTzNnak84Y2RXNkFDSm5ydFgyVWtFakJ0WXBUbFZpMEUrSXlNVU8xTlBp?=
 =?utf-8?B?N0lJVElTdnFUWDZ0MlYxdmpIZVNnQ2RBT1ExT01LMWdxYVlwZFloT2o0aEQ0?=
 =?utf-8?B?ZjBLemluOXloRWowbytmbXlocldDMG1ENlFEOWF4cUNJdmx5aTh1WVFKbk9L?=
 =?utf-8?B?eFlIKzNCdnpuR3puMzhpb1ZtbnJYUjdQdXRzd2ljR29oQXZyKzBHVEhHbzFp?=
 =?utf-8?B?a20rR3h2Z0R6STFoYzhEdk1uTkpRNm5GWk4xRlBJaHJ4STRLRFlYeXFyK0Rm?=
 =?utf-8?B?UjVTSVAvd0lQUU9hUW1md3VIVmpYL29HVzBwQVBMelVxV3Jick5nVmNtdm85?=
 =?utf-8?B?ekNUMGhsRFFHa2hyUEd1a3Vic21kVEx4SUEvU0g4QUh0aTRxVjFiREdIbjNZ?=
 =?utf-8?B?Tjh0VS9kN0c0VDFKSk1uYUdCeFZoTTdsdXRMakM4L3dPVmE2RkZQQXMxeXZW?=
 =?utf-8?B?MllFMVdIK0hHUU1mbkhFTW56N2lWTHVCS0dVQWRNTWxpbERiNXZkU2ljd2RT?=
 =?utf-8?B?VW1wU2huL2FwYk1NdTE5eFNlak1wME9LbTM3VThWZ1pqd2duSUZCUXE0bFdM?=
 =?utf-8?B?TDA0dkh0bytMMGhIY0tjVHFiRWFlTVlGRlBNYnNxcXVyb3JucWcycGJwTEls?=
 =?utf-8?B?ZklJSVBZSytIY1pkc21KNDJpYk50MlBmYi9qZXhSUjczczh2eDZBMU9KL2NO?=
 =?utf-8?B?aW5SNVR1M2s5WDIxZkhwSklvZ0dUbUpYY2VnNXFRdWp5ZFZvY0VBZEFCOGpy?=
 =?utf-8?B?YzQ4RmVmK1dHUHM1RmxGeWJSMHZXTlhPcE55aUduSEt3VXpIZXlYODh0d3JT?=
 =?utf-8?B?RUpTdE9MZGxjZmN6ZFY2eHVHc24ycWNqMTBpdkc0WHVVazBEY3lPWHBMcjRE?=
 =?utf-8?B?RlVQb1lqSVBSSjgyYTJpVURXdWIxK3FpWVFjT0RoOXczYXhQenpFY2NCQ1dM?=
 =?utf-8?B?Tzh4RzE5c2FvbjZDbGtUQ1NqSitJUm8rcjYyZmtZeHRGU1dpUW84V0tQREVs?=
 =?utf-8?B?a1F5Y3BnUkVHWnFWTDIxZDZtQ1ZSQjRiOGpOVHhBRTVtZjc2d2lXdE5oUTd4?=
 =?utf-8?B?aEcvL1lzTnRFSkNmRHQ5T0s5SWMwRWxPY0FyWHE3V2hjeG40UHlISDFyNmht?=
 =?utf-8?Q?1jklCzj8GRyiaba2xz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XzQLa5tfMoFTY0MH2V4KOU5TsBbjOXVbTtGaljQJZBobr+MZ7rIwuuuppDoqQossoIe5UOd45JWhJ3AblSotQH3ugB12IyaLM+ZfN9DFqKNkN5oF+hTqSWj7PEGVz2elzP0h6g7DIQ5lk/zZhUcoJ+ziDYX8x1r+GTJT2xvgZknxdi5yKcRuYQX0WnFqBAh0Urjv6mAEkm191gnoKCl0iDyK3ZE5nEnpi0+AqpBHdinsp160n6KAPhXMHVuRA27QtPYFBPtJacdi4mYbI1QEmP4qUlE0m3W9BT/WPpfYz6My/BCRdejB9wxOHWT/enLvQ1b90yQLZiTuFn7XkrU5rA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5672bb57-5403-403b-a7f1-08dee655d835
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 11:55:50.6772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KptLDd4ctP/6ic+xWuQP8JZERpoCyLCdZMVbU5fQgrrdTY+d+KzTDBw/vLm6acVQ+cD8i1mllcFOdxxB/K0tig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
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

TEdUTS4NCg0KUmV2aWV3ZWQtYnk6IEplZXZhbiBCIDxqZWV2YW4uYkBpbnRlbC5jb20+DQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1p
bC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMjAsIDIw
MjYgNToxOSBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEth
bWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT47IEIsIEplZXZh
bg0KPiA8amVldmFuLmJAaW50ZWwuY29tPjsgRGliaW4gTW9vbGFrYWRhbiBTdWJyYWhtYW5pYW4N
Cj4gPGRpYmluLm1vb2xha2FkYW4uc3VicmFobWFuaWFuQGludGVsLmNvbT47IEtlbXBjenluc2tp
LCBaYmlnbmlldw0KPiA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ludGVsL2ttc19wbV9kYzogRml4IGNvbXBpbGF0aW9uIG9u
IGFybTY0DQo+IA0KPiBGaXggY29tcGlsYXRpb24gb24gYXJtNjQsIHdoZXJlIGZvbGxvd2luZyBl
cnJvciBvY2N1cnM6DQo+IA0KPiAuLi90ZXN0cy9pbnRlbC9rbXNfcG1fZGMuYzo0Mjg6MTY6IGVy
cm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhwb2xs4oCZOw0KPiBkaWQg
eW91IG1lYW4g4oCYcG93bOKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dDQo+ICAgNDI4IHwgICBpZ3RfYXNzZXJ0X2YocG9sbCgmcGZkLCAxLCB0aW1lb3V0X21zKSA+
IDAsDQo+ICAgICAgIHwgICAgICAgICAgICAgICAgXn5+fg0KPiANCj4gQWxzbyB3aGlsZSBhdCB0
aGlzIGFkZCBhIG5ld2xpbmUgdG8gc2VwYXJhdGUgc3lzdGVtIGluY2x1ZGVzIGZyb20gaWd0IG9u
ZXMgYW5kIGENCj4gY29tcGlsYXRpb24gd2FybmluZyBpbiBvdGhlciBwbGFjZToNCj4gDQo+IC4u
L3Rlc3RzL2ludGVsL2ttc19wbV9kYy5jOjMyMjo5OiB3YXJuaW5nOiBJU08gQzkwIGZvcmJpZHMg
bWl4ZWQgZGVjbGFyYXRpb25zDQo+IGFuZCBjb2RlIFstV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRl
bWVudF0NCj4gICAzMjIgfCAgICAgICAgIGNvbG9yX3QgcmVkX2dyZWVuX2JsdWVbXSA9IHsNCj4g
ICAgICAgfCAgICAgICAgIF5+fn5+fn4NCj4gDQo+IEZpeGVzOiBlNGE0MjhjYTNhNDYgKCJ0ZXN0
cy9pbnRlbC9rbXNfcG1fZGM6IERldGVjdCBmcmFtZSBkcm9wcyB2aWEgcGFnZS1mbGlwDQo+IGV2
ZW50cyIpDQo+IENjOiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPg0KPiBDYzogRGliaW4g
TW9vbGFrYWRhbiBTdWJyYWhtYW5pYW4NCj4gPGRpYmluLm1vb2xha2FkYW4uc3VicmFobWFuaWFu
QGludGVsLmNvbT4NCj4gQ2M6ICJaYmlnbmlldyBLZW1wY3p5xYRza2kiIDx6Ymlnbmlldy5rZW1w
Y3p5bnNraUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEthbWlsIEtvbmllY3pueSA8a2Ft
aWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC9rbXNf
cG1fZGMuYyB8IDE3ICsrKysrKysrKy0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVs
L2ttc19wbV9kYy5jIGIvdGVzdHMvaW50ZWwva21zX3BtX2RjLmMgaW5kZXgNCj4gMzdjNzk1Y2E4
Li4yOWNmYTg0N2UgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19wbV9kYy5jDQo+ICsr
KyBiL3Rlc3RzL2ludGVsL2ttc19wbV9kYy5jDQo+IEBAIC0zMiw5ICszMiwxMSBAQA0KPiANCj4g
ICNpbmNsdWRlIDxlcnJuby5oPg0KPiAgI2luY2x1ZGUgPGZjbnRsLmg+DQo+ICsjaW5jbHVkZSA8
cG9sbC5oPg0KPiAgI2luY2x1ZGUgPHN0ZGJvb2wuaD4NCj4gICNpbmNsdWRlIDxzdGRpby5oPg0K
PiAgI2luY2x1ZGUgPHN0cmluZy5oPg0KPiArDQo+ICAjaW5jbHVkZSAiaWd0LmgiDQo+ICAjaW5j
bHVkZSAiaWd0X2ttb2QuaCINCj4gICNpbmNsdWRlICJpZ3RfcHNyLmgiDQo+IEBAIC0zMDksMTQg
KzMxMSw2IEBAIHN0YXRpYyB2b2lkIGFzc2VydF9kY19jb3VudGVyX25lZ2F0aXZlKGRhdGFfdCAq
ZGF0YSwNCj4gaW50IGRjX2ZsYWcsIHVpbnQzMl90IHByZXZfICBzdGF0aWMgdm9pZCBzZXR1cF92
aWRlb3BsYXliYWNrKGRhdGFfdCAqZGF0YSkgIHsNCj4gIAlpZ3RfcGxhbmVfdCAqcHJpbWFyeTsN
Cj4gLQ0KPiAtCXByaW1hcnkgPSBpZ3Rfb3V0cHV0X2dldF9wbGFuZV90eXBlKGRhdGEtPm91dHB1
dCwNCj4gLQkJCQkJICAgIERSTV9QTEFORV9UWVBFX1BSSU1BUlkpOw0KPiAtCWlndF9yZXF1aXJl
X2YoaWd0X3BsYW5lX2hhc19mb3JtYXRfbW9kKHByaW1hcnksIGRhdGEtDQo+ID5kYzNjb19mYl9m
b3JtYXQsDQo+IC0JCQkJCSAgICAgICBEUk1fRk9STUFUX01PRF9MSU5FQVIpLA0KPiAtCQkJCQkg
ICAgICAgIlByaW1hcnkgcGxhbmUgZG9lcyBub3Qgc3VwcG9ydA0KPiBmb3JtYXQgJXNcbiIsDQo+
IC0JCQkJCSAgICAgICBpZ3RfZm9ybWF0X3N0cihkYXRhLQ0KPiA+ZGMzY29fZmJfZm9ybWF0KSk7
DQo+IC0NCj4gIAljb2xvcl90IHJlZF9ncmVlbl9ibHVlW10gPSB7DQo+ICAJCXsgMS4wLCAwLjAs
IDAuMCB9LA0KPiAgCQl7IDAuMCwgMS4wLCAwLjAgfSwNCj4gQEAgLTMyOCw2ICszMjIsMTMgQEAg
c3RhdGljIHZvaWQgc2V0dXBfdmlkZW9wbGF5YmFjayhkYXRhX3QgKmRhdGEpDQo+ICAJCXsgMS4w
LCAwLjAsIDAuMCB9LA0KPiAgCX07DQo+IA0KPiArCXByaW1hcnkgPSBpZ3Rfb3V0cHV0X2dldF9w
bGFuZV90eXBlKGRhdGEtPm91dHB1dCwNCj4gKwkJCQkJICAgIERSTV9QTEFORV9UWVBFX1BSSU1B
UlkpOw0KPiArCWlndF9yZXF1aXJlX2YoaWd0X3BsYW5lX2hhc19mb3JtYXRfbW9kKHByaW1hcnks
IGRhdGEtDQo+ID5kYzNjb19mYl9mb3JtYXQsDQo+ICsJCQkJCSAgICAgICBEUk1fRk9STUFUX01P
RF9MSU5FQVIpLA0KPiArCQkJCQkgICAgICAgIlByaW1hcnkgcGxhbmUgZG9lcyBub3Qgc3VwcG9y
dA0KPiBmb3JtYXQgJXNcbiIsDQo+ICsJCQkJCSAgICAgICBpZ3RfZm9ybWF0X3N0cihkYXRhLQ0K
PiA+ZGMzY29fZmJfZm9ybWF0KSk7DQo+ICsNCj4gIAljcmVhdGVfY29sb3JfZmIoZGF0YSwgJmRh
dGEtPmZiX3JnYiwgcmVkX2dyZWVuX2JsdWUpOw0KPiAgCWNyZWF0ZV9jb2xvcl9mYihkYXRhLCAm
ZGF0YS0+ZmJfcmdyLCByZWRfZ3JlZW5fcmVkKTsgIH0NCj4gLS0NCj4gMi41NC4wDQoNCg==
