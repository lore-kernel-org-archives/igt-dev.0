Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3384D3EE8A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 16:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740AA10E9F0;
	Thu, 22 Jan 2026 16:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYBYEOhN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA6C10E9F0
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769098723; x=1800634723;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FrXzLS/QLPQ7WbmAjTt9Ad1SPfI8ZaiVEJXmAskBiKM=;
 b=TYBYEOhNIVCTOmgeQFek6HsRPN5RJfO50o7jwg8PjHsMKklm+OszzG/o
 A2LwCUtgwVm0nziX9EeQIQ3fwTWbsmhydy05e5QgTbQRFaNi3KWhKsDlj
 4Al7DwbxdbhpnNp7xK0qyhXsIkKAwMMH5J0oSg3TsDhj5dyRqVOOVzF8q
 Zzfi9bIdXGSdWA8xUUZ27EI9A6PSAFzuE72LK6UdWVeJdydQ1dJs6zhXB
 6fitSScurW2xbOoTvIOYra1rDqFJCMEbbb7Mv1gekpQxJ0c1qd7ulNUvW
 5V2Z2ryd1TfGaXaNKrLisp8E+LlSdJwgEG4KlkYmHNmIrIHmfypby8v+F w==;
X-CSE-ConnectionGUID: GRfxLMSER3S9VjsQTtYNnA==
X-CSE-MsgGUID: jgrf8x+uSIu3ESsxyOTMMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="73973057"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="73973057"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 08:18:43 -0800
X-CSE-ConnectionGUID: d8S5aNtrSfSYUDJKMwqzpA==
X-CSE-MsgGUID: KEG1WV6MRLiVuSOTpzqobA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="244388639"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 08:18:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 08:18:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 08:18:42 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 08:18:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezKSix9+QBnFyoPfbwY8oJ255HtubN7k1nTVqYX/QSmtS1n6/QsbH7irc2HfiWr2vAq+dovZuTJnqQFlKVzW3FHgZJwXdYhZpkrmMFzr8k5IxN6ePEdQn9Hp0/NKOzdKZI8TUVKWTmDIO5Ku+JrQvJsqRe9usZZFmPdziL76UN0n+9dkivIYHSMnaQOuGZS8ed/xDNdwKLScGFCAhXUeNXXe6PPnymLcrpMwmxCgxEfjqjAdWQwTkroy2fuIPFW8JXjxZU9hm9CrwIZ17GA8Quvl5sYzksXU1gJ1pR1NtiMBwgJWhrvvfMBlhTW2B8NgYVecXe+4qPbKq6kCM/u3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVH316j7akPoGeALJi8jzkqj6m2zRIHLUixUKex4X8U=;
 b=fjhKXcZB2m9Yh0MmtdWCv3EvZNyBuJOOdBfwPlkbgpXH8uJhYZUusaerXAUz7mWslqd1wVmvLgTNs3z2OSF0zgT6NfqBb7JKoM88YFAqr2ZsN0CJHZ344MCXxOn04GihBfXbWq0nIrdXxul9fQKk+ETPNUlAqWwGXWeGHtPqK060et9o9AQAff8v06uleErfKueaxooyUbfNuTEGm0dCG4WlH52Onx0PCMFIcWe0x3enx9XGOdnTbFybENhJwGCDd/3BDO2vakK0RrCK1YOORvEu33+1c6m7fxleWr2iPWkulW3YdMO95yxkfYacEzgSK3a62aBly7J3eDtq+b2J3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20)
 by MN0PR11MB6087.namprd11.prod.outlook.com (2603:10b6:208:3cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 16:18:39 +0000
Received: from LV2PR11MB6045.namprd11.prod.outlook.com
 ([fe80::7776:50b3:19ff:21b2]) by LV2PR11MB6045.namprd11.prod.outlook.com
 ([fe80::7776:50b3:19ff:21b2%3]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 16:18:39 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability
 subtest per output
Thread-Topic: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability
 subtest per output
Thread-Index: AQHcimq9jnP4IsYSiU6lNse/NZOSZLVeXn4w
Date: Thu, 22 Jan 2026 16:18:39 +0000
Message-ID: <LV2PR11MB6045974F9E4C0C24CE5731E38197A@LV2PR11MB6045.namprd11.prod.outlook.com>
References: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6045:EE_|MN0PR11MB6087:EE_
x-ms-office365-filtering-correlation-id: f1016f5e-690e-4cef-768f-08de59d1e737
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qhUVuDIauJjNObyTybE3CNWy3aZdkfPPwsS/ZvD5I6AvrcrQUvrRZPZunEf4?=
 =?us-ascii?Q?4rEhuWNkgGpPo9G7vGkvlmcYHG9sH+ZuYDXETrBQZPSl3YMA/Kj9EGEhEAgJ?=
 =?us-ascii?Q?aJ00jTn0aY5Sq6bAkbeM9DpCoqKlVpr7zGFlwfr62BtWk4rcG9Fb2eNGB3Jb?=
 =?us-ascii?Q?PkhmS9ALO5lSrV/bkwNOuo2v4dJZr0Awn9hcCrItHFfnwm1PZXVwqTUiVSbD?=
 =?us-ascii?Q?Rannxza8JoTzWGW2z8EJ30cM4MCZD5QEGT2S9In9bo8REdw5b3IIdnjCr2mQ?=
 =?us-ascii?Q?xAYgcs+rkAPOtNdELZIKZrz1rJXM4DCnHD4fxEpLpPfI6Ks8zZPAnJO2/0qP?=
 =?us-ascii?Q?e+AHTPKO3vTuk7uunWFxPP2LJXOLv50lUxswtTMX/R9VlTuJnn7Y3f4y3oEj?=
 =?us-ascii?Q?LUgT2gaJ2uepgj9VpAtQS5osFzJ6iY0fMNJTdRyX7FIuadGfA9uVwcUVEiKp?=
 =?us-ascii?Q?DiiEdAO9BKYr1RxNICY9oQ9SM03ah4ORBtjq9xfCqtk8nbq5ai9YxzLy8uNz?=
 =?us-ascii?Q?EL+xyIgWfDnZLlTw4M8UUnfknO9fS8t8lqCyyJWzJDAURb/L6W7nF6ULRAFT?=
 =?us-ascii?Q?Q+pz6/+lPtTC8KQyGYQK+upVTCG9e4S/kyjie8emxyxMdd0XqeD0ku5vE9tP?=
 =?us-ascii?Q?3mQcyq9ZssD8KeQkRbzdkRVvAU/zKGJHkAtDd9GVKnhTG/n8F7zfvcUcjXAY?=
 =?us-ascii?Q?81ZkEYM+7Fp8f61U1gHTRDNKDmMxCr0C9tJL4XRAEsk4wWu3vs9L3eZ8SeQv?=
 =?us-ascii?Q?cBMtQrwcvCtyPtUnOTxysZmB9j625N3rWa+FPeO69Y0bETjnYFCEwbH6BZTE?=
 =?us-ascii?Q?EUrHaHqB5HGfe63DbwI+c7QSRpb5B8wq5MXJhJ9sXeLWeYPUDIyHF7yR3ryW?=
 =?us-ascii?Q?IZw7r4C2jDTsFgI1al8E4B20QNOi9klf9EEDAoC3RJQWTIicMsDicM0RQAWz?=
 =?us-ascii?Q?XjZihww90VCF00Xh+OQHCqP2fQVeIZ9Z9KtPkWz8+vICm+0df6uIiObyJCjS?=
 =?us-ascii?Q?JbHtZ8WEmNtZTOoyxgfQA8JZsSTeRbv6m9EqWcueNc5WEKCWbay2/tl2VT4E?=
 =?us-ascii?Q?yQ2KyBpg3+fWMxrvGoH8I5VHtroJucivhQWuHpzoSt4qoqNErE5AZSooHphb?=
 =?us-ascii?Q?dpaBt1z3phd1j/Idt8MzPVf/ThF+yCOHYyRdEVlHtiG/fyfGCX06aHLbhnnL?=
 =?us-ascii?Q?kVnTKk4vNHBwqL34EZTluT3Z8zHsAsFw8RoKOMkrPh7LZeoXEXjA9s/R71iq?=
 =?us-ascii?Q?6oKryjnaxRP1Iyave9NoZIDKDpUg58oW14acILS+/FL64jO0v0w/faMXInMo?=
 =?us-ascii?Q?8lxISCofi+pB1JIHLJuOUQpKIVzZ1FgbdHoITUDv+HNyRkm98E8luYiRTx5E?=
 =?us-ascii?Q?TRFaM5d0+36jOo7DqTwigj7FZaYSqcpDjA7WitZ7W4ofwF98kTrAG4zBWxHq?=
 =?us-ascii?Q?82XLVUs535bEJwXhZ1GcMKbGc0yykk7z3BggSOPpTnSachILDat4m9rpRIS8?=
 =?us-ascii?Q?ffiqpva9c+D7haKt9toWUb2M2p074zDk0t96mQrNApvt07o3RttYoxsITYav?=
 =?us-ascii?Q?WQ0i0URooHiq40dj18ZRydiG0SJLFnJdcEZsDTQXzLTEe7kVEuT1qDdw2qG0?=
 =?us-ascii?Q?E6pkY/hL+nPTbHdj0iWlcEA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6045.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9qXdUGgUATA/f0qigYj4usxtiwBftM+1cuzbuIyCd1d1LPTZ1SQokPeBivgx?=
 =?us-ascii?Q?JU7D6VTZtMl1s9ANeOLgCXtj+kuNWJkpX716e9jHYdOIBeqrCe0qOGLw6Gr/?=
 =?us-ascii?Q?wnBTMPsZFq4jRS5fPPV4eZd5yX6bAHhhKtg5c/qGOX7P1pji2LIwUD0V+y7a?=
 =?us-ascii?Q?No669I4Lb+j8xlQ/kgVNX65gl/GCVThK+w9z15y6DlFjwhVTB8OVkQoc6knY?=
 =?us-ascii?Q?ht7ADS5F1CRcPlI8GqHtAcJ6hSw6tWudERe5qg/KesXSDVqeiDkXYAYZiB6P?=
 =?us-ascii?Q?J23uETdRdV4g1X1wcxIbsjJ37vKtNJCV+6Al++PUPXhdjdL2KtpycGbQ9+Jt?=
 =?us-ascii?Q?H4TePw1GjcfWwj6Eq9OICSCQKwCKIQARbDNm38x4nDvbDeUC7d1l+9Z88J/V?=
 =?us-ascii?Q?yP9RGyWaEWS4mgw9FB81mDc2w0zkFaUi0A2q09MZyPIrDkxPF/vZUDxLhbli?=
 =?us-ascii?Q?inI/USKldldb8MiAxn8ydVZ3o2J/sTcEjWIzFIrf+LShZsYj5OY73gRAtySo?=
 =?us-ascii?Q?SpK6+bnfEfnEDBIOCPhsagwdmblbK/i5TE+GSFHiAUgrx8zjQEFg+CXptXc/?=
 =?us-ascii?Q?hjwV5mni09I5YU758T3S5qy2nup7K+5mjJ4wW9MNX0JZkewdEylgIpX+6yX/?=
 =?us-ascii?Q?eyn19KDpa3LdD+aX0arDoYFbWs51n+PbAsd/lmryBblVeSazDIW9kIkwA4DP?=
 =?us-ascii?Q?ZkKf6zLxh758i70n/erebMECOWNMrU3WICis13fYkSNGp1NVXNMh6juRL0K/?=
 =?us-ascii?Q?AInCOoPcvpyM6q3lJrH0RJcIzOUgEzKm4aX03nLhv0dLCKBVKoKJxSWTWWZo?=
 =?us-ascii?Q?/L/LwS3uvbDeEph95Dm/o6yOfExviCoCkCvxDuX+LwZezRt8kXHTHZ/OV1lt?=
 =?us-ascii?Q?hzbLU2hsdN40NH23L3lHjkXJfoBy1nWqXgX8oGKTuLARsk6p2NHF1RQWYnoD?=
 =?us-ascii?Q?gyAFQhHTjvPTDHGsOzS1+dRk/zk+lhCXdVYilBpws0oLbZk1OO1qWLNvhnCY?=
 =?us-ascii?Q?jodDoMro7wKadP5mHHL7NhnHVhqeBLmgR3ik/UTJ12RDQtpLygPqD/sdduFr?=
 =?us-ascii?Q?xfXw9OWGkR90CpvX4Sn8FdGSDzgHEffV3A8J1GI7nlxkbBExqhvh02vcMxo+?=
 =?us-ascii?Q?iwPA6fGQcclIEnArWkkCAgVG3WMuG9h29Jjzq5WHBNQkLHX6Sxy0+83SKgDx?=
 =?us-ascii?Q?eRMalBERZ4793HclGUk9R7ib9rTCNx5klQeaEg52JXoRj84aBRWf/G3qtQHy?=
 =?us-ascii?Q?MGyNRXgU7wSmvqkZHaSF/yPveNl9MDsLK7tPMdd5v3QxvrtkIsIECUGDN4Xo?=
 =?us-ascii?Q?YXtJsrDfTIHuwQL0wWjrz8xZGIvI6JAVJDDZ3qBAZ4wtBcBfiV4FS2KSXYA3?=
 =?us-ascii?Q?gbutPPOTj3DGevjGQ+W3y7XUD5ateSWZKBpcD430p1YK5qPX9NhmopkHoAnR?=
 =?us-ascii?Q?HU4nC0lB6jAzEkZ75NaLBeBe05Eriwq1aY+n3N2OCrwW51xH18A7AKLBRrt4?=
 =?us-ascii?Q?Ir0tEYN/xvJ+Jmt7W+XjIsEaL0/N3LeKAXOMpgRhW6QZZxYFOgaKDzgg+G5f?=
 =?us-ascii?Q?JEasRCWSogTn2FCFa9ZPGDkarxfXxqJ8dUYTvJuQe71SXmsPPez3oZ2QJg+c?=
 =?us-ascii?Q?nZ71fCUSu4KShMI6n4XS8k41yZFwM7HZtvuWmYMwhPwhA0szMWeX0BYfvZJA?=
 =?us-ascii?Q?hh2gb3einglppUH4CcqHotlito77ofLNR/IHErtZuEDY3YCDirv80IJjI1gR?=
 =?us-ascii?Q?suxzUowiBGBLwqNw6f0fezdjWUqRCcbSI3MYBIV1x782AbUetQRp95Mb99DR?=
x-ms-exchange-antispam-messagedata-1: 5Jv7SDp9EKTYwQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6045.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1016f5e-690e-4cef-768f-08de59d1e737
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 16:18:39.4895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jr18MpVaNNeNuQTsvWrVCmKKE3/qule1dHVdWP3UpFQK+5NAelDpgJdB7TGWKqnNv5oHEytxz2NjL1+M0ht0Tb8zQTFFQtfNGQucKLrTCeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6087
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

Hi Ramanaidu ,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nalada=
la
> Ramanaidu
> Sent: 21 January 2026 05:43
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability subte=
st per
> output
>=20
> Add a dynamic "vrr" subtest that checks vrr capability on each connected =
output,
> skipping if the driver or output lacks VRR support.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_feature_discovery.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.=
c index
> da80ecf66..bf36740cf 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -60,6 +60,10 @@
>   * Description: Make sure that we have eDP panel with PSR2 support.
>   * Mega feature: PSR
>   *
> + * SUBTEST: vrr
> + * Description: Make sure that we have VRR support on output.
> + * Mega feature: Adaptive Sync
> + *
>   * SUBTEST: dp-mst
>   * Description: Make sure that we have DP-MST configuration.
>   *
> @@ -155,6 +159,21 @@ int igt_main() {
>  			igt_require(psr_sink_support(fd, debugfs_fd,
> PSR_MODE_2, NULL));
>  		}
>=20
> +		igt_describe("Make sure that we have VRR support on output.");
> +		igt_subtest_with_dynamic("vrr") {

igt_subtest could be sufficient here, as feature discovery only requires ch=
ecking if any output supports VRR.

> +			igt_output_t *output;
> +
> +			for_each_connected_output(&display, output) {
> +				igt_dynamic_f("%s", output->name) {
> +					if (!igt_output_has_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE))
> +						igt_skip("Driver not supports
> VRR.\n");

With igt_dynamic_f, if the driver does not support VRR, this skip message w=
ill repeat for every output.=20
Better to check driver capability once before iterating.

> +
> +					if (!igt_output_get_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE))
> +						igt_skip("Output not supports
> VRR.\n");
> +				}
> +			}
> +		}
> +
>  		igt_describe("Make sure that we have DP-MST configuration.");
>  		igt_subtest("dp-mst") {
>  			struct kmstest_connector_config config;
> --
> 2.43.0

Regards,
Mohammed Bilal .

