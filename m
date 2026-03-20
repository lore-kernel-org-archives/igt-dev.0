Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D326109317F
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 07:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B657810EA28;
	Fri, 20 Mar 2026 07:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZeF+HJk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA9610EA28;
 Fri, 20 Mar 2026 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773992433; x=1805528433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2p5RV8+oeIcLxbfwL9K2ecB3BjY0oCf/D1DIwRCI2c4=;
 b=lZeF+HJkSNtppLERxDN6K3fZt2uzBkNWWLXcJ7ClOgqNbNqFG2PxbQsp
 XH+n1bMp2LglsxuxSMcYprxEMXkTZ7XTnKUSapoPbNiA7FtiOJOeR3Shd
 VvqszLkN57zrBaGqih6UMm5KIaUnFFS4+rwpn5HOxpyuEyvaowJQeYRRY
 nTfF3CPwJDn7UizJZkcE6P9XhNU8CJ22B8xfds9rFyCDP01qZDG9GMgzV
 dNvpFYBtkIJQmb65D2P5AoIxYnRNCHG1zVCFdKSZE87AXejExK5eocz8B
 xD2bB77FDwFot3LkLxyGyHPGa3PAmu2RQrTGp+T3O3YHUvhRwPTHcDF+V A==;
X-CSE-ConnectionGUID: vYBv5w11T1Sc1Qd3r15e9A==
X-CSE-MsgGUID: kH0OhkPxT8+IOzfNnHemJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74089349"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74089349"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:40:33 -0700
X-CSE-ConnectionGUID: Hf1mIUlsSm+hCZBg2UG0fg==
X-CSE-MsgGUID: Np7SrsXQRLmqvDcCjcMRoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="218591885"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:40:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 00:40:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 00:40:32 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.16)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 00:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gV25Tb5h+2H9tu1/pGTVQjdffQ1BbDN1SAPRcOdHWA+bjAnnmlnMpwq8sI2e1WkeCX3jZunN/dIiFSljTG/ra8Jh7BApDzRWe16mT0zO+UiIDFs3w/SzhkpB1qTOIAv9K9T2E7GNFduPC81G4akMS4nhzeRrnHojlVyJaTKO2W2u/KF0DwiWcKgrd+odkPFypHOmgx8h8rjPDA2SeW0iaLEpZuv9rdlpMwi4SCYDYFCuPJymJbzikQ87E0jxdnmeV/vceTQUz33lZJydhHTsyjAmS8Am90UXj6KUrzG6VPHTFwb+YbhEglnxU/Fj9X4usDF8zxV6KFcdHh0uCul2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2p5RV8+oeIcLxbfwL9K2ecB3BjY0oCf/D1DIwRCI2c4=;
 b=IAROAaukLJFo3WN92fPY2Q1Fxwno+0B5trDFsx6fkkG85pIo6TJ+ZoNiYIptXi6GjLS9BIlnX9Hlaqc0hb/K0KAswlcmxrkkqvfExeHZs16JOSn2G0p8FNvgl0QFtg+0uWoz4LL8u8I++FMoJ8UepBNxdJW47UdKVZcySTgqYMev0BETds3r62SkYBv7WbCPFhKX4EuRvFglTwlJivqc28diB6Haojp8LQZ4834tQxvzHFLEuJmtUPpila4uAnjrBB4AvkyiuwiCrEQ8qwPvY+L89F6ZKZYcsXLC6Yy+Vh93GbWSJK1rLD8eWKEc6SdqoqyZ9UswmWoDD9AwdlQPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by CH3PR11MB7275.namprd11.prod.outlook.com (2603:10b6:610:14c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 07:40:22 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%4]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 07:40:22 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwv?=
 =?utf-8?B?a21zX2NkY2xrOiB1c2UgaWd0X25leHRfY3J0YygpIChyZXYyKQ==?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC9rbXNf?=
 =?utf-8?B?Y2RjbGs6IHVzZSBpZ3RfbmV4dF9jcnRjKCkgKHJldjIp?=
Thread-Index: AQHct5Cs0F4oHDztYkGr1zRNl2qngrW2/1vQ
Date: Fri, 20 Mar 2026 07:40:22 +0000
Message-ID: <CH0PR11MB549120F1CB4269885CF9D3C3EF4CA@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20260309162311.706849-1-jani.nikula@intel.com>
 <177384592171.372672.14936377343266266853@a3b018990fe9>
 <6e027436d7fa2b7935e2bf6245eabb843fe16107@intel.com>
