Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAA2CC6B01
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 04:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B341010EFA1;
	Thu,  2 Apr 2026 04:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLPTgg/5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2992110EFA1
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 04:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775105748; x=1806641748;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tYsuiOGjEbLswQ+8iFPAxYgH8FIJgh98B2Uz1Ej+iWk=;
 b=WLPTgg/5BlmbLxU+ceqth01P7iD3B3iaA/qcI8RRQgvPDUl8reNPQU/p
 iPWIGXf/8k3GjDnI+/vn4ePdUQdRCbXYTWCIqD5ki1smYeG6RzyDpXInk
 3LFOQro2qYYztLgDo63ihJRGVX2IMtM+Ps1PuD0FpSAwCqV9g9FDF8/LP
 ZvCiYmobaKDHG+FJm6IU7h1n2i3zkB1xwaZiBlSJvM/BnzXf8ICrKWBXN
 +rx8L3J20KSVC6n7iWiT79pA9g6koBmHXViFyfbVOhsZsOP3/ljKmoZ9k
 Wtv6ESIuJuf3nWAYI8NeLaRlKctCPEZYPmu6Tyx/GfLHqPzA1W1swN8Gw Q==;
X-CSE-ConnectionGUID: 2amkkeFGT56NJ4COILW+Qw==
X-CSE-MsgGUID: EgX7y8vKRVecNvLm1S9uOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="80044564"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="80044564"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 21:55:47 -0700
X-CSE-ConnectionGUID: sxV9H4ocQNqMrA5n+ZauTg==
X-CSE-MsgGUID: UytLWsK0RHyfWz1sH7kbUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="225867112"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 21:55:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 21:55:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 21:55:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 21:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIJyNDKmmzfmc632MAHfWt0KUwZE6hA4O4N2+ti/W7I3WJ0MkCVCBpfvxcqCpDlxK3L9fW6ek+BeZeTnafxoTv6YnmP4L19IbIb7hGGtfbBrZUt5o3t0r5IPLlS2OEV2evfYln2thO5eZLJRaLFUywzikMBbMCMi0ix6+9bch+gwKeFEH1DNCXhVksDDY4j1B1uShWB2BqKZiNRy0VaeefevZleICR9wDw5BFpWzaMOF7KikDCGUX0iq/b7kg5uSsBaXBCjSebqxt3z5FuxTJGADmmGUIEyqfwCMaLpnPWEW+ZAYgrZX0xNPJHG0tVmHHrn/wckVSv1xDNgnseiO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYsuiOGjEbLswQ+8iFPAxYgH8FIJgh98B2Uz1Ej+iWk=;
 b=oTSFeq5YoGjm9yMHlG57P1qj5QEMsWSj4QZShWCQSAWASvZoWsV/YyLUT/KKk6uML86DX17MUt4c4PePQaovHfIjj/cXIBHc5e2Wy2jqj/DRKNnE+w3+Z+Dn5J6LCleMYk3Uweh1/i6g62HaMOrSh8dJtQHzT1VyUoPpwJBS5mzDHwXU132zat4WXttU9EsrrENwI86mIkaMMAcBHW2MqVn0I2iT0lhaMhfB6alcLMUuxE3uSck7gQ4QDOuCu9x5Gzq8ySwbfS+o5Tg/5Vp4Tw39NdhP4BMTEiKkAzm+2R5xcx4o2YsqExH18GKBzRDevFanYKpoK1eFPd4jr087Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 by DS7PR11MB6173.namprd11.prod.outlook.com (2603:10b6:8:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 04:55:43 +0000
Received: from SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0]) by SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0%3]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 04:55:43 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/3] tests/xe_compute: Don't use FAULT_MODE flag
 when not needed
Thread-Topic: [PATCH i-g-t 2/3] tests/xe_compute: Don't use FAULT_MODE flag
 when not needed
Thread-Index: AQHcwbd00nLh3K+JgEuEwa++191D87XLNlkA
Date: Thu, 2 Apr 2026 04:55:43 +0000
Message-ID: <SA1PR11MB8428E23FAA8ECC7BC68F00908D51A@SA1PR11MB8428.namprd11.prod.outlook.com>
References: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
 <20260401091017.2772519-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260401091017.2772519-7-zbigniew.kempczynski@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8428:EE_|DS7PR11MB6173:EE_
