Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA56BC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 11:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F09D10E029;
	Wed, 12 Jun 2024 11:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ua1kQJnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F7910E029
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718191747; x=1749727747;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BOcMWnxaw0N2VjKCTK0qzpzmmeMBlAssPXMp04XcYgo=;
 b=Ua1kQJnYzfXW9peNvYJKTgyw9rPzo1lnaDFjx1/J8dRjo1y3df/d3fgj
 T6nyVVa9SirtmKk903hY/TuIaesHAw5AmjvpQDyL26tGp7Gq8pc2JwbYy
 RLzSkIOJURmeUx7lY1AZy6yOuGHW4wFVu1bOPpo9dXO3Bf3B7UJBDSIEH
 SLjEFwoUwuYia56kGexw8IXKEBtKCacqtxenDK4+jOYk5LAg/tZXVQ6FI
 2PjH7SItGF44rJeyehf75Z1eq4rfgWAqkCTSQywBnMoMHjk9p22ZomE8F
 n0LlVS8MiShItgeBrgGZYt2CusdsFX9EXUcw7JPe8QJVPY+ao1TqVe1+C Q==;
X-CSE-ConnectionGUID: 8sUWEgnQSymXkOO2k57YJw==
X-CSE-MsgGUID: 1f0ougXWS0yvzbaSQuavJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26066422"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="26066422"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 04:29:06 -0700
X-CSE-ConnectionGUID: SHM+zqrQRHCD50gxUreH0w==
X-CSE-MsgGUID: /X1n1DUTSziDBPiSURW4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="70565889"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 04:29:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 04:29:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 04:29:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 04:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5o3N36IQizg883RmQ92bRDAe3YybNSGgsiP+sk9+NTg3gaJGgFBjsKiZFKvkiCU2xVWpOng+8A3MfLjNcZ0YRG49vUXIHiuxvrcxseJcT1igEgBPMQr2hugZZhfip4aZYkwhguLtTXZyOaiiTPJypVPFgOTwX2yWQciwgFb2Ms0gIry1i8euC79L2sxy5iv82wRGGrRRKEKkv4YdBtvpwdL+tH2WpLzgbmJNC0YUh7PsATnbwrkZoEsXq0ed3lOyNYCFBCRjNmgZ2LzveSNPsVKxbOqPyIm8AyqkogXOQK85CoaF6Yclf2WUHIr48Fo23oSYCOxOUftmMgCGbUNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bEzgbImJYaXjmtcGxGuTjMALd8MGJSEHSl/Vq4Mfhc=;
 b=Bqud7EyEvQdq9bZ2L7RFRhSO0yrU3wfi8QIYIXz2X53XxosK1VkiGOFJSMddSQQvOCPq2ip6AKdvPduBq5bpznM7HJvW4lhiRMwaC8Qd33+eof/PB9XuZG2uLS/Q3e1xvlI6hib6E6DS0ZKqdqv8mnbNpyaoAH4OsAt7H1kYRCaH/r37L4FYCZ+/y64M19pKQqSihj+Mhg6RwkUAtbyVWYAv+WY1nXDSw1Ztuu3lEiqGfnOOjzB6JfqbYzkVcsxwuY/XEq8MuwfCtRGNOFFZCw1pu6LeiozI/zQ5dKz4FXE3T3UnJZA2ZlxDxSdJ/gCuOr6X1w2zT6EHmpTD2Rno4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 11:29:03 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 11:29:03 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 2/8] tests/intel/kms_pipe_b_c_ivb: Test cleanup
Thread-Topic: [PATCH i-g-t 2/8] tests/intel/kms_pipe_b_c_ivb: Test cleanup
Thread-Index: AQHau7x7P4cID4jyiUqBAR8Qr9MwOLHD/8EQ
Date: Wed, 12 Jun 2024 11:29:03 +0000
Message-ID: <DM4PR11MB6312A43716C2E43AEB32A1E890C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
 <20240611045348.3727239-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20240611045348.3727239-3-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB7006:EE_