In-Reply-To: <6e027436d7fa2b7935e2bf6245eabb843fe16107@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|CH3PR11MB7275:EE_
x-ms-office365-filtering-correlation-id: 0716e18c-e623-4b3f-a024-08de8653f1a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|7053199007|22082099003|56012099003|18002099003|38070700021|13003099007;
x-microsoft-antispam-message-info: O0f3GAC3yOo729TEDy3VGZ9r+I6MqzBcq3Zr1HsmafSNKcXs/hmM0C7EB4rHzwgGivO0U4Kepb6D9rp5TDVVe3tN7b6L9Cc9LREI/p7tCazMts8Qczx1RRcZ5izw4mU22WCZd1aLZVyDtLUbfwrP2WKO5iJlKMs5R1anPbxHkCF+0May9/vSBg+7P/n9S+xn8n8D0FUozIhtzmX8FdhRV4OhKA5fv7/igW4DxEToKNPMhDAN29eL4O7YDDLtFOkUMb5MePrMDD9C23ZpXYgy9iegU5PvGRVSXJMb+ZnS5RN6caDPOEaLPuqZZQ4Vfks5LajPTHiIT3t6ZpdbpwQPIJPhxN/NsCbCKLF6cqdU1J7mMl2Wik9FgXUmGPW451LnDvFrNAGzHzDtyXp4VOEsgNUbHgFT8wDSc57BOai/TT55kUYe0XXqPr3HLOrU0EkEhirzksRzVDemXtgSk0I7MH5T8nUCv599mWkmADFvxZ0KWZIbjQ/H32MXh4X8wqC1K9gSXEe/V0OKDklTci6sWe6KkxhihHoDJVRYljES17AgKgM4pV3RM15KpnseLvUMLZqrAI5seqlknrRGg1Q4hmFN8aYW80JApSDFBWavoS3u/p23s6EVnZwb8tzPOjQregeFHa4gRoEAbS+44Vwo74CCle8ImAowUqZApz4X3Xx2XpQQ28jFsYHtWvjW1qf9eQZ2gbyetnhMrHJ1QkWGCzb/sP/KNrMhwWaEbmgutcEXufa7yAOCJ7tQn5+/3oob
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7053199007)(22082099003)(56012099003)(18002099003)(38070700021)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vk9VZUk2Uml1dWI3RmVxNklkNVBWUHhVazNxRFZGZU1jSnJ5TzdadFlQRVpT?=
 =?utf-8?B?SFhEU1k5TlNNL0lSMTFsenJmcnNXbVZFblA0TmhrNzhESWZGVUNGcjY3U1Qr?=
 =?utf-8?B?cmFwblpJaG5ySTJjNDE5b2FvRXZXR3E1ZHdIaHI0SHFpTEVFRCtxZUd2dTRN?=
 =?utf-8?B?RXBRbTErTzVBZ0FPUkF3b1BrTThleFRqaTJZQWFaMitaQXRQTWtUbVpqb1dw?=
 =?utf-8?B?a01wVy9PaWRvR1VFNEJYTFBOWUxZM1VMYlRmaVI3Q2xqeXFESWU2ZWZJM3VV?=
 =?utf-8?B?Tm52YkY3Rnhya1RaeC9sSFBNT3ZFa2lNNzZxWjdYRWh5clpVK1VQOWZ2YmV1?=
 =?utf-8?B?bDYyRmRQck8wazNVaHhQcXJmbEREV0RoT1h0UDZpTkNvTTVKTjJGUXloMmwx?=
 =?utf-8?B?dDdlNEhaM3hHZXpOZkhFam5UaHBSM3pJNmE2djV5VFNGeGtxclkvR0g4NzNl?=
 =?utf-8?B?TERMY2IzWEptSHlwcGFCWjI0c2pzclpYNEk1VEw3R1lTMUJieDZ0ckZJVnJ4?=
 =?utf-8?B?TzIreTRBMjJNMU91WEtvL3k3NncvanV2K1RCM0tHelVBdFBnbFFhRVZ6cG9o?=
 =?utf-8?B?d3VOdnY5akRiUjZwWVZUZTRybTlXTnJXc3dhUXpFcHdsOVZVNHFqSm5ycU56?=
 =?utf-8?B?OUp0Y1F5VDBnNlZEVHE2N2JCc3B1S3luNzFhOTljOTFoZ2Fyci9LZ1hmajEr?=
 =?utf-8?B?eFBKMjMyRlRCK1BCekxrQjVQSGx3TlVncUpIZHFhd1YwYzNsVGlXWnVNSW9F?=
 =?utf-8?B?TnIxS29sUmNJVGdNSkQ4QWR0eHo2UHI0bnhBTHFLQTA1ekdUbHVNdzljdVhn?=
 =?utf-8?B?cUlSMVNta0toZGMvaVc3MGtoSk92c3Z3Y2Z4d0pzZEZMRFNNdHlsbWY3RVBP?=
 =?utf-8?B?Q1Rsa1BrZ2ZwTWVxNHQyRi9vZVRVRksyakErRm11d1ViaEgrRmNpMDJOck5a?=
 =?utf-8?B?MjFIQ3ViMGczdVkyWStERCtwNTY5SEZWZWRzOVVWRTdjYzFMQkxYMXAvMGUx?=
 =?utf-8?B?Q2MxZmpvcHJtYjhSOHJpMFA2YXErM1BPTWp1Qi93QWRWQUljTXJybWdHRFdW?=
 =?utf-8?B?cFpRUDg4U1hYYVliR2hoQkMzMHBCcWMyemtSQ3ZJZ0ZONDNZN1hIWTJHNzEx?=
 =?utf-8?B?UVY1RE96d2wyR1ZxNkZXTm1IN08wNEJUUkp6eGdxUXVkTTVOdExXc01FV050?=
 =?utf-8?B?RkI4UGtSQ3FsWUhBeWV4b2NCSGVvTjlNZnFFcE1NRWdBY0xGRzMzZWtFTzVx?=
 =?utf-8?B?M2lUZGFyeWFTUEwxMlBaN2VOcWkwYkMvQnZRdnBJSGxSU25nc1JLSmkwM2VD?=
 =?utf-8?B?UFlxalZIMGdTZ0QzdDg5ZGE4NEE5R3l1bktpVUlYY2oyYWR2dW1rdDhocTBo?=
 =?utf-8?B?dHQ3WC9YcjJiblUycUZUSDN2NWZnVE9weUhpd3RCYkhUZXk4ZlVOeG92ekhM?=
 =?utf-8?B?UEpNRUJVN2FScnlrMXYrd0ZhNnIrL2hSTUpTSXZUd1FHMk1EUk1sUmxtbkNy?=
 =?utf-8?B?MUg3M0pmbHFLeHZ6M3ZHYnF6aUx5MjI3c1ZuaUw5TkN0blRoUER2eWNXQWd1?=
 =?utf-8?B?RmNEVnQzYmJPQ29Gd2R6WUlkK3N4SVFtZDJkRmFuVmJuRkpYTllTR2lES1ZJ?=
 =?utf-8?B?NEJRYy9VcHhld0VMM2s5cHBqMG1LckI2Wk1BZndFWHdwRXlQODNuTVJIWCsy?=
 =?utf-8?B?Zm5URWhGd1RpZVY5V1ZJTXJmT0k0RXZJKy9YRkc0dUExMlRsdXRHdUIwdUs4?=
 =?utf-8?B?ZzRjemljZHhkczdDcW56WUtmWmFkb3RQMHBFSkU1aFFPM29vU2NjZFk4Uk96?=
 =?utf-8?B?ZEFpU2VSUUY0cXErU3NUY0svRGR5T3pzWnpURTIweldqTVlmU0lPcEEzK3Fs?=
 =?utf-8?B?Q0cvaTJnajdraVdUT2ROUSs2YVFLNDUyNXZFZ1BEZlA2eGNkR0QvdjhMTzRr?=
 =?utf-8?B?QmFpYjh4MjAxaDRIMHgzUlo3bWh1UFBWeWRIbXR0OEdMRTd2dVVSdFZselRW?=
 =?utf-8?B?Qk40YmlUOEs4ZGJENXpqcTgrZ2tBRDlrYS85M1JZZEVVbGhyMmRnV3B5anZu?=
 =?utf-8?B?M0hMS0FFbW9LbkRIVWQyMVRZWENzNVZKdmNvTVZsSG5aNWxUT1pBNkU5L2c1?=
 =?utf-8?B?VEdEM0N2eEhHMFR4UGR0aXk1YnF5N2JLOWtnNEZxR0VibjRvSTNQb0h1Z05C?=
 =?utf-8?B?NUlYcDBKcWp6bjBValY5Q2RKbkpTemhWamxuZnhMUHZXanVqekpFSDZCeGJa?=
 =?utf-8?B?VG81aFo1bHpNNE9zSVhISnM5T0ZGZlVNUFRxeTR3em5JUHF5eUxtRjZkWHJk?=
 =?utf-8?B?YlFKUkY5TDFaR2Z5am9IWlIwenYxTWxJK1oreTNLTVlEenVxaFA3R0lNbXZq?=
 =?utf-8?Q?15EzhOxQW3CHujKc34x2oS7ybEzbQ7lAVNANY+emjkD97?=
