Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247C1606A31D
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VQeRA20n
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52CE10E1F4;
	Thu, 22 Oct 2026 07:55:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F293010E1F4
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 07:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792655699; x=1824191699;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WDvyoKji/NVcFwFmcwAuMBhbQSraELicZF7oJr8fHAU=;
 b=VQeRA20nlsvbn/GkA4/C/rEWcr0Zop31zQQ+GwXWLUla/0CmPZ9feS1h
 1W+IZ/jbjYVzLw3Acft1QQp6t3UdXF6Wn1s8FKrphBZm6UZ5GHY7FLiaj
 DEyqS+xclOHSja+uss5zkAK5H8y+rHBQw2DfqZ0GW5Ii4M6T4SFbxcdXI
 0jP6QwQMJzoF7JWcwxs43kDBEzvFCJVAgSGyYKpVOhNwRCVowIAPx0Tid
 ZnypGRN87M0T9MHXwtCpCccjY8kuW6VogDr/4O+v6O/59fW7u1yaoWUAd
 6V/qjOm56DFmavlYofCzA9Lf+tHYGu3LFuOKXRB4pGnwFvxLKgem45aOJ Q==;
X-CSE-ConnectionGUID: ivmuN1vhRMWrOYdPjR5CXg==
X-CSE-MsgGUID: CakCCCDlSpy0oP0WwOtP0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1277349"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1277349"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 00:54:59 -0700
X-CSE-ConnectionGUID: jXX6Ahs9RqWL6KPIqGVULQ==
X-CSE-MsgGUID: XWBF5JJ1ToKSctezEHjcIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3223739"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 00:54:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 00:54:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 00:54:58 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 00:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+iamPG8zX7zlhPlRTaXM5CMZE8YAEWJaqGAllrlMt31OVkepw6e39zEKzvsgpiHjuq9CHYwEhO5i7seQz9mXG3py1S17JEr1P7KKhjg7PJpd01hUohpSOz36oGTIAH8dp20eyCEQzNoDQ9AT/9afeSuTUACmyGs/KOvEJB09DnWjKX0Ain2nE6qSZiE+QBHUsDp0U4vpGjZ33+NbulsiaSOGFS3Q5rcOAeq7OG/TSHUGy+TANk84UhBo+DieGqFatx+BfplySMwcr8UMZvBoCQZ1qjclDvzvFyJd1rvT4yI4p/mjN+IjTYMjR1YmvQS0+U47tQ0zPpHEI6C5VszNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ly98UbU0cPwdh7NWsb/+nv/xkXMXviVAaRQF7/Mbxs=;
 b=pt296JAXArh+CdjEOTyzBYISfQIgmdl6FpPRc6zGqFA5JzMHQ0p3ib1eK+9x6NZi0KBmSPtyvVLVDfh0hisqEMS3UyH/zlWjbctnKqiGLD2QHwmu6Z+H/J5PswXPR1ngbMl5Kt8LDUv+2CX0QAW67iDMNRRMtt9wchLyUemCgLiZE388F3hzxzDhNo7qsadvP3vWJtIyrWT+mY+zXlgcHgfctxqfSUQj5pgWGcwLdBKI0mOLTRLvvFxFsMFwV70p5s7MCodOUVsxvpNv3l5vEgl2uWihlyPlpRULChxMZ+gG/Q7j6zPgLi6XPOse+uSZnMQFq0dZ9DcOj445RPvm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA1PR11MB7039.namprd11.prod.outlook.com (2603:10b6:806:2b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 07:54:51 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 07:54:51 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "Balasubramanyam, Smitha"
 <smitha.balasubramanyam@intel.com>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v2 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
Thread-Topic: [PATCH v2 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
Thread-Index: AQHdYehsAw8mHGDZLUW/N0GgadWmvbcJMT1Q
Date: Thu, 22 Oct 2026 07:54:51 +0000
Message-ID: <CH3PR11MB84340DBDD8D4E49E66E600158D652@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
 <20261022054420.180035-2-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261022054420.180035-2-shivtej.eknath.patil@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA1PR11MB7039:EE_
x-ms-office365-filtering-correlation-id: f8df977f-e972-49da-f7a7-08df3011c0d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|38070700021|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|261021121427099003;
x-microsoft-antispam-message-info: ucAUb7hg3tOolcQBn0gbjNjaeZnqQ/3BFiQnWwuBSNDCE/H7aL87KZQPuyuoEdghZ2YOn0OE/WMbBn5orJtqk7bxPd/NFVa3HOIb3nW+/hgyL5GYCB8HhthfMc4fmQs33it9E6iBLuZ094hrverGcXxLGyxviKBoTBG/NGqJFDKjXxzz8dsBGRAfgW4kwWd7Xu1lo0zqeIAbKRrMGv95DWZT8fVLowsPbKVZlDzDBxsgc/X6cQvNOSx4TqVv8h7gSsEatODWmOEJUv4mG5YRzatDn+nTxu2lCLUl1ELMsZSjsUdZmKQ7qJA1OpiVZBPLG4J3sksgc0sMNTi4j+me1/OdLOZ3IPid4PRr7smr+TLqcvMYERO/M21DFV+ftSUX8v7BnxeOIIVDvAHnhGuvd9TSdR7tCpmWbBJHe4TfiXEcbpK8lREy3tKqCs7HnFAnvQOAw+GxlquYlV0T1Bgkw1J0zR2UEkJgxhC96XnwLj9bhQcrsyznU1d0ZielxWFPzmW6ZcAnk7vFj2EypwhwLNLC18ekn2+FWSyivW7YxNubya3vbrP0t2WV8LVTAlGE3l5ht2oz/ZEOKsWsPYgRALmi3o0icJGlpx7Tf+ytLFU3VQMiDE+iBkrWSCzY/ikanpKQnto2/tKclDOUQt9iHaeLgsWuSaB+0ONeIMTQisGoFDWx73obFamhqjUb4pFXqzHud7Bz6cC7Gp1HVaLTlCioTHZZcpgXr06my2UAO+A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(38070700021)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mXJIN2xHow7zxvXI/cqP1UHXDOKzVZaep/gVXh/aTFkPSnSPSwDVjscKnDb/?=
 =?us-ascii?Q?q2WayYWItKYYmCeo3Td8FE5aeKA+W8jG4cmMOabkuswfledBXTs+P8xpl8FB?=
 =?us-ascii?Q?q4s8d95alU8uvP+2B4Vmx5fvabMGPVVZIAj9Ig02svEP/FNC+ko8E8CyYZt4?=
 =?us-ascii?Q?xblBzm86+tfkK4JeYONotw+2AwSvYxB7Tn2IFX97TtvSiUkbBwEcSM3bxZSv?=
 =?us-ascii?Q?g78fJWeIAYojIgL1rBJRyMn2IPag6LdCoYNIwxKS55kA8oJHoRTfrVAaEX3i?=
 =?us-ascii?Q?BhgtJAwgkwEV8melpyKTpowoxYv3eFAyFjF7Qbip7yQjeWmJTeWIFzjO6I5n?=
 =?us-ascii?Q?QRw/i6E4ONRVCYiiXhzUk36XmxeuCeR0NcWqhzzOWl6hiTh1KOJ6xt5oKCNG?=
 =?us-ascii?Q?JmuzTF8vRNos7DnMVT7Y7G4SUXnxwYnnAyqg06tn6A/cW1opNfEzWkUhqfrf?=
 =?us-ascii?Q?23TrkELEw2ZpKTE1c8t6zY1Yb4TiKTNgQiMis4gWnbE7g4ini2b8rRhjJzfu?=
 =?us-ascii?Q?KQ1FEJUI0I2begEq16yMvuCtAMMO4ZPbG1rK8NKLiLD900v1G9AFRpBtNtct?=
 =?us-ascii?Q?vpFC9x5KOJJ1N/yr9wpks8tMZV3KgdHmDy1TqnGZZIEVuE5K+RGFeYGFGiF4?=
 =?us-ascii?Q?QKot+0KEi7kHtu8jxZxXI1isoOFg4J7alfITW1wJ7q/MTWCtC0TSQ7c3Wq5L?=
 =?us-ascii?Q?bYZXhB7ylxnhbaKnOOMmcQbz7IVjHorX4XLX7oMtNvY1xu98vU9Sqh+IHNJd?=
 =?us-ascii?Q?hSHcxppbkFgBrMoukLzFJGnstbkAL2N9ksmxRm95rNdzDe7hF1uwInOdCruY?=
 =?us-ascii?Q?bvHnFKwkOhgLxFV6bXv3vbId1BZGucVkP4jDheDi6MnLG0aviZE4Tme2Zkmv?=
 =?us-ascii?Q?aqg864Bh2+2dH/BViBzyDXxZyF+I//5TLdpk/Y2JQgDoOHl8blWn6CBBGkSD?=
 =?us-ascii?Q?+CbnwfMHIpMAut8FPH6n0qizmsHN6zfhdmmi5yza3b2nEHXQaRJJF6+q452S?=
 =?us-ascii?Q?rUEpvVkxmCILY5wCoYppP/gQJl4HDeR7jjpOJvHoIvjSPrESFdFOJFfHS4qL?=
 =?us-ascii?Q?sSgWCVHeYL2hW3mg4cKVIHJF7QcKPNNOzbZ7b0+Cg0+5x9jxuliflHM+SDu4?=
 =?us-ascii?Q?9xAXVhQhDCE+Yu396Fyb7Yp/UNBXnCk1obD/XN6WgjEPrTFoTMloz71x1z1o?=
 =?us-ascii?Q?FTyHt550mn21KkzrE9argzlox44ztvg3ytJ8aF1VrHpS9yT4CCtCOa5LB9sR?=
 =?us-ascii?Q?6RdagHtXPNJmcybfU65JGYbZe2I7nJG6ISHIjgTKk2ekoi4KkTFZjsBBS/ab?=
 =?us-ascii?Q?+MtjQGCqYPQyca3kgVnz3AQ4KarQNDSdPHEaAuqm+FAAA+ZBTjBw2oQrySjK?=
 =?us-ascii?Q?RMT7gcVjM+Ydl57KQFSPt1DWkjL+UxbZkMbmf/0fbJ2WRbiUAu3XTMi2jude?=
 =?us-ascii?Q?1OWmPUZptCedcthIUcHQb7KYHlK2KhK4Bl06X7RrTDpWa0YVeWgw0flefz6p?=
 =?us-ascii?Q?llMS2dxhvFztXii+ZHU56q8I4ynAfiyJ8IXAEfJDrQAuD87wmwnQduTN18AP?=
 =?us-ascii?Q?+hZnWHJq/UMr3MHX3UuyP/R7PgnegmKAxASi8qapG0G7BYVumUnGnLJFI06m?=
 =?us-ascii?Q?mL4l8ljMFjF/i7PL/CVbieEsNSItp+wpHAc1vVF8fuMh43nfz9lk+Dx1vwE9?=
 =?us-ascii?Q?pxpITE41JSyAoYMQ1cxHx690FxYV6aDSlxsoL8mDywwPoIO/3jt1XU8oGwKM?=
 =?us-ascii?Q?kj2NVtoHhQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O1tEa0RtYr2hCROjxRcg1CTe79YO0GYtObYnJv/9bLLihcBtz5YxTUtvdrpFTLf7bi55EHjXPL4dorYQ6h99rUB70ipzNGtHdSumFN7gZgJHWrSmsXKJbrSW9h4wO2WCLREVKKiH4Xrz/mhI0aMhatlYGdl8jE+pHFoOuZHPclLcqbPQpt2tS/lPQrvqcZxWCgFYEISStM/3cfoOSB52vytLVj8Ws6QKl1cpEuBkpGk7gygI/bfqdnhQFWeghjGbQh5vOV93D9BJJCgzKHmavoljM0+tB3s1lqwAL2wDhtoZ19NAOG4M8+0pwlfgCSXLp8gba5OJjrp1tNVdalrtGg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8df977f-e972-49da-f7a7-08df3011c0d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 07:54:51.7606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UHzdT0/TdpVdYs8wOUYA29i0s4JsyNZWM9qEj4d+p2yng4Oezce45ufdqj/cukb8fqm1dH/EpDTg0DGJeFIgh4H8fnZNSMSwtLFh3RcNVw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7039
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Patil, Shivtej Eknath <shivtej.eknath.patil@intel.com>
> Sent: 22 October 2026 11:14
> To: igt-dev@lists.freedesktop.org; Konieczny, Kamil
> <kamil.konieczny@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>;
> Balasubramanyam, Smitha <smitha.balasubramanyam@intel.com>; Dandamudi,
> Priyanka <priyanka.dandamudi@intel.com>
> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Patil, Shi=
vtej
> Eknath <shivtej.eknath.patil@intel.com>
> Subject: [PATCH v2 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
>=20
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
>=20
> Add a new test to exercise the following functions in
> xe_pxp_debugfs.c:
>=20
> - pxp_status_to_str()
> - pxp_info()
>=20
> The subtest verifies that the pxp/info debugfs entry can be read successf=
ully and
> improves code coverage.
>=20
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel/xe_pxp.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c index
> 5460bf6db..76a3939c0 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -506,6 +506,28 @@ static void trigger_pxp_debugfs_forced_teardown(int
> xe_fd)
>  	sleep(1);
>  }
>=20
> +/**
> + * SUBTEST: pxp-debugfs-info
> + * Description: Verify reading of the PXP debugfs info entry.
> + */
> +
> +static void read_pxp_debugfs_info(int xe_fd) {
> +	char str[256];
> +	int ret;
> +	int fd;
> +
> +	fd =3D igt_debugfs_dir(xe_fd);
> +	igt_assert(fd >=3D 0);
> +
> +	ret =3D igt_debugfs_simple_read(fd, "pxp/info", str, sizeof(str));
> +	igt_assert_f(ret > 0, "Can't read pxp info debugfs\n");
> +
> +	igt_info("pxp info:\n%s\n", str);
> +
> +	close(fd);
> +}
> +
>  enum termination_type {
>  	PXP_TERMINATION_IRQ,
>  	PXP_TERMINATION_RPM,
> @@ -762,6 +784,7 @@ static void test_pxp_stale_queue_execution(int fd, en=
um
> termination_type type)
>   * Description: verify that submssions with stale objects/queues are not=
 blocked
>   *              if the user does not opt-in to the PXP checks.
>   */
> +
>  static void test_pxp_optout(int fd)
>  {
>  	__test_pxp_stale_bo_exec(fd, PXP_TERMINATION_IRQ, false); @@ -
> 1157,6 +1180,11 @@ int igt_main()
>  			require_pxp(pxp_supported);
>  			test_pxp_optout(xe_fd);
>  		}
> +
> +		igt_subtest("pxp-debugfs-info") {
> +			require_pxp(pxp_supported);
> +			read_pxp_debugfs_info(xe_fd);
> +		}
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  	}
>=20
>  	igt_subtest_group() {
> --
> 2.43.0