x-ms-office365-filtering-correlation-id: 50d6c41d-b70a-4053-31b9-08dc8ad2dcf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?mjHquY7BctlczM3/Hlr5qMOCwVJSu8vUq+L1x3sQAnRLTC3blORmT4Ij8lox?=
 =?us-ascii?Q?9ccCkwzrwixrbG5gs8iuJEFmCDwOfKe/2YAUs6d34fULdY4LziFYM0lCZ+Ry?=
 =?us-ascii?Q?JT6CXlNLjrfdRCSaj1z6unj9lfYOVM/ODPrykyHvWSTKnUltHYnMMz4LG3Uz?=
 =?us-ascii?Q?UOXEukpDmZRU5we4n06uAK5ACCaGnoDag0sJhk0dGgdKSvTseFBjZj0Lm3GA?=
 =?us-ascii?Q?b8PqHVi/O4eZvBfudi0iUsBelzZvd7cZ7o5MCnUztXps2nd5BFe+5q4jVjIz?=
 =?us-ascii?Q?QDHOmW+i4eoYbdp7uQQviBp6kTSoI8l1zCETcieqpDuSLIjJMof0sFZoTXve?=
 =?us-ascii?Q?Elh1ofraCmE7VzFvvDdPw0JplO/3maTt7u5e8xVX6RFkfY7av8bstCd26JgD?=
 =?us-ascii?Q?4PPvLrEpFaX0TEb+mWOB7CqhTETi7vmgfN1mu/dwhwBLFVTnl//iLulc2DFq?=
 =?us-ascii?Q?FHSQttmrih/GG10VY4LG3ynvihbGOjy0uFfznQAuN4JP7+sEAFQGRg57E1Mr?=
 =?us-ascii?Q?ZfREct9HxRdbHB+gt79a+BjA/IcbLgd2KgmHr5VlePbJhO7BmOz8BWYkvMKL?=
 =?us-ascii?Q?o39btTKfHEbLrORvZkiAFPXJD+siD4JAJqhUlYc2+LHur0cTEXCocW5P2vAy?=
 =?us-ascii?Q?P484qjAo8vMa/pSgZvT0GAFDptn7j6CRHXy1oXbGB54VPQnZSp1VKG6xatEE?=
 =?us-ascii?Q?Nt/TxBahMLbvZX0DET2tmLrtmQIP0tyzaL4yF+JYF4udhnXslkSY6EM7fmGM?=
 =?us-ascii?Q?aWdA9VOPK6Z7nZhXUZtc8645z2JzHM6PcWxlKN8NzSnw/V/VxVGhagsr8JbZ?=
 =?us-ascii?Q?tn6AVKjiGU8Gh4J8LPiPJKnEis1lJncGgFdfKQ2OIlveRa26f75qfXGIVpED?=
 =?us-ascii?Q?AjqpOgSU4xj1FSaot2PvaXUSpnSShssCwy8XRmcHUq5qzxDkwgj2jr4RiEhq?=
 =?us-ascii?Q?UHdWrqMwZKwbx/OQdAiNxdav7R26bJpIVTMnCWHc9wVe+POrNsjR3sIHZ1hJ?=
 =?us-ascii?Q?Gfv7ZB3EpaQ3wa2dBW3t8wV2deQ+0Xsd4l1bn+ba45bVcArbMoWBARCZ5dqv?=
 =?us-ascii?Q?/9+t6+zE0PxxnPcKJOVTEqoCqEX4BcvNS0RnZ0bnfBfWD5NT9K1T0U/oFE68?=
 =?us-ascii?Q?YVXtoCvSmH2AEKI1EFkLpAtL8fTIzunw2r4MGEagQ2bihXB7sZAAb3vNrIHt?=
 =?us-ascii?Q?fOK54S9sX6DX4naVIesFFNzn/0MM6JPhgHmUH7ByUvNLErraFes22rKcC4JH?=
 =?us-ascii?Q?4xsgWhlFhZe4P/kZQdLejGROtvOpMbfOhZgF7zFucP23eUEM67M4VkJl/v+w?=
 =?us-ascii?Q?zK0dXTje0I4iNm6vtuMRZAfWQwKWzMcvPiSuuQzmnPh7mTl1mG9J8Lkc2HzV?=
 =?us-ascii?Q?B1t3Oog=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T2CZMEnLTKxJhL9NLur4VSI8rBqd/uiCCmE0wrsUhUhlZU36WwUWIscQ5QOE?=
 =?us-ascii?Q?nxLQdV9Yj79x6KeLQr7rNOF7M/Iu+KoFHwcjyayqDgJ5beqWFkLtYQ003LTI?=
 =?us-ascii?Q?1d4I7iuKbIAb956ZOI3ynXnlCGE5F0t+rLW39pgWB8MO/Eztg/zKhoaeSVZw?=
 =?us-ascii?Q?w3PyJ5aiyBxOcI9Hcg9B38lNVQbN3lhe45N3pd1nMC93ixilLOeDjMM1cmGq?=
 =?us-ascii?Q?hDnO1Q5CYcatIGPsuzGnkGlFF381LMmdsqEqMUPWVt+IYf2KO55s3iY/6j4t?=
 =?us-ascii?Q?BBec/b2sVbSEJPkiiimpNfMhlDYOFGm525x79e8uhbCRotmVAo+G/5GjNVwd?=
 =?us-ascii?Q?YKrwMieSrX1ITX4UEKt8BqZ26jaU8KkWNpESbin0Nn4K+zYnRRkNf7WjpZey?=
 =?us-ascii?Q?X02vmarPJanlRIeLZe1hIfW50vFXNn0eVCTLhrnuXuoVUprZF36KlYGD9OF1?=
 =?us-ascii?Q?avMVwzSqhcGi54b6bMUxlIiARKI8q3Yr+oz5vnHTr0MDYsizav9oY2vKy6X8?=
 =?us-ascii?Q?eS4gmYz5vmnO7YR/IWn5qB1eUSjoj84mNMRMiNIm3lwdIdPJfPfEWY0xk4aW?=
 =?us-ascii?Q?TTHwaokV/jCWivZMudciKElt9oM/RpE7afHmHXV46dx8kDqW2TM+5s56LFo0?=
 =?us-ascii?Q?5c7riJUYD4Jtx7iGm2xY56GFr8p1h7UcySHN9Mz3Qa3uGrKnK6FRBIh72ST1?=
 =?us-ascii?Q?6Jp7u0fEaejsjKEwxzrXmkUC5V3iDT+M11syoUvsjxBUNOJNGjWQPM6ZFTl1?=
 =?us-ascii?Q?W3/AA1N7M3rq85wRmujXxTxN8KJNqgpZca3rjg0GqTeHeEn9zwow6bWzBudi?=
 =?us-ascii?Q?EI/E9AlMjaaYNPbbiHf4DqNEcZ1OJPLLLSjZj3oeGuOfI5fqXEqzzs1Wcq41?=
 =?us-ascii?Q?pX2Sn/bp3C30v1bV9/VaOdivfD1cfM0z4k14bRoS01qenHfpLC9vCl8ZWSxE?=
 =?us-ascii?Q?7xfSfaGUBd7JcP61CZSsmsRsSMzst+JPTEFCm3sGX0lbOKuf2q0RokGjU4fj?=
 =?us-ascii?Q?FW1u8qdvipL0i2fD/HC+2+IvIpD9FfIwpipI1of0b7K+y7gpMWPoopOkxEW2?=
 =?us-ascii?Q?oAbUwO+/sbEGtJMJly4OQD+ZrnaFbMKYOijLtG61VT0qbCnPRm0qqjHMkZy5?=
 =?us-ascii?Q?gMXJDXOAdu7tNJ4RZJvGX8UW5MsBFus/dgZ3EZ/fNhH4X7NiLu+Y/dfr0u3H?=
 =?us-ascii?Q?3KdUrS+Hymf083CwO5cBluRkiPM/d9JH1zlWUWb2R98kv3C8JpArGvMJR/E4?=
 =?us-ascii?Q?1dOMZR9nyvETfwsidBkRgJ3WX90BIQ7bzZvjnH3kuESq5cPmrhF1Gw/4yv1/?=
 =?us-ascii?Q?VkhbyY1GioZjR/j3c+FI076y8LqEcKkExksQjJJgHxZCK8Y003VbzPWgioHq?=
 =?us-ascii?Q?tORwuh6F+SwBTdj+hzNb7FQA6xdKyim2ma9ZGOYzO1m5hgQjwP3BpLIZ5f4T?=
 =?us-ascii?Q?CbJlat7aYe70IoGK/tUSrMUkR9uEJRtkh3MyMOiAc+CKBAM7gZq6Pjc/1Bzd?=
 =?us-ascii?Q?9AujkDQupK1XoRf2Z7arc0O99e9wEQeU6h9IkHNSbrLMlpqJ+B7rCq9o1KbP?=
 =?us-ascii?Q?O62JXkuuzfT8NAi10Zg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d6c41d-b70a-4053-31b9-08dc8ad2dcf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:29:03.4746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dx1MM2Z/PDQ/RYnymE8xthlbctaM5urTPFvdNP8cV1KFCD9cCo73KD6uGg7hXkFcVkThhxwBj1LU1B9+x1Fd8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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