x-ms-office365-filtering-correlation-id: 9b556af1-df34-43af-800f-08de90741866
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: IIP6jZhW24w9D+S6cqIubUBPfb6n/C6LstXkKnJPAs3XAZAWEBsmeuDKLkOCJ56gt5y4qVtdrfNejRBTt6C35gIejU+JnKLcquP9Gr3EJ3y/nL10Cse9IxetqA3ZX9WiRrXztW303xERzqZqUlhYmjChLYh7QJt+KHPE/QUTitWzJFmKnGcOe7pN2fLjVajFaCI8JdFGC0/ueglQqgUu/qIV5ny1Z2wXxheNtoUcuRmIBX6QfNSYuNjgGQSIkt6PD3n/BGasiIR9bg/TLgfPgUCfiggwyyWDPFI3vpGM9SuBo6O/zFCbjKiwrvRaFHPqha2APlZRkpGK8vmEpsqR5csOuMiN0BFIO8nilcW2YPSwyFEDAzz1rYbO000nyYcRQwMr6cgVwdNroJ0awGwGcRbXLhaZNt7am4QlF+hYxf78AZU62S0DuuVXEtuu3J/cDAcBiSFynVjwVtXZXxH9A6ef/XEFNP4B+jFFFvxab3vVyICwJcePxZnr4s4UbeZ+btOSfV/8Z1ZgV/rSo2Jd5khFeZJLvn+OO4Jt643mHlVOe755xqCQcjBYcDoY2ZbbEboBovTf4+BNJ95DddgmLprWian4YW2Kgm1wSgfY020qO9nUDy0an2viUgdDNEJDWrTXk1nhhMU9IY7ku0KPJNnWAOVPG7DFp6B0fsIcuplZnT2bwskD+GeUX5AsE1spYlrlym6/sJxs3V121GrtxscEsyDxBPYfuiyRQrGyt6XnHb3w7sHD9nEsQZ4yaIEo9SLUS3BaBIHP+nWGlL3TnNxtJsEr7RDmOAGmcDsG//0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8428.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1VjbU4xSkVsS3RRc016R3IxblJDcnMvS1d5eStDaXlZTlovUWM3ZHN6aDll?=
 =?utf-8?B?dmtQUWl5UWlnMnhpY3IwQ29PdXFXcEc4d0twM2duNWZEaVZZL2J0Yk90cnRt?=
 =?utf-8?B?c0w2SXdobmExcnZzaHF5YmRaWGxpV2ZSaTUyalF3alBRMkwwT1E2c2xpbzFD?=
 =?utf-8?B?SzNoSHcxTTltYlZoc1FUcUYza1BHVXo1K2thbnhrZHNTV2Rkc040NDFnaEdL?=
 =?utf-8?B?OW0rUWM3VDM4THZ1K09mZmx3WGdvbDVCMjd5aExsdVlyWUMycGhQZmM4d2Vl?=
 =?utf-8?B?R0xaZnRXZnFwYzJJMFVDTW5rR1BYTmZaeGd5VnR1cHFJemZuRHBGNkM5WWt6?=
 =?utf-8?B?QU8rM0RCOVVYc2M0cWwvWVd1dDhzNWVlUzBwQkNvdkdDdnh5SmlQL0gxVy9L?=
 =?utf-8?B?V0g5OHZqVTRWZnE2Zm4wOGlIenpJQzVMaCt5Kzk1UkJqUUdTUWFlR2VBUXN2?=
 =?utf-8?B?ck9Hc1lwTXZFTTNrNE9sSzF2NTk3VElaU2cwbnJRc1FmQ0pwODErTWt1blRi?=
 =?utf-8?B?bUpIaGNSWFg1WVRIaXlWOW92QiswbWt0d3dGbXBxU2V5L1hqWHRQSURmcVhv?=
 =?utf-8?B?aHVpYVNleTd3Smh2ZEdvRU9FcmJYaTA4WkIxZjliTWtHTUx3cjBNeE5EVkFZ?=
 =?utf-8?B?M0RDK0lXSWwyUnAySXlleElqT1E0b00zYWpWVU9TRjNRUnJBYkxBNUlQb3B4?=
 =?utf-8?B?N3JWZzlRNnkvNjJ6Z1ltZHQ2WGlKK3oycGorNVdhNCtSTWl3M0twRjh6a1pm?=
 =?utf-8?B?YVJiZExjZGh5SjFDcjgzUDFhY0pXMnVzZnNjUzdCbEF3NWpOL2pEVEFzY01Z?=
 =?utf-8?B?cE5VbUp1dEVKSkZZTVhCdnppVEUwZzRBSk9kRHRsOXc1eGxENU5LM1RsZzFL?=
 =?utf-8?B?U2NPcDAzbjl1d1gzNU1zSjJ3L2pnQ1cwRm5LamN0SEpiZE5qd2hhbkQ5c3FU?=
 =?utf-8?B?aHBESktOK0d6Ym5ac01JRU81UFNjR1BiTmtjVkdja3E1dVk5YXMwMWo2SGwz?=
 =?utf-8?B?ZUp5NHZGSWZGZCtyWVczM29xM2lubG16Zjd4MmV5RFJhSnRFbWNIYTdYa0Fn?=
 =?utf-8?B?b0FxRDdDcVJJWlJHajdGckxGdzRPY0o1QUVydStUaGQxME9QMVFsNW03OG1L?=
 =?utf-8?B?cGhZcXdMMUR2c0tjMVBqZ09hUGR0dGZiSnJZVUtRTGw2WVJCZm1BSDg0Yjdn?=
 =?utf-8?B?RlBDYi9uWTZ1VXJkT3pQdVhDN1NSU1RUOFdWRy9ISnNMbkJzOUVwWFhhNzgr?=
 =?utf-8?B?TlFHallQZVI3UFB1azVhTi9saGluUWRqdXlwR0Z3SHFhUUxSWGYrNjZMQmwz?=
 =?utf-8?B?c0hGbERwL0FueWZrSHhZQkV6SStXNUdLMnduQWh2YkNrN0hNSnNXRTZoZnRw?=
 =?utf-8?B?SGt5dy9kM2VmY1l3eVoxcEJtbnNibC9nYWNiZUxOVnppWmhrZDVoMWsxejNm?=
 =?utf-8?B?ZmNCYm9Lci96MlBBTVAySzB5Mi9sWVZMa0hYbDNkbEJNcnc2SW0xN1JzWU5u?=
 =?utf-8?B?dm5sTHJYLzNqS0xmeHBJTk1RUTc2blV5eWFVUUJYMWF1a0o4OFVsMVVYWUwv?=
 =?utf-8?B?eFFJRmVXQm53NmpxUm1hdXM4Sjg1aC9NYkk5UlBtbmZubm5LZEF1OFY1WEV4?=
 =?utf-8?B?cFduUkltbUY2WThlbm9wT1lIbGxqSzAxK3pnZEpuNjVZeThYVllGUThNdEVr?=
 =?utf-8?B?Y1p3KzZ2a2g1cFIrTWF2dnI1SnQ0Q1JpWG1ma2duRGNZWUZ4VlkrOUJVbFFC?=
 =?utf-8?B?aWcyTFNNVzFCZmhEVDM4dU1ybit5OHNCYUJ5bloydmZ6aGJBUUpPYkNxZ0Nh?=
 =?utf-8?B?S1J0OGxPekk5NmlzU3Zyb3RZMXh3SnJ4ZjErNTNXdG4zdWN5OFkwS1RCQ09H?=
 =?utf-8?B?YUpnbUtQNThNZGhnWng3U1V6OVNzak1pclZjYUlYWXU4bWVZNG1MVjNxVzRB?=
 =?utf-8?B?cmdkL05HWENiM0trN1JleXI4OTRpUVpycmVyMm93MzQzZEs3OEhhSEVualhH?=
 =?utf-8?B?Q01DcnlHME9ZbmNlVkNTWGdaVVpSVG4xMkVWOHFaWFZkb0lRTVpzekUwbStF?=
 =?utf-8?B?NVk2ek96VEkwSnlzaWZwbGxkK2Q3S01EblJLclpyR2s3TC9rbkovdFQvKzhO?=
 =?utf-8?B?ai9aeUZyUUpDVlBXT3M0R3JWRDhxak9pYUZ3ZnhDTEk1S25zTVI3Y3kwbFgr?=
 =?utf-8?B?ZVIwY0pCVGVOMWVON2R1OVozakVRTWtzUjIybTJrZ1ZBVHVRL3V5ZFNjV1JN?=
 =?utf-8?B?ZngyUlI0N1ZYemtVWnlrOW4zV1psMFhiY0duSGVXV04wWE5VOUF6SUx0YzAx?=
 =?utf-8?B?QmZRbkRSRWJLMkR6R3liN2RxdHhnWUNPYzRnaDluMm1OWWM0dmMvRmNIek9G?=
 =?utf-8?Q?EE36xNF7rcg9LCqhKmAbwW+r/kJvmx8M+D5t0yr46T/wi?=