x-ms-exchange-antispam-messagedata-1: SnNdnLPuXq5r/A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kG1xfullLB4f6FKp+gbOEGsRmsOGLkO6PCJLz+taueuQpolvNUbZwh2cyWHqQKYsxNg00dbN2IaTeuFC6TsG/Dm6KEG/66jLZvZVrmyoAOahgc5W53WR4zZ12ECH2Z5M7R4saku7ME7VoZZPMP+zwUNKbem+c3JJDDEe0rLS+PxRe8lbh/X/RMRsSxCb3eeceFUctODA49gFNGgEYlkEw6mIPjvKJkhXTkdhcs25zSuXoOo7XD/EahHHov7Jik2dRqpD5fcA8hS8w97ezULKX8JkDf85R882C1mFO8JOmoxhXFMBoe+PrEpNjVAsXTpJEWIQstZtRxAJ/Mdy+vGRWQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0716e18c-e623-4b3f-a024-08de8653f1a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 07:40:22.7736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BG1j8wibrzrX83/yKe0Vw74hBe/afXe8EH/nFU2A3x9pTPWJ7IGD3298G62isA1oqgDA8DAnK2bxs+4H8tbiICVkBSjvg8Lh1x0mFnxkbBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7275
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTYyODg0Lw0K
aTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpLg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEphbmkgTmlrdWxhDQpT
ZW50OiAxOSBNYXJjaCAyMDI2IDE2OjM4DQpUbzogaTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6
IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwva21zX2NkY2xrOiB1c2Ug
aWd0X25leHRfY3J0YygpIChyZXYyKQ0KDQpPbiBXZWQsIDE4IE1hciAyMDI2LCBQYXRjaHdvcmsg
PHBhdGNod29ya0BlbWVyaWwuZnJlZWRlc2t0b3Aub3JnPiB3cm90ZToNCj4gPT0gU2VyaWVzIERl
dGFpbHMgPT0NCj4NCj4gU2VyaWVzOiB0ZXN0cy9pbnRlbC9rbXNfY2RjbGs6IHVzZSBpZ3RfbmV4
dF9jcnRjKCkgKHJldjIpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3Nlcmllcy8xNjI4ODQvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPg0KPiA9PSBTdW1tYXJ5ID09
DQo+DQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gSUdUXzg4MDkgLT4gSUdUUFdfMTQ4MDMg
DQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0N
Cj4NCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+DQo+ICAgKipGQUlMVVJFKioNCj4NCj4gICBTZXJp
b3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJR1RQV18xNDgwMyBhYnNvbHV0ZWx5IG5l
ZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsg
dGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMN
Cj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzE0ODAzLCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRl
YW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+
ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBm
YWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+DQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9p
bnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNDgwMy9pbmRleC5odG1sDQo+
DQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDQyIC0+IDQwKQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4NCj4gICBNaXNzaW5nICAgICgyKTogYmF0LWRnMi0xMyBmaS1zbmItMjUy
MG0gDQo+DQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPg0K
PiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJv
ZHVjZWQgaW4gSUdUUFdfMTQ4MDM6DQo+DQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4NCj4gIyMj
IyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+DQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBs
aXZlQGV2aWN0Og0KPiAgICAgLSBmaS1za2wtNjYwMHU6ICAgICAgIFtQQVNTXVsxXSAtPiBbSU5D
T01QTEVURV1bMl0gKzEgb3RoZXIgdGVzdCBpbmNvbXBsZXRlDQo+ICAgIFsxXTogaHR0cHM6Ly9p
bnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODgwOS9maS1za2wtNjYwMHUvaWd0
QGk5MTVfc2VsZnRlc3RAbGl2ZUBldmljdC5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQ4MDMvZmktc2tsLTY2MDB1L2ln
dEANCj4gaTkxNV9zZWxmdGVzdEBsaXZlQGV2aWN0Lmh0bWwNCg0KVW5yZWxhdGVkLCBwbGVhc2Ug
cmUtcmVwb3J0Lg0KDQpCUiwNCkphbmkuDQoNCj4NCj4gICANCj4gS25vd24gaXNzdWVzDQo+IC0t
LS0tLS0tLS0tLQ0KPg0KPiAgIEhlcmUgYXJlIHRoZSBjaGFuZ2VzIGZvdW5kIGluIElHVFBXXzE0
ODAzIHRoYXQgY29tZSBmcm9tIGtub3duIGlzc3VlczoNCj4NCj4gIyMjIElHVCBjaGFuZ2VzICMj
Iw0KPg0KPiAjIyMjIElzc3VlcyBoaXQgIyMjIw0KPg0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RA
bGl2ZUB3b3JrYXJvdW5kczoNCj4gICAgIC0gYmF0LWFybHMtNTogICAgICAgICBbUEFTU11bM10g
LT4gW0RNRVNHLUZBSUxdWzRdIChbaTkxNSMxMjA2MV0pICsxIG90aGVyIHRlc3QgZG1lc2ctZmFp
bA0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
Xzg4MDkvYmF0LWFybHMtNS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzLmh0bWwN
Cj4gICAgWzRdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9J
R1RQV18xNDgwMy9iYXQtYXJscy01L2lndEBpOQ0KPiAxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91
bmRzLmh0bWwNCj4NCj4gICANCj4gIyMjIyBQb3NzaWJsZSBmaXhlcyAjIyMjDQo+DQo+ICAgKiBp
Z3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzOg0KPiAgICAgLSBiYXQtZGcyLTk6ICAg
ICAgICAgIFtETUVTRy1GQUlMXVs1XSAoW2k5MTUjMTIwNjFdKSAtPiBbUEFTU11bNl0gKzEgb3Ro
ZXIgdGVzdCBwYXNzDQo+ICAgIFs1XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9JR1RfODgwOS9iYXQtZGcyLTkvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJv
dW5kcy5odG1sDQo+ICAgIFs2XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTQ4MDMvYmF0LWRnMi05L2lndEBpOTENCj4gNV9zZWxmdGVzdEBsaXZl
QHdvcmthcm91bmRzLmh0bWwNCj4NCj4gICAqIGlndEBrbXNfaGRtaV9pbmplY3RAaW5qZWN0LWF1
ZGlvOg0KPiAgICAgLSBmaS10Z2wtMTExNWc0OiAgICAgIFtGQUlMXVs3XSAoW2k5MTUjMTQ4Njdd
KSAtPiBbUEFTU11bOF0NCj4gICAgWzddOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVF84ODA5L2ZpLXRnbC0xMTE1ZzQvaWd0QGttc19oZG1pX2luamVjdEBpbmpl
Y3QtYXVkaW8uaHRtbA0KPiAgICBbOF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzE0ODAzL2ZpLXRnbC0xMTE1ZzQvaWd0DQo+IEBrbXNfaGRtaV9p
bmplY3RAaW5qZWN0LWF1ZGlvLmh0bWwNCj4NCj4gICANCj4gICBbaTkxNSMxMjA2MV06IGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTIwNjEN
Cj4gICBbaTkxNSMxNDg2N106IA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJt
L2k5MTUva2VybmVsLy0vaXNzdWVzLzE0ODY3DQo+DQo+DQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0t
LS0tLS0tLS0tLQ0KPg0KPiAgICogQ0k6IENJLTIwMTkwNTI5IC0+IE5vbmUNCj4gICAqIElHVDog
SUdUXzg4MDkgLT4gSUdUUFdfMTQ4MDMNCj4NCj4gICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4g
ICBDSV9EUk1fMTgxNzM6IDE4NTYyOWZlYjhhZWU3Y2Y4OGY3MmQxZTY3NTMxNTc0ZjFiZWE3ZjUg
QCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBJR1RQV18x
NDgwMzogMTQ4MDMNCj4gICBJR1RfODgwOTogOWU1NWI2Y2RkM2FkMWVjOGMyMjY0MTA2YjAzNWJl
OTFkMTJkODMyMiBAIA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1n
cHUtdG9vbHMuZ2l0DQo+DQo+ID09IExvZ3MgPT0NCj4NCj4gRm9yIG1vcmUgZGV0YWlscyBzZWU6
IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0ODAz
L2luZGV4Lmh0bWwNCg0KLS0NCkphbmkgTmlrdWxhLCBJbnRlbA0K
