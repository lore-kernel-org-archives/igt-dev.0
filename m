Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAA6CD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 05:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E727F10ED2E;
	Mon,  8 Jun 2026 05:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyRVcAWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0BA10ED2D
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 05:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780897847; x=1812433847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mTVJXiON2hsL7oSTd30UtkVBj5xchKfsDzG4cmFTx2g=;
 b=DyRVcAWHHACOxF5XPuDIXeZ7qeY+UwNFRRPKRRgnJsr14IBAg+VkPxhD
 0NOQnlSqJeor1kajlVVJNCk9WZdZKaz4ildggs0BlieEWxqBwD2LQN+Oy
 Y/RkEvpjyWabqQDzrHwmx2oyHWCSEuYPT0rZFonJxau/asLb6p4ILW4ct
 HxXj3U4vyMD2IZTCWUg70WDEUkEC8F6MY+QkYENAda2PfkuF+fQ9xRXAv
 sywkX1V3hIhsBEQyoQlxmSu6b2LeGlkDv9XM/n77LHv+7x5SR2fzMguNe
 IOJQ6xohURGVSj6JVL9AgT1BCHG92MZSyx8i2oe4CVpLnnGcnTOaIpS5d A==;
X-CSE-ConnectionGUID: kfuvo4VfTSStpAl7ctYdjw==
X-CSE-MsgGUID: FQTla0wNTuWVUTLlgHVO9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104285032"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="104285032"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:50:46 -0700
X-CSE-ConnectionGUID: yKkvrbw4Sy64toOrK0CdXA==
X-CSE-MsgGUID: /maMBm2MQLOLwIJK92xKYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="249756795"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:50:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:50:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 7 Jun 2026 22:50:45 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:50:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBuEujUCVRrmSzVP7jM3fagnuOpWlJQK/C3c8gySpa3KKaywFp3643x/G0qBqjX2bUXWxIxlvsAhaKzMX87TsgiTbzVPtptwOF6cZtIzlHKl2tA4qaWjVMXC/ZMj+sJb+kXWZOOqaCpkfJaoWrwFeAsFy8nTTn5nI19txGzmTiC0UoMPQVXkGcceO58+kzZbu58TP0uClBMU1JxA7W8iyAIIfxmxEAVhv3lNYXcJrZ2QrRsl6287VfXmrCetzwlVxvkEsBsETEVOUdQfD3fHEEl7RzbPEx0YoHT95s5v4Ef1r8LjCB3pMAUsUhTSbvBGwhk/UNNwDi1k/PcgVWTr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxQZkTkQSaWlrWLhEvcz69kmbnZp2zu1NRKgrhi1z1M=;
 b=fsNjnzbnWdb31eArjqlbyrkIXw5O9gvvS5DADxqJTfaeEtaQgKP/lWbsEn0fTozwLLkRGMzHeHatlWeb/iTIBWxpUPXIPzMYgT+6zyBjBoJ+1mVzj95ZuiU8D9C/Z4gBnHStPpT8UuTxIzFNoEhcnM0HNgUWSRUK+akWe0XeUFFJnXfHCIhzw7SOagPh+yENF23BvrbiHQw43qlWJyzO2c9u2Le7j6xYro3byyUAvgRyv0o0wZeAwhQqrZ6RUz+G3LUuQqMcTbrI6fl2cxrLkyX+WH+BAqNzwoTBfQBcscqKYuIxC1en0n6K9Rl+MPucpIyJ4PxAfejJriWkSRxjeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CY8PR11MB7060.namprd11.prod.outlook.com (2603:10b6:930:50::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 05:50:43 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 05:50:42 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Gupta, Saurabhg"
 <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_vm: Add fault reserved MBZ assert
Thread-Topic: [PATCH i-g-t] tests/intel/xe_vm: Add fault reserved MBZ assert
Thread-Index: AQHc82Z2+U/ZVg63okSe5SPxyfB9M7Y0LokQ
Date: Mon, 8 Jun 2026 05:50:42 +0000
Message-ID: <CH3PR11MB8434C99C95B62A6F6A8C6FCC8D1C2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260603143628.3739477-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260603143628.3739477-1-jonathan.cavitt@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CY8PR11MB7060:EE_
x-ms-office365-filtering-correlation-id: 5eb53e8a-773d-4700-d6cb-08dec521e096
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|22082099003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info: xY8w8xmqSIgFTetxrJInt0FDqO+UZ1Gyjo0GDhgomh6tmLvlxPC/qtj50r+hiftOaEJ5VkfAF6TPoxno+2Zm/hM2pXx7j+KE8/MoNRWJKc793FSAqIDFDvbCa0/rkPV/WwB0PRHVVVxYE6+hvjjqNP8IgWGy5VmLIac720YXZaIBtQA1P+6k2w3zYtQf18ESgcV2iYf/oMexSqIjGtxB+nficjICM0/Sm3MaUmT2TA2cTuCStKJDM2WHbSJljBIXvDNHLPpeo+MlVIiVeK8xKoF3nhSEvxLHUwaoUAIdDicGCoAr2zvnBP+aDmk/pTr3AhLC3HYVDtgvZaW1fx8VUTEGg5RTh9rGGupTei20XQnd78GMBTIlk8BbE+242FPWvHqexbEsSTxWc93crrwYbTTYMcHY9IdaGjJMghwxtIF4Psj+xbQB/oeyacck5aSHeEcMbmV7Kk5oVGh+agU2PEV6zzMwo35OHt3yisGGMW/bxbMIHnC5aMm/T5zuXeH0+1Ystt9fYCaEk6oPSeYuuOD2GsvHxwcDAM6G+t1vchyBCePnt/ZZpFfB6SNsIQmqZHGMzHg5dxV3vdL/2QMHlV4R4rjYN3JW7zhBsg5PZ5PWSnWhs0uvdAOMiFqm1NZKVMNUx+/62HwHIUi2ZToaW7bT4149FrAfHJOrEiFtnohkdgGMl/ZbEyX0AhhIAQtTLNWgbbbNeQhQDnHj0aJBNxbu3byp0jCb+nb1pW64ih3owg9AmNT5iRRsXUdNVttY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SvwxdyrJUp1hrvE5rHcP/hDXlR+LKnFbT7B4OwCrET6OE4o1wfJTr9E/Kltx?=
 =?us-ascii?Q?n7//GaDp7yEnItC2Uf1S5EkMAe8OYpTwF553xJ8sFMJe9oLxUxWnRYqI5ai9?=
 =?us-ascii?Q?/KmDyWuNsJuNqOAZ3bd4DgkLQ/kiBnls3OzbxJMYdA+hiRRzlR/1yGZCNkFS?=
 =?us-ascii?Q?1FfwZt2Y7jSPKcWVSMMSzUFmqsiC3TW0ycWTd0lIxOqW1Ek2+GxIYIT0p9vu?=
 =?us-ascii?Q?QDA4K008y3tGy1WFYAiKEJn+0jEly/k25rYeaLgUH9K3zKFoCDTlA1Jq2/yl?=
 =?us-ascii?Q?v7nEyRGCTdJY6YWrzOf+bP33f4/FaKtrOafuUzZ2IrZO7vaKpz5L7H29Fdqz?=
 =?us-ascii?Q?OiHSWGTShe8ojUHkn1IU3oNmGBTPmQ9APL6fFqaFjCStdNXisAYTysE0s6x8?=
 =?us-ascii?Q?k9s4detDAbKzDJsAOraWZbBtF+v7TAV+HLDA7pFkeUxv8tFFuMjyxs4WsBPI?=
 =?us-ascii?Q?ejrxgM+7uAS3Wr+01jBbwVI6GdvFdbrBrzfG5ARPVQxb64IHVcG6FsQjrItW?=
 =?us-ascii?Q?RWVmACc06XHs8xskOmaBHRUqoMkamhp+poQIKI57icT4FVflp3tYI2W8h2JA?=
 =?us-ascii?Q?X8xSSdU2576K5cOBSSu8XrlJbdn+dyGTJ51NUTHBOMBrNAqLu32jxPS7TAhn?=
 =?us-ascii?Q?LFKF1tdrjiCpKd3BRNpkj8grGlXYU4nVWjlbpuAv/3rU0fFh5s414qws1uD2?=
 =?us-ascii?Q?R02q1L8BSKidA0KboNZRbk3nbPjbPJDLwAlHUbYAN7pqUfzCj3c2rtGs4sMb?=
 =?us-ascii?Q?j9GjLkFdTdIU1r3E2RrcUIPmg7jY0n6dLmnHxwCjf6drlKusQG99MV73tu9e?=
 =?us-ascii?Q?JxSnICAe4j7xlmNgs0AE1HrSuedAewcJ3VuDTbes46ztYe4hOgfzE4cGKWJX?=
 =?us-ascii?Q?7HLCKUCXF/xe9wZkYKw8JGfvEb03Vi2AuWOrF31PE/G15UpFtRiAHTZ/r4TC?=
 =?us-ascii?Q?AR4eZweMspjjGxii53M/1iyKt6LqnpSpE/nmZLnAOW2r6wPy8nJ6hkFoiKCr?=
 =?us-ascii?Q?F87pcfw9mdM1CKrZpty0nw2FP40ZdaDM80rrF5sQL2Sm6wQu6W2ELP/7TQy5?=
 =?us-ascii?Q?QaatzffstA5GEsk2fmNRnfNAXEKihLTXiDtxBgH0PsJZKjklN4YJ3nHLmTbx?=
 =?us-ascii?Q?JScmS6LlBdhPIJPr2XsJXGXVie4iCDN0g3RcW+TpGZswh2liYgd09MdyFXdi?=
 =?us-ascii?Q?JG2wexE6aV9EEBY9mXXvnqYEYhB4Mm74MNgAEvAc8T0v51Rtj6LFTC7rhP1K?=
 =?us-ascii?Q?7diyBda7METmBpGdUPPlbiK0EXXTUgQbcxjO2zZFqiGuQ4w0fO85+tci4Ybu?=
 =?us-ascii?Q?LN4tqQO1/hvg0YtcDQw48o0SKcsXoCZbD13hazUvwiAvux/5+ImDx6T+6zYw?=
 =?us-ascii?Q?d4fY+mS5l1Y4Scen6DX9eDawAROB4pa/SfeAimMAaZK5NChYI2wqlIAooETH?=
 =?us-ascii?Q?YBM5Ws3fNZOD+rfoh4Pqbhh0Ia1cfWhz6TxGvF+5XSHV9EUyAfL+QL6QPWFe?=
 =?us-ascii?Q?VS7E5JvJ1NQbQBrmcanRjCI8TgGz9UEb3/7nqBUdyrz4OzN0jjDYA0vlpAif?=
 =?us-ascii?Q?KH9v6q13u8zfw1w0ICVcmE5/9DH20025jzpLj7VmIeDqhE5cD3LdddGIaske?=
 =?us-ascii?Q?Zdu8DLg5ACcMAmtArrh4Fzmh181uqcVj+Sy6Uy4QSj1D8flXVc6JSYSzyEmb?=
 =?us-ascii?Q?O0phmQA0o6u1rb/T/C/LkwuhbxmycdbVh28sD4EizsaW1RFEO27LBgZfiIYq?=
 =?us-ascii?Q?xzp65avAtL/iMpqWs0u5ibSKXL+O8Do=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VyjjCsMT3iJrvAmuc2cWhQZyEiVX96jxg46hETvFdT1SW5KWxr1KDbNeTvDvCSIZDWNhWBeSTdNEwXctbs44ZLeMpJdROh4l14ZaAZv+8nF/rqVMZQdcuAGvUk8rOELQdds8OB9qr4bZSpyXNJuXlZh6e1zEd3J8tGV6hLhX2JDQCL3P5MSDbEZwKDXFh7BNsrbHUiLB0lNRMzn6X07mYrgr5vzO+Dr/E0rLPBYzC3JOr+dJ6AvaMBfTMG5WnRzH/RYwv81cysT6OvOffYusdQAFxSq8ygwxbX2AKYgeXm4ftPGmncmtRu370FNvIbeeN6uxfykFuX+eLbMs3Fi1KQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb53e8a-773d-4700-d6cb-08dec521e096
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 05:50:42.5688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nFGI2C4tjxB9I7KAKM54azfXo9SRxPJiFJ0HK+kofVRq5MLwalsmnGTqszm0YxgOK7z7LBq+ENrVyKqTh5a7naa8RxTN5PDvD0mrg3bTBpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7060
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



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Jonathan Cavitt
> Sent: 03 June 2026 08:06 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, Saurabhg
> <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_vm: Add fault reserved MBZ assert
>=20
> In xe_vm_fault, the reserved fields must be zero.  This is not asserted t=
est-
> side, however, so add the missing assertions.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_vm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c index
> 408bfdb718..386a0981aa 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -3060,6 +3060,8 @@ static void get_property_exercise(int fd, uint32_t
> vm)
>  		igt_assert_eq(f.address, f0.address);
>  		igt_assert_eq(f.access_type, f0.access_type);
>  		igt_assert_eq(f.fault_type, f0.fault_type);
> +		igt_assert_eq(f.reserved[0] | f.reserved[1] |
> +			      f.reserved[2] | f.reserved[3], 0);
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  	}
>  	free(faults);
>  }
> --
> 2.53.0

