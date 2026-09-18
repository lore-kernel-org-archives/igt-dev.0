Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EF1C982DA
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 10:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2166710F2C6;
	Fri, 18 Sep 2026 10:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdAKycSs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B4610F2C6;
 Fri, 18 Sep 2026 10:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789726539; x=1821262539;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/nJ+rfolaS7LplatZSRJfF7nftmkXEloT8/PJ8WCh10=;
 b=RdAKycSsgie9ckZ6+or7dis1Q8QJyu/gXikRUnWiLpFzRLxFsZUl1RoG
 lmHhmFBKwbtDHv2xBdJrig8KweH/02RnNHYlhEBOoCRkdfwKwmJYnmjYu
 k5I0CfhAEnuVBbCIc/eLJZpDulThOUMWICAtJKGlTcZ0q98uK9WdnBE2+
 IrosuSgPVUEQSlVSKQvJE57BGX96AcYlAy0oiLu2rL6hTVgUpn8E00gpp
 c5/Mnjc7UhqYIKsDr+N6ul4ytwVo8DjQZ9QapX80YuIxudDyut54P9oCH
 0X6l63HvAlQ8xlfXt5Sm9hTwwGq8GHPwxgobKkDaB4HR1/u1g33RD9XC4 Q==;
X-CSE-ConnectionGUID: bLqfbW1IR52tGPAC/TW1Kw==
X-CSE-MsgGUID: k6vrM1jsQW+9+12tdRnMbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90088618"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90088618"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:15:39 -0700
X-CSE-ConnectionGUID: h/cEvikiSlyPk8LCEf9EaA==
X-CSE-MsgGUID: z8RuGQsDQzWVErKndRv5zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="276297307"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:15:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 03:15:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 03:15:38 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 03:15:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D72qKatmShNG/f8lKkM9GrNMsg98gATFwRsLghr9q2OAtNOCvctuJJRQLynu+LvwfZrzuIoBXjzjAGY9js8Y0VyNT3CBw80v2rKzcwEDA7iyEJLaEIx83FFx6FXY4fPmsNtY7m0g8ohYFnnpf+oLedaMXVwPWQ/nStEnsCaaz89M0Gz5I3LJrzoUQowHWqu6dylVPZ6LclgyqvsLhpwFNcv7ExiIniJTvQXBv4hu8ZBvm3J4MLPFMxNp2RzInPkVpWxf8EsbC7HqUenj7SP12wdUEtnqeXuqljWZY2dtyGaHqT40Ebyfa+U0K+BlShWRv8umcBUjScj/rYmkbmZhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nJ+rfolaS7LplatZSRJfF7nftmkXEloT8/PJ8WCh10=;
 b=j7vru/8Z1MDYvNwihqiemhq0cCjgjf0BnGXhEv3K33X00A62UpfYEmONQSz2B5R10Vg8GCnSGiz2FYcYGqqvOkVCueP9O7HiGbXQHp00xZFsB42Cd+/0WsUNEQrSiXONMt9iyWoCjDNiF0jl6+Cdza6UOg1jE5P6tzZTnWzZ/5/ggyZCjB88BZOqRboZl8Dythe7jXquSs8Nwos7Bkqn6VHJpg9xDpd6GcaEBdjSE9+/2cErZAoVlr83T7n70j6UKDX4fCeZOM/qPLPPOjUydysZtinkxA0i3N/YV72DwpaQ58ews69tffsySSp3DvJgRm9nxwgE0eNDmIFFyHjlKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by AT6PR11MB044526.namprd11.prod.outlook.com (2603:10b6:170:110::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 10:15:28 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%5]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 10:15:27 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lndF9jb3Jl?=
 =?utf-8?Q?:_Make_build_reproducible_(rev4)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBsaWIvaWd0X2NvcmU6IE1h?=
 =?utf-8?Q?ke_build_reproducible_(rev4)?=
Thread-Index: AQHdR0SubWg5NRLdg0m1g4SCP+4jNLbUFERQ
Date: Fri, 18 Sep 2026 10:15:27 +0000
Message-ID: <CH0PR11MB5491A49EFF4E88DF10129695EF872@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20260917170532.107916-1-kamil.konieczny@linux.intel.com>
 <178967104865.178464.9017621621669675222@61270ab9df2a>
 <20260918080600.bronhywhbwc2zdd7@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260918080600.bronhywhbwc2zdd7@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|AT6PR11MB044526:EE_