LGTM.=20

ACK Rb already present.=20

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 11, 2024 10:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; B, Jeevan <jeevan.b@intel.com=
>;
> Sharma, Swati2 <swati2.sharma@intel.com>; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 2/8] tests/intel/kms_pipe_b_c_ivb: Test cleanup
>=20
> From: Kunal Joshi <kunal1.joshi@intel.com>
>=20
> Make sure the below points in IGT cleanup:
>=20
>  - Sanitize the state before starting the subtest.
>  - Clear the states before exiting the subtest.
>  - Update existing libdrm APIs with IGT kms APIs.
>  - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)
>=20
> v2:
> - Corrected commit subject. (Swati)
> - Removed comments (Swati)
>=20
> v3: (Bhanu)
> - Rebase
>=20
> CC: Jeevan B <jeevan.b@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel/kms_pipe_b_c_ivb.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_iv=
b.c
> index 71699e792..73083408a 100644
> --- a/tests/intel/kms_pipe_b_c_ivb.c
> +++ b/tests/intel/kms_pipe_b_c_ivb.c
> @@ -164,7 +164,7 @@ find_outputs(data_t *data, igt_output_t **output1,
> igt_output_t **output2)
>  		if (pipe =3D=3D PIPE_C && output !=3D *output1 && !*output2)
>  			*output2 =3D output;
>=20
> -		igt_output_set_pipe(output, PIPE_ANY);
> +		igt_output_set_pipe(output, PIPE_NONE);
>  	}
>=20
>  	igt_skip_on_f(!*output1 || !*output2, "Not enough connected
> outputs\n"); @@ -176,6 +176,7 @@ test_dpms(data_t *data)
>  	igt_output_t *output1, *output2;
>  	int ret;
>=20
> +	igt_display_reset(&data->display);
>  	find_outputs(data, &output1, &output2);
>=20
>  	igt_info("Pipe %s will use connector %s\n", @@ -198,6 +199,8 @@
> test_lane_reduction(data_t *data)
>  	igt_output_t *output1, *output2;
>  	int ret;
>=20
> +	igt_display_reset(&data->display);
> +
>  	find_outputs(data, &output1, &output2);
>=20
>  	igt_info("Pipe %s will use connector %s\n", @@ -221,6 +224,7 @@
> test_disable_pipe_B(data_t *data)
>  	igt_output_t *output1, *output2;
>  	int ret;
>=20
> +	igt_display_reset(&data->display);
>  	find_outputs(data, &output1, &output2);
>=20
>  	igt_info("Pipe %s will use connector %s\n", @@ -247,6 +251,7 @@
> test_from_C_to_B_with_3_lanes(data_t *data)
>  	igt_output_t *output1, *output2;
>  	int ret;
>=20
> +	igt_display_reset(&data->display);
>  	find_outputs(data, &output1, &output2);
>=20
>  	igt_info("Pipe %s will use connector %s\n", @@ -270,6 +275,7 @@
> test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
>  	igt_output_t *output1, *output2;
>  	int ret;
>=20
> +	igt_display_reset(&data->display);
>  	find_outputs(data, &output1, &output2);
>=20
>  	igt_info("Pipe %s will use connector %s\n", @@ -296,6 +302,7 @@
> igt_main
>=20
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
>  	}
>=20
>  	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling
> pipe-B with mode "
> --
> 2.43.2