x-ms-exchange-antispam-messagedata-1: Ayq4k03muh+M9fKV0QAoPIaympJDYTy6gnI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ka7CFcwkAH5SLc2GTOgZwMdxPBNRK6pR7QGgzlp0oHHsodPlWtON4zVnOqz+MlRrfIoup4uefpLdtyqX866PwWqaWvJoZlrxe3d+rO1g1QOXLMGokbqavZxpf97gJTav20dthyKNqG50jXxyxNYkHUNzxOGsCl/AmNICJPQt7oZph6qwdfbt97uAdrOscaZUHT8JSCdqvbEcOllbH3jtVUqgSn/1hAtUWFHOdz6KYIFrozqohvpeNlJ84+hIVg7k1A6qOctmMxnkDhoT2oGDXgpYGmhhaxeC24XCYQDSosYIYykZZUaln0r7gmXClMe++0gCUuRBNkNcVMskNUM0Sg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b556af1-df34-43af-800f-08de90741866
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 04:55:43.2635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v82K2VeHdFSivtC0BltiWxH/Bf1YXXfRjYVMxdPn1cCn6NWclTDvz7m5UR6UysSc/jrVgbl6h2COrhGwI+mj6WSpCHWcet9AcelHF8+oPFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6173
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2VtcGN6eW5za2ksIFpi
aWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNlbnQ6IDAxIEFwcmls
IDIwMjYgMDI6NDAgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47
IERhbmRhbXVkaSwNCj4gUHJpeWFua2EgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFtQQVRDSCBpLWctdCAyLzNdIHRlc3RzL3hlX2NvbXB1dGU6IERvbid0IHVzZSBG
QVVMVF9NT0RFIGZsYWcNCj4gd2hlbiBub3QgbmVlZGVkDQo+IA0KPiBGb3IgYnVmZmVycyB3aGlj
aCBhcmUgbm9ybWFsIEJPIHVzaW5nIEZBVUxUX01PREUgaXMgbm90IG5lZWRlZC4NCj4gUmVtb3Zl
IHRoaXMgZmxhZyB3aGVuIGJ1ZmZlcnMgcGFzc2VkIHRvIGNvbXB1dGUgbGlicmFyeSBhcmVuJ3Qg
c3lzdGVtDQo+IGFsbG9jYXRlZCAoU1ZNKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3
IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBDYzogUHJp
eWFua2EgRGFuZGFtdWRpIDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiAtLS0NCj4g
IHRlc3RzL2ludGVsL3hlX2NvbXB1dGUuYyB8IDYgKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ludGVsL3hlX2NvbXB1dGUuYyBiL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGUuYyBpbmRleA0KPiA3
NjJlNjZmY2QzLi5lZjJkODkxNjY3IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9jb21w
dXRlLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfY29tcHV0ZS5jDQo+IEBAIC01NjMsNiArNTYz
LDcgQEAgdGVzdF9jb21wdXRlX3NxdWFyZV91c2VyZW52KGludCBmZCwgdWludDMyX3QgZmxhZ3Mp
DQo+IHsNCj4gIAlzdHJ1Y3QgdXNlcl9leGVjZW52IGVudiA9IHt9Ow0KPiAgCXVpbnQzMl90IGlu
cHV0X2JvLCBvdXRwdXRfYm8sIHZtLCBzaXplID0gU1pfNEs7DQo+ICsJdWludDMyX3Qgdm1fZmxh
Z3MgPSBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERTsNCj4gIAlpbnQgdmFfYml0cyA9IHhl
X3ZhX2JpdHMoZmQpOw0KPiAgCWZsb2F0ICppbnB1dCwgKm91dHB1dDsNCj4gIAlpbnQgaTsNCj4g
QEAgLTU3MCw4ICs1NzEsOSBAQCB0ZXN0X2NvbXB1dGVfc3F1YXJlX3VzZXJlbnYoaW50IGZkLCB1
aW50MzJfdCBmbGFncykNCj4gIAlzaXplID0gQUxJR04oc2l6ZSwgeGVfZ2V0X2RlZmF1bHRfYWxp
Z25tZW50KGZkKSk7DQo+ICAJZW52LmFycmF5X3NpemUgPSBzaXplIC8gc2l6ZW9mKGZsb2F0KTsN
Cj4gDQo+IC0Jdm0gPSBlbnYudm0gPSB4ZV92bV9jcmVhdGUoZmQsDQo+IERSTV9YRV9WTV9DUkVB
VEVfRkxBR19MUl9NT0RFIHwNCj4gLQkJCQkgICBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfRkFVTFRf
TU9ERSwNCj4gMCk7DQo+ICsJaWYgKChmbGFncyAmIElOUFVUX0lOX1NWTSkgfHwgKGZsYWdzICYg
T1VUUFVUX0lOX1NWTSkpDQo+ICsJCXZtX2ZsYWdzIHw9IERSTV9YRV9WTV9DUkVBVEVfRkxBR19G
QVVMVF9NT0RFOw0KPiArCXZtID0gZW52LnZtID0geGVfdm1fY3JlYXRlKGZkLCB2bV9mbGFncywg
MCk7DQpMR1RNLA0KUmV2aWV3ZWQtYnk6IFByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFu
ZGFtdWRpQGludGVsLmNvbT4NCj4gDQo+ICAJaWYgKChmbGFncyAmIElOUFVUX0lOX1NWTSkgfHwg
KGZsYWdzICYgT1VUUFVUX0lOX1NWTSkpIHsNCj4gIAkJc3RydWN0IGRybV94ZV9zeW5jIHN5bmMg
PSB7DQo+IC0tDQo+IDIuNDMuMA0KDQo=