x-ms-office365-filtering-correlation-id: a1bb944e-b6e3-41a6-c8f6-08df156dc30b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10070799003|22082099003|18002099003|13003099007|38070700021|4143699003|10067099003|5023799004|11063799006|56012099006|6133799003;
x-microsoft-antispam-message-info: Z5QkpTuqzdIfE6ZAln9nOPU133DlfkZYfJh1IN3psv2TLbuguM2Pkef/xgQTw1Aj0fAnziE4VFjKJHPXdkaHy7ybwAHrIcEbRjFYA0qfbMCm/VN6h9ykkFcBVon0sVgLgkyE0AtDFl9oBctS7RS1ZDz0rRybO7GWhhviX1fEdyQ7Xi4Ybuzaz7u8jJ5rz6hsMjOjlTELOVDan6BvQFbrsYLSQzYxOOlxif3cTGNpSNQqSwuoaoBd7VXh2EBK0NOE5uLMtAMnFE66sbtEhOIuIxhfUDbV3yDcP9/UqF7qQyW96RQlNdQpMQJnO/2xbmETxH8ucn5tC7JZ9C7CpGKzyBoBKraDufiyyU7xZ9G0SDcIr5bNVejYTlTrUEyklvwgrnCYzbOx5FFf04RLlIBflgoCN8Qak8JYUWoOeHesF7I6aslYw719bhLfaRZ2iyAqW1TOBBMMftdlC/ns3vI5BCe7vJOTjiEFFHxWClN8MiuvsWdOqeGN2ZEy5HUhUQdNRreDQ4Ju8t9sqf8e65i98Ye/r64L9hYvtLb5S/y1hgtU79FgQxrl0jCoAhLwUwvoQyIySPgrnddefK/OJqs1xQVgNBr92TZZdRoMBGaqy7iVkJqKGcF7AnCYul4VgiOU1oZ+CUP5oDMRJ5Qv2Cr0ZdMpHhJ/bSlJVOAQwqAeltM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(22082099003)(18002099003)(13003099007)(38070700021)(4143699003)(10067099003)(5023799004)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlpFQlNwbkduakRvRzF1ZTZaSngrZ3hoZWJKUk9EVnBrSU11TkU0Y2lBOW9U?=
 =?utf-8?B?MjU3UWs2akJrTTFCZUR0V1VFMnpKL2YzYVJuMnBzc2NmUnJFY2cyQ0FabzRD?=
 =?utf-8?B?VktUYm4xZDZnbFlrTDV1cWJYZ1JFY05CVFdpdmUwdU9mVGhDbXlYTi9xWEJQ?=
 =?utf-8?B?QVNQdWVCb2VQSHpHaSt1UnNRUFRjTFNScHpPZ3FqMThZMFRMcktIWGxoRUx5?=
 =?utf-8?B?UWxjc3pZcUYzU3Q1STlwWVpZbXVsSzhDMWpzSWp4RXUwclJTbE96eWc0c0Zw?=
 =?utf-8?B?MDdma0JseFpuTzJjZHlnemt2NXkvTzZ2S1ZsZ0tzWm5ZbUxuaFhIMVNyajlt?=
 =?utf-8?B?T3JiYlpHdm1IRFRrb0lXaW0xWDNJTU0rNjhFZ3Vab2c2bHRweU9SdzdHSWpx?=
 =?utf-8?B?YlZMLzBZbXI5QmFENUhpWlJuOEVQd3lTRWwrTjd4YWdWSm1uS0o1UE1EdTcy?=
 =?utf-8?B?S2YrNEpWeXUwclNJc0VqNUQ2aEhvbGpHeE4zZHR6UHg0b2tTTVE1aWRaQ0Jz?=
 =?utf-8?B?SC90aE5KTXpLVmFKVmhLS0ZnMWJIdjNsK2RQdlYxdzZld2srN043endkaHd3?=
 =?utf-8?B?NVlwUStuaTZTL3JpdXZoUkd2c3paTExJVjJXdDBPd3ZpRWliZFZVeE1PUkEy?=
 =?utf-8?B?SzBzQ204c0FEME1YaEl2dWdENVY0S2R4RjZjakRGelBYNlZydzVOWDZQSXF6?=
 =?utf-8?B?THFvV1liVVdDeElVUmw4YVJ6T0p2dGV5YnpJTWxFRmRMZDUxMHdOdE4yNUlI?=
 =?utf-8?B?bFo4RGlhR2wxNGpITnFXc1plZE5Mb0doYStnTUMxKzE3V1dFQ2pzWFRKcmRD?=
 =?utf-8?B?S1hxVS9TUmZaWlA1RFhxeWo5ajNQYW0vbUJjN0czYVRoeFM0cWYxZEhNWnRt?=
 =?utf-8?B?eWFnVzZKNGRSQ3d1ejVabEZXcjIyY20vSE93VllSbFQvK0ZqNEpyd1hHdFd3?=
 =?utf-8?B?eDdIQ3djUnpRYzUrRmJsR2ZkVXVaMjZHZm83eUE3VW1tRFFZTjh0U0xoYTJG?=
 =?utf-8?B?K0ZPTVBnNGxNRGo5Y0U1NHJUeXlVY1BLWkZhUFl4cXFid2pOOE5hWm9tMWli?=
 =?utf-8?B?U2ZSM1NlNEo1WllRL09iU1F2R2V0YUNTZW1XRlBDK1pOc1lPUlArd0s1L0xF?=
 =?utf-8?B?VUlBSXVpQnpkbjJBTUVKQVN1R2dubkFQNlVMbGdYcFRuZ3NtV3JsYmtFZHJX?=
 =?utf-8?B?Zlc2eFp1cnJwMWtvT1FNOHY5R0pMMk95eHM3YmF6Nkx2clVpZ1NHVjFZRlFZ?=
 =?utf-8?B?U000QnpiZVZISXZUZVNjSXJHQzBZWEhpMnpYTitQc0lXamFIN1lSWTVwTXZJ?=
 =?utf-8?B?cnJ6djh0bDNLSUkrbnZTL1RYV0VNQWxvWStlL0V0NzFhQTY4cGdRSCsvK1No?=
 =?utf-8?B?UWZkbVB1ZWtMOFNxaDQwdEE2K0szVHB4SE9QQ0MydDJFZ1Y2ZXFYZVY0L1ln?=
 =?utf-8?B?ZC9KQ0t1aytMM1dpdVJsaXdlSnpweEhhc1JER3gvWnM4WDh2eFhBK1Q5R2h4?=
 =?utf-8?B?VXNwSTBSUkZDd0ZZR1RZSCtDYjRpYlZuWG82eUJGMFd1aXk4aEt2dHJaWmFX?=
 =?utf-8?B?VmhDbldBeW5jMVlFR2t4VnV6aVprak9lNHVzWUZoQXA4UUhOTnpSOVdXa3px?=
 =?utf-8?B?Kzd3MGY3UTIvd3k4Znl2N2JiR1Zhek5IMC9kVHBiODNOUUwrRWg2WCtnVTB0?=
 =?utf-8?B?NHU4VG92VndlT2xjYnJTZkdWTytmcGY3S0RRZHpyKzJpWmZyMmpFRFFSQURj?=
 =?utf-8?B?OXhEdUJGY0pqVm9NYU5nUWcydkU0NnBSQi9ybENxYmRVaGFhOXZvUTVvTEdU?=
 =?utf-8?B?QTREYzdpWkFTbU9SSmhCck5LNTJlVmNHMWlIdng1R3kzVC8vM3hxVEUrM3ZY?=
 =?utf-8?B?VzdzRUJNUENQZE54eGNUV21ZR1lNd2hTNXdwR2hyQ2tNLy92WldycWtXU2hJ?=
 =?utf-8?B?NGJ3YWtla252bmxib1QxQTgzejA2SjBPVlpBYUg1V0tkeklFOVpDTUw1dTgv?=
 =?utf-8?B?ZjVwMzAzTEVLczhNMzJGUWlYSUZyY3ZpY1FHU1pCVHpXMkl5WkdHT1l3Tkts?=
 =?utf-8?B?QUVranR4dTJEN1U0QWR2NVRiVGwvd0NsWEdYK2FWQ3d0L0pQVWltRXVMRkJo?=
 =?utf-8?B?SmljeVd1UDBFKzM4eUpXdG9URlJvb1E5TEt3b0tWU2ZLNFRFdFk4TzRsLzFP?=
 =?utf-8?B?T2lLMXl6NUN6Wnd3QkNKNElUaVF1WlQ2aVM2cFJoZHAwMXFwS0h0d0MrQjl3?=
 =?utf-8?B?ZFdMWk10dHhOOXppMWE4NFAxUVFPVE04dXlKa0hEQmxVc3UxUkI4cldwZmtS?=
 =?utf-8?B?aVdDc2VFc0pOT29IYXlEd1ZBRVdnNVNPNFYyOEh4Z2g0b2dTM2M1TFJvZ1R2?=
 =?utf-8?Q?Z0SkgPvMDr7nklok/XPtRxd0eZx6yStgJ59iB/q0Z9r1c?=
