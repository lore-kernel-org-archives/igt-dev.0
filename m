Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7921FD172CC
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 05:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFC910E103;
	Mon,  2 Feb 2026 05:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+tV/vml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055DB10E103
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 05:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770009043; x=1801545043;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cJ1+Aca/rosYVv6KZex0yFHX96Rr79wolR+g/KrnVwQ=;
 b=X+tV/vml3J9QuiDIj9U4EH8dspRXFllMxRPOAGakCLrnxzJUZ4C3stxC
 GLBqRUjhb9LCpSg0ZMsUTsx5MuX6c2Dl1j74tMmqQYiERFgbj33l13xwR
 zdCfA/iph60nDPqGHpgzxv42M26aKvDZsJvofX/5VjK5FUK9rKboc/BYR
 UCM6MMz275hVFJ9GQ0TYxbSOhryt4ytD3xLLSwZF8g25IBBHWzKMUoBD8
 5a1L1kxjLE2Ar7ApiuVrCfgJQsM7gtJNPxaPnWhwr6T6KrSCQV0HoA4gQ
 QhTrC6A+FzSq/y1bSA/Lxo0hnrcfY6t8XvBzv2SdwlDGm+jSydJmP/YSg w==;
X-CSE-ConnectionGUID: I7qq+zHMSpOcbINPf13jeQ==
X-CSE-MsgGUID: wg/ZW15iRRWqxdtBI2RUlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="81477504"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="81477504"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 21:10:43 -0800
X-CSE-ConnectionGUID: 9Bo8HjRgRHW7G2v1Bm+bvw==
X-CSE-MsgGUID: VdxKFmEWQoKlyfwecGrXzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213515284"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 21:10:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 21:10:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 21:10:42 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 21:10:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3QZzsF2T0S0USbMdQd7OLpJmwMXgzDORIoEWLzMHvp1nss2QIjXOOg69cytoJ2VD9fOrD6CD+SBn+bo6J5k6odFNYmUTHmDeMlGMenWOqtU3gRxISEhQu7dy0XwTH74gGCSNkQvKZLD73gDLjzHn5FTmcVgauzVjjQ3Hc4wFZmB+sUa4KyCW6YPfuRj3zuImKzWJUCQNF2PPZAZzQ/veUO01VicqIvtlT5w/GoHO6EKlcd+HZrdhZK6TypNYTqmC9LDYDKOXdsVgYCSdousd29NgB/GykVvD6Lmol2T76ENHRUVg0TwyufayNQ3AkK8Vic+U8JgFFw0dPqVePUivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GCEKpzWeNBBgelqyHxthLGE3oJYIPOaZ9lc8+joNZ4=;
 b=GXUoWwVNdT1RTFtn87SIC3kw5wiJCuXTGLZPGidwQVFgYqsV2Xi60f2JMT9qjg8t/IAdl6sQauGVkcA1filoIIsP+GQwqakYO/NogM/Gn6dkBa/VKxeEcHz1VQB/KK2Eoj+CHLPCRk7ucSjPf9SNrq0AfZ3r+oW5Y9h0+Msk88zsIDSBIMfyE0t/bsBdBwizqgSC5MZ2yndAQWc/fBXPFDZEjM9LaECJwHfBWuaj1lDe2HCwMCh7xTRBEd2KxEPFUz54dflCzZBP2yaXNtpJbNKr2j3Bqgkoiah8qdE6ugyhuujmW8HUD+DnN2lkyBhxk5NZo+qyXFCt4y1tBgoe+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DS4PPF64C459891.namprd11.prod.outlook.com (2603:10b6:f:fc02::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 05:10:39 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%2]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 05:10:39 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHcj0MoNO6+c5qIq06V360cm1QVR7VltZmAgAkwRvA=
Date: Mon, 2 Feb 2026 05:10:39 +0000
Message-ID: <PH7PR11MB67962B9D6FCFEF0FCB7BF5E1E59AA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
 <20260127043233.254107-7-sowmiya.s@intel.com>
 <MN0PR11MB6034A3B5821AA60936C59C8E8190A@MN0PR11MB6034.namprd11.prod.outlook.com>