x-ms-exchange-antispam-messagedata-1: 2mQsdrHh7ZdpxA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IScXNGqBiM81jUpcRCkbY87nU/S/PsurYfeXDm4MLDdSRRsJ0Bk0bhWNs2hJTNQ2HJOXPv+PBeWg8gjvRIfYvg3R9+D43Gnb0UhE1CBKZFZvCSucGdd2fNvy+SIWn96C5wCa87DS43anB4LIus+dfzl+69RY+nw9HuELyJBbKjzBL+GAw1Tbo4Vb5mNiRgKIxgUpwp5J2sRMrAy5OcPg4aRudqWyN79IW7vxbFIXEvxtbzsAETimmFMHZYLNLaZET5dGPoeK5nmU98uQyN/4Fg3hTzKdjZxjY2VZKdxsCGFOeLipqTWbAn2mg4u9BHmxx94GR/Jmx/AvbrhHMtXwWg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bb944e-b6e3-41a6-c8f6-08df156dc30b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 10:15:27.7795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g9glCrX+IihLkwjjMHW2PsCaevtg027jl6+FKu/lQjl5h8F+GX7rhJE13Day620Lj+sF5/O8ts0lbFMLSNWzamWfOOEFuicgP1aKVVZwQB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR11MB044526
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
aTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpLg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBLYW1pbCBLb25pZWN6bnkN
ClNlbnQ6IDE4IFNlcHRlbWJlciAyMDI2IDEzOjM2DQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCkNjOiBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVj
dDogUmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lndF9jb3JlOiBNYWtlIGJ1
aWxkIHJlcHJvZHVjaWJsZSAocmV2NCkNCg0KSGkgaWd0LWRldiwNCk9uIDIwMjYtMDktMTcgYXQg
MTg6NTA6NDggLTAwMDAsIFBhdGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0N
Cj4gDQo+IFNlcmllczogbGliL2lndF9jb3JlOiBNYWtlIGJ1aWxkIHJlcHJvZHVjaWJsZSAocmV2
NCkNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3
MzcyMy8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBC
dWcgTG9nIC0gY2hhbmdlcyBmcm9tIElHVF85MDk5IC0+IElHVFBXXzE1ODU5IA0KPiA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1t
YXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtu
b3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTU4NTkgYWJzb2x1dGVseSBuZWVkIHRvIGJl
DQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBv
cnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50
cm9kdWNlZCBpbiBJR1RQV18xNTg1OSwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1
LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRv
Y3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9z
aXRpdmVzIGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE1ODU5L2luZGV4Lmh0bWwNCj4gDQo+IFBh
cnRpY2lwYXRpbmcgaG9zdHMgKDM4IC0+IDM3KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gDQo+ICAgQWRkaXRpb25hbCAoMSk6IGZpLXRnbC0xMTE1ZzQgDQo+ICAgTWlzc2lu
ZyAgICAoMik6IGJhdC1kZzItMTMgZmktcmtsLTExNjAwIA0KPiANCj4gUG9zc2libGUgbmV3IGlz
c3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3du
IGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTU4NTk6DQo+
IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25z
ICMjIyMNCj4gDQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQGxhdGVfZ3RfcG06DQo+ICAg
ICAtIGZpLWJzdy1uaWNrOiAgICAgICAgW1BBU1NdWzFdIC0+IFtBQk9SVF1bMl0gKzEgb3RoZXIg
dGVzdCBhYm9ydA0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2Ry
bS10aXAvSUdUXzkwOTkvZmktYnN3LW5pY2svaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBsYXRlX2d0
X3BtLmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9JR1RQV18xNTg1OS9maS1ic3ctbmljay9pZ3RAaQ0KPiA5MTVfc2VsZnRlc3RAbGl2
ZUBsYXRlX2d0X3BtLmh0bWwNCg0KVW5yZWxhdGVkLCBwbGVhc2UgcmVwb3J0IGFuZCBydW4gZnVs
bCBpOTE1IHRlc3RpbmcuDQoNCg0KDQpSZWdhcmRzLA0KS2FtaWwNCg0KPiANCj4gICANCj4gS25v
d24gaXNzdWVzDQo+IC0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgY2hhbmdlcyBm
b3VuZCBpbiBJR1RQV18xNTg1OSB0aGF0IGNvbWUgZnJvbSBrbm93biBpc3N1ZXM6DQo+IA0KPiAj
IyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIElzc3VlcyBoaXQgIyMjIw0KPiANCj4gICAq
IGlndEBnZW1faHVjX2NvcHlAaHVjLWNvcHk6DQo+ICAgICAtIGZpLXRnbC0xMTE1ZzQ6ICAgICAg
Tk9UUlVOIC0+IFtTS0lQXVszXSAoW2k5MTUjMjE5MF0pDQo+ICAgIFszXTogDQo+IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTU4NTkvZmktdGdsLTExMTVn
NC9pZ3QNCj4gQGdlbV9odWNfY29weUBodWMtY29weS5odG1sDQo+IA0KPiAgICogaWd0QGdlbV9s
bWVtX3N3YXBwaW5nQHBhcmFsbGVsLXJhbmRvbS1lbmdpbmVzOg0KPiAgICAgLSBmaS10Z2wtMTEx
NWc0OiAgICAgIE5PVFJVTiAtPiBbU0tJUF1bNF0gKFtpOTE1IzQ2MTNdKSArMyBvdGhlciB0ZXN0
cyBza2lwDQo+ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2Ry
bS10aXAvSUdUUFdfMTU4NTkvZmktdGdsLTExMTVnNC9pZ3QNCj4gQGdlbV9sbWVtX3N3YXBwaW5n
QHBhcmFsbGVsLXJhbmRvbS1lbmdpbmVzLmh0bWwNCj4gDQo+ICAgKiBpZ3RAaW50ZWxfaHdtb25A
aHdtb24tcmVhZDoNCj4gICAgIC0gZmktdGdsLTExMTVnNDogICAgICBOT1RSVU4gLT4gW1NLSVBd
WzVdIChbaTkxNSM3NzA3XSkgKzEgb3RoZXIgdGVzdCBza2lwDQo+ICAgIFs1XTogDQo+IGh0dHBz
Oi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTU4NTkvZmktdGdsLTEx
MTVnNC9pZ3QNCj4gQGludGVsX2h3bW9uQGh3bW9uLXJlYWQuaHRtbA0KPiANCj4gICAqIGlndEBr
bXNfY3Vyc29yX2xlZ2FjeUBiYXNpYy1idXN5LWZsaXAtYmVmb3JlLWN1cnNvci1hdG9taWM6DQo+
ICAgICAtIGZpLXRnbC0xMTE1ZzQ6ICAgICAgTk9UUlVOIC0+IFtTS0lQXVs2XSAoW2k5MTUjNDEw
M10pICsxIG90aGVyIHRlc3Qgc2tpcA0KPiAgICBbNl06IA0KPiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE1ODU5L2ZpLXRnbC0xMTE1ZzQvaWd0DQo+IEBr
bXNfY3Vyc29yX2xlZ2FjeUBiYXNpYy1idXN5LWZsaXAtYmVmb3JlLWN1cnNvci1hdG9taWMuaHRt
bA0KPiANCj4gICAqIGlndEBrbXNfZHNjQGRzYy1iYXNpYzoNCj4gICAgIC0gZmktdGdsLTExMTVn
NDogICAgICBOT1RSVU4gLT4gW1NLSVBdWzddIChbaTkxNSMxNjM2MV0pDQo+ICAgIFs3XTogDQo+
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTU4NTkvZmkt
dGdsLTExMTVnNC9pZ3QNCj4gQGttc19kc2NAZHNjLWJhc2ljLmh0bWwNCj4gDQo+ICAgKiBpZ3RA
a21zX2ZvcmNlX2Nvbm5lY3Rvcl9iYXNpY0Bmb3JjZS1sb2FkLWRldGVjdDoNCj4gICAgIC0gZmkt
dGdsLTExMTVnNDogICAgICBOT1RSVU4gLT4gW1NLSVBdWzhdDQo+ICAgIFs4XTogDQo+IGh0dHBz
Oi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTU4NTkvZmktdGdsLTEx
MTVnNC9pZ3QNCj4gQGttc19mb3JjZV9jb25uZWN0b3JfYmFzaWNAZm9yY2UtbG9hZC1kZXRlY3Qu
aHRtbA0KPiANCj4gICAqIGlndEBrbXNfcG1fYmFja2xpZ2h0QGJhc2ljLWJyaWdodG5lc3M6DQo+
ICAgICAtIGZpLXRnbC0xMTE1ZzQ6ICAgICAgTk9UUlVOIC0+IFtTS0lQXVs5XSAoW2k5MTUjMTIz
NDNdIC8gW2k5MTUjOTgxMl0pDQo+ICAgIFs5XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTU4NTkvZmktdGdsLTExMTVnNC9pZ3QNCj4gQGttc19w
bV9iYWNrbGlnaHRAYmFzaWMtYnJpZ2h0bmVzcy5odG1sDQo+IA0KPiAgICogaWd0QGttc19wc3JA
cHNyLXNwcml0ZS1wbGFuZS1vbm9mZjoNCj4gICAgIC0gZmktdGdsLTExMTVnNDogICAgICBOT1RS
VU4gLT4gW1NLSVBdWzEwXSAoW2k5MTUjOTczMl0pICszIG90aGVyIHRlc3RzIHNraXANCj4gICAg
WzEwXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdf
MTU4NTkvZmktdGdsLTExMTVnNC9pZ3QNCj4gQGttc19wc3JAcHNyLXNwcml0ZS1wbGFuZS1vbm9m
Zi5odG1sDQo+IA0KPiAgICogaWd0QGttc19zZXRtb2RlQGJhc2ljLWNsb25lLXNpbmdsZS1jcnRj
Og0KPiAgICAgLSBmaS10Z2wtMTExNWc0OiAgICAgIE5PVFJVTiAtPiBbU0tJUF1bMTFdIChbaTkx
NSMzNTU1XSkNCj4gICAgWzExXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTU4NTkvZmktdGdsLTExMTVnNC9pZ3QNCj4gQGttc19zZXRtb2RlQGJh
c2ljLWNsb25lLXNpbmdsZS1jcnRjLmh0bWwNCj4gDQo+ICAgDQo+ICAgW2k5MTUjMTIzNDNdOiBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzEy
MzQzDQo+ICAgW2k5MTUjMTYzNjFdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJt
L2k5MTUva2VybmVsLy0vaXNzdWVzLzE2MzYxDQo+ICAgW2k5MTUjMjE5MF06IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMjE5MA0KPiAgIFtp
OTE1IzM1NTVdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVs
Ly0vaXNzdWVzLzM1NTUNCj4gICBbaTkxNSM0MTAzXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy80MTAzDQo+ICAgW2k5MTUjNDYxM106IGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvNDYx
Mw0KPiAgIFtpOTE1Izc3MDddOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5
MTUva2VybmVsLy0vaXNzdWVzLzc3MDcNCj4gICBbaTkxNSM5NzMyXTogaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy85NzMyDQo+ICAgW2k5MTUj
OTgxMl06IA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVs
Ly0vaXNzdWVzLzk4MTINCj4gDQo+IA0KPiBCdWlsZCBjaGFuZ2VzDQo+IC0tLS0tLS0tLS0tLS0N
Cj4gDQo+ICAgKiBDSTogQ0ktMjAxOTA1MjkgLT4gTm9uZQ0KPiAgICogSUdUOiBJR1RfOTA5OSAt
PiBJR1RQV18xNTg1OQ0KPiAgICogTGludXg6IENJX0RSTV8xOTE1MiAtPiBDSV9EUk1fMTkxNjQN
Cj4gDQo+ICAgQ0ktMjAxOTA1Mjk6IDIwMTkwNTI5DQo+ICAgQ0lfRFJNXzE5MTUyOiAwZmI4ZDE5
MDBmMWE2YjlkMjFhYWRiZmE1Zjc4NDk3OWI5NTBiY2Y4IEAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVz
a3RvcC5vcmcvZ2Z4LWNpL2xpbnV4DQo+ICAgQ0lfRFJNXzE5MTY0OiBmZjNhMDYwOWY4ZTQ5ZmY0
OWE5Y2RhMjNkMTYzMTE1NTA4NWNkNTM3IEAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcv
Z2Z4LWNpL2xpbnV4DQo+ICAgSUdUUFdfMTU4NTk6IDRkZTM3MmVmNTVlZmI4M2MxM2Y0NzFkNThm
MGMxZWZhYTAyZDRlNGYgQCBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1n
cHUtdG9vbHMuZ2l0DQo+ICAgSUdUXzkwOTk6IDkwOTkNCj4gDQo+ID09IExvZ3MgPT0NCj4gDQo+
IEZvciBtb3JlIGRldGFpbHMgc2VlOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xNTg1OS9pbmRleC5odG1sDQo=