In-Reply-To: <MN0PR11MB6034A3B5821AA60936C59C8E8190A@MN0PR11MB6034.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DS4PPF64C459891:EE_
x-ms-office365-filtering-correlation-id: 1fa4c44e-aa2e-4477-4c5d-08de62196867
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7SYkaI1/wl50LTPJ7B+Ejha+lfeNRSNfK89JIg1Fsg3SEvePcQwcaKjHsmsX?=
 =?us-ascii?Q?/GsSbPOcz3xvMseWeobM0nRa9lHh6NJ+TV3JbitFjR0U2ZJZZsNAny//136h?=
 =?us-ascii?Q?1w3zbeJeEF/VySANuglWypORzRAjzeGFLyoP6FUZ42lU7rYIZxgtrQDx9jMg?=
 =?us-ascii?Q?+fTbwITkBq374kbLlF5mfkVEXg5EAw4rwprVWkJxSpnG057HcUkSTHKhSN6+?=
 =?us-ascii?Q?LGJ/44YqsL/WAnVnMfcZfUR0qBmaGK5qRd4Tarx2fTr7liIApDMVwCC/Fc73?=
 =?us-ascii?Q?Np/Q59LFwSh/F3/9bg7HT+FP3tTZ0Swd+xlX2QIY9wa17uSBPa+Lg/oYJ2Dz?=
 =?us-ascii?Q?sgr44oiz8giYhJgSewNtohRPioMtRwLF8bDBJCbGypRvDrO7dggA8Rl/FTeg?=
 =?us-ascii?Q?3r0B5L8cG7N4I93GqMPyedv7gFfTWOpjhmyuVw39NJk4qpO2MW2G5lTSEeIl?=
 =?us-ascii?Q?E7s10zAPdq64JJNNvVP4VTlqXXkqjv2I9tSy7E2T8MHnQ6R1bO71OTYNexXL?=
 =?us-ascii?Q?Njfo9GXc2XZsycF0NxbpQ8MeXLLLnXrqyUZIdug6+IXYrEQzo7cpdi8ZVwfR?=
 =?us-ascii?Q?D3am9Oz4Kgwq42HPw3aA70ukqY9civx75Eg3xnBBpAWIeMOWbaFXg7q2lvMw?=
 =?us-ascii?Q?lKF4LIQ3bRKRu5ceO4dhvFQeGSOL1j8GEsaKNdKIaXklHopuIzBmmmFrKR1m?=
 =?us-ascii?Q?f3uziB7mXzbzddeK1vYZuuikq0yYKXD4rTPHrg6UrDsvv+ixioeRHuBI5NYO?=
 =?us-ascii?Q?13/Q05KqOsrteE1YxFUkhTM1cynGlkUl77PBwA9HxS7Sf97gjHK6vg9qr4tl?=
 =?us-ascii?Q?FMz88io2YpaLGK5cLBFI2w+EFvdx5wpfwWX4ZErqMQGPaCZaIDpnxKLkwdPI?=
 =?us-ascii?Q?wljK8tQmDcPnnKaGeuyYVbPbXRGVXDMubqc4WQe5rXqsGsi5QKJOuncDNY0m?=
 =?us-ascii?Q?7ejYQyRTBMmvTUzMDFVbRURxubtEvhImfY+gbwyTuKDwMvJXT3beVHpCWCqZ?=
 =?us-ascii?Q?ykN/jYMXuvKXQEFkd3LQvvOrdr7/i2OJqJtZimhJ56ruGJVsf8BQrB5f2udO?=
 =?us-ascii?Q?PNaHzhQSE+TJnhNSlEPY6yuyCMQshnsHZtaAGYndUpHIFpIQ5a0H3qhsPulS?=
 =?us-ascii?Q?ypRsiQRRUxobp0AzmWHsfPl0Cc4RpYawheiEC8ByzmmZzYDTX78ScY5fNmd9?=
 =?us-ascii?Q?+Cup6l4gmy2Oe/ksgnL25ROT0LcdM7VP1/5omK+pMDM8sfAmuQ/B2ClLio1M?=
 =?us-ascii?Q?UXWs9LX0WjSLiX6Gq0A7wzPxq4IwVNi2PjvsR7a31K9DMOzBJmESArH9HLD3?=
 =?us-ascii?Q?4dU8jJEhXlRGNF9ekH72qtGYHyhCdrQhJY/ol+VLCgmjn3fFnwFy+b7UYCm3?=
 =?us-ascii?Q?A0vKPdqVAflj3kBZvU+4CAqhA3bnx1cKYk57bKRrtEc5DGuagjmzCQb3DmG2?=
 =?us-ascii?Q?ZJh95LEBi3YOrVYn0Xx8HoZSBmFPIyZAEaLtW/yafuhuPMKkSLcVs7hcQIwh?=
 =?us-ascii?Q?FtJ4b5DHy+OLJRLzPtIjbZ5/OISIdJ/2FxGGfJHfxES9RdbBJ3c5OG+1DW7+?=
 =?us-ascii?Q?eF5uR0YRfduI/kPuSx0wTAp1d5SFukatjKmhXPY2PtphoQp/pRRPUBi+PhHn?=
 =?us-ascii?Q?fxA/gzdtiqY5kIWK2lBKLWo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UY9pB6S8tQa/K+T4qMP4bv9+ZSHvS12xTubEb3SYCFSBuWRISkNjf17+Ck2b?=
 =?us-ascii?Q?wyHtP3Q5HCAkCfp9QgZHCAxcHw0cqe8cITdZ/ZX7xJKu0mY9Y9BtEXQIKWMO?=
 =?us-ascii?Q?SKJ1GIMS2dlsdCx40115qE5oBF2JMZEIc8Apa9nVHVW0MmmA2bn0+5EWhZLk?=
 =?us-ascii?Q?0fnA7Xwhfso5mueJ19MKfEpewDYnrJpqYdwrboOuDuSSQkv6aPQKm++1jScp?=
 =?us-ascii?Q?v7nhqgFSdXGhGFpHK3ZU7GrU/Dw/a1z1YbBPTJaTk65UxX8qtQ+s+rksWXAi?=
 =?us-ascii?Q?cAge3ai/y7gytK6+81VvBVsQkpy4XmiH/uURzxbEuLxp7Vpq97CuhTpqoQ9d?=
 =?us-ascii?Q?Sru3soKsMQTXVUoL1Fgzvh4UHLcVw5ZPx54fyzaGSlVAidYgotNjXaUnn+rp?=
 =?us-ascii?Q?xD6yJJaNl2PX18+CCDtsOqg116z//w6LKQqDrsHEneq7Cb0Kfnfj0h65kK2h?=
 =?us-ascii?Q?/hDs3ejeEBb/nA72vyvmEjViUC0tQ5JLxCRwb/x29pkPof7alepAHcXn7l2g?=
 =?us-ascii?Q?fQ2P9w0jIwFVWIK0OcbkVlBUScY1SZWwG37uPjJDy512QzeD2sAE0EFP4kaq?=
 =?us-ascii?Q?pgtXR+2YNb1ODze9uu+60zvoaa1Ebh6I1I2TMtO0iozCNzqZ/hfzX1zgDX5H?=
 =?us-ascii?Q?O8wwZxycFgzdALkBgCwE6Tng2tdbX5vhzNiZpDjkadorboqTIbfI9Ry11jx4?=
 =?us-ascii?Q?oSeYiro1jd59z93yZafEaSSPwiRuX9jltXwsxUQ12wSUawI2XWeFSwbV2UZv?=
 =?us-ascii?Q?sL673Fg91GCixDPUxNe93LXgABN3GcvQLVJKYRD2Ghew/vowp+m9k1bXxhwk?=
 =?us-ascii?Q?UTM8MYa8vfw0/sCr6eXv16AhZGxfmC2ILwV6hHZpc/sFNMHosNe9E0BZyLj8?=
 =?us-ascii?Q?xyLMhwuDKtWXC4gNg3UFZe8taS+fxNak3GVDSRMdSqbt9ytupU/BH1A3K9nz?=
 =?us-ascii?Q?N8ur3wn9y5Z/ObqI3uywib6u3YZXmKBhqLKnewKtLseus2cbBCPXEzzZRuIB?=
 =?us-ascii?Q?ZT4DW9CSBOu2fs1xNoz5RKidg8iVMPH1ZMtuTf0SumjXeFetT2ejrbMjocDh?=
 =?us-ascii?Q?tohjjD2Pt7lBjFY8j37wj0A0/pZPMbmhaioBTeqyelEKj7ZEoeIc2zMguV+t?=
 =?us-ascii?Q?gRYSQrQ06+YTwuA+Thd2z9O5HvG0Uih71Gx5bgM/SbHSSQqOCw3zWaM72jEB?=
 =?us-ascii?Q?53IVrmY9ZB/9XHRyotTVxhskD7yPljd1Kp3wa2DQisukiJe0BagaFSQKVvsV?=
 =?us-ascii?Q?O+3xdFtCWGt/smMfRhDmBkloWw8XHWv3JC0Z3VnCHGDaWJDEi5vUT/WDrW8z?=
 =?us-ascii?Q?XM7XXedMFTI4VwuVQOMm52BNkmQTqe8is3zYNCGtMttXrgbiV49nTAoFhK3y?=
 =?us-ascii?Q?AoWfFDpbfwLTltmY5Ylf43C7jt+juubh92woAKakWBidnF6mYeVZMM3301eu?=
 =?us-ascii?Q?putTXidXNtIrQ7NCsrJjC04FOjEBVtERkoyoIXkqZdVb3TG9Te3Z0qVVIPMZ?=
 =?us-ascii?Q?UNsFR53oK46pCItm4vVVOE/ed8KPVAeYg5/gV0jXKxRHahmL+pWNVwmqYZ6q?=
 =?us-ascii?Q?4QandJqT2T2KaAguHQCKT4+oxR9tmJeswKTvLjvzUVswPeC/0FCYVOSpsHXm?=
 =?us-ascii?Q?f5bfwbun7rQWiHkOHxWDhUI0/8XAYeTsTfbJyqYdAxtGNDnquRzqrq2Ly8Ap?=
 =?us-ascii?Q?lDPrL8Jz59oRMxzIVHr24vk8c4338M5RxjtqFkN5yuoITZhI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa4c44e-aa2e-4477-4c5d-08de62196867
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 05:10:39.7668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AQqw+3A0tHaqHe2jaf91NESDt2mfqlKDqnu0O29xkxLSscMaxVbOTc06GQ//saTLvhFjcEQQ1mkcDuM7q1T3QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF64C459891
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

Hi Bilal,

> -----Original Message-----
> From: Bilal, Mohammed <mohammed.bilal@intel.com>
> Sent: 27 January 2026 14:21
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: RE: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor writeback=
-fb-id
> subtest
>=20
> Hi Sowmiya ,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Sowmiya S
> > Sent: 27 January 2026 10:03
> > To: igt-dev@lists.freedesktop.org
> > Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> > Subject: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor
> > writeback-fb-id subtest
> >
> > Remove individual tests for each format for the test writeback-fb-id
> > and introduce dynamic subtest generation based on the formats supported=
.
> > Framebuffer creation was now part of the subtest level based on format.
> >
> > v4: squashed the FB creation function with this commit (Suraj)
> > v5: -Update dynamic subtest documentation (Suraj)
> >     -Rename input_fb to in_fb
> >     -Set plane to in_fb and remove unused input_fb as an arg to
> >      writeback-fb-id function.
> > v6: -Remove in_fb inside subtest and reuse input_fb from
> >      fixture (Suraj)
> > v7: -Join nested if conditions (Suraj)
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 56
> > ++++++++++++++++++-------------------------
> >  1 file changed, 23 insertions(+), 33 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 63917bf4f..58118b8da 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -51,9 +51,6 @@
> >   * SUBTEST: writeback-check-output
> >   * Description: Check writeback output with CRC validation
> >   *
> > - * SUBTEST: writeback-fb-id-XRGB2101010
> > - * Description: Validate WRITEBACK_FB_ID with valid and invalid
> > options
> > - *
> >   * SUBTEST: writeback-fb-id
> >   * Description: Validate WRITEBACK_FB_ID with valid and invalid option=
s
> >   *
> > @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options,
> > help_str, opt_handler, NULL)
> >  	}
> >
> >  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> > options");
> > -	igt_subtest("writeback-fb-id") {
> > -		igt_fb_t output_fb;
> > -
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors &
> > XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB8888,
> > -				      DRM_FORMAT_MOD_LINEAR,
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > -
> > -		writeback_fb_id(output, &input_fb, &output_fb);
> > -
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > -	}
> > +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> > +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> > +			uint32_t test_format =3D fourcc[i];
> > +			int bpc =3D igt_drm_format_get_bpc(test_format);
> >
> > -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid and
> > invalid options");
> > -	igt_subtest("writeback-fb-id-XRGB2101010") {
> > -		igt_fb_t output_fb;
> > -
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> > "DRM_FORMAT_XRGB2101010 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB2101010,
> > -				      DRM_FORMAT_MOD_LINEAR,
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > -
> > -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> > -
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > +			if (is_intel_device(display.drm_fd) &&
> > +			    (!strstr(igt_format_str(test_format), "BGR")))
> > +				continue;
> > +			igt_dynamic_f("writeback-fb-id-%s",
> > igt_format_str(test_format)) {
> > +				igt_fb_t output_fb;
> > +
> > +				fb_id =3D igt_create_fb(display.drm_fd,
> > mode.hdisplay, mode.vdisplay,
> > +
> > get_default_fb_format(&display, bpc),
> > +						      igt_fb_mod_to_tiling(0),
> > +						      &output_fb);
> > +
>=20
> Framebuffer created before skip checks. If test skips,
> igt_remove_fb() won't be called and framebuffer leaks. Suggest checking s=
kip
> conditions first.

Thanks for the findings! I will update it.
>=20
> > +				igt_skip_on(data.dump_check ||
> > data.list_modes);
> > +				igt_skip_on_f(!(data.supported_colors & (1 <<
> > i)),
> > +					      "DRM_FORMAT_%s is not
> > supported\n",
> > +					      igt_format_str(test_format));
> > +				writeback_fb_id(output, &input_fb,
> > &output_fb);
> > +				igt_remove_fb(display.drm_fd, &output_fb);
> > +			}
> > +		}
> >  	}
> >
> >  	igt_describe("Check writeback output with CRC validation");
> > --
> > 2.43.0
>=20
> Regards ,
> Mohammed Bilal.

