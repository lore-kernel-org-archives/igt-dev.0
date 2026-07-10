Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200DDC43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 07:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2B810E13A;
	Fri, 10 Jul 2026 07:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDumBdD9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EC810E13A
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 07:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783668115; x=1815204115;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=izurh7SH4ipr5gRYDjpt4PJ5ngU/Pf60rfOAdFO+MLc=;
 b=EDumBdD9LGMCMVxclUoBf6Nr4Efgr8c0r9ySfchtMqWEyorEnJhqg1fo
 o2tGLfstC0s6SRJr25H8Aeetp5itHRYxAOM625c7BAfTEGRhFZ4IoB7Hi
 fJvhGo5oWm9KLYNw7O3WL7FZJrjoFsH2xZyTVl3D7b73TFfat+9jsPD29
 8brP1uEJRKxFaf8RH5hI3L+YVb6WHT7lTtV9aQDg8GQFI4/G7dc5EYtq6
 wPDu6StxEeHliiMInYO9TA1OrxpE2AJEMRFjGZRd+3taIFop1MkN1bOoZ
 1wWCCtXsM3CIKzgR5HyfLQkpEpzo3Y1Biz2TLn1YnX4hcNV/5OhenLyna Q==;
X-CSE-ConnectionGUID: SHyY55caQvq0y4UnYLvYtw==
X-CSE-MsgGUID: 6hnGWONoRlOA059zAvfBIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84384342"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84384342"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 00:21:55 -0700
X-CSE-ConnectionGUID: qBEP2TzMQ7qkDyQeIsczSg==
X-CSE-MsgGUID: Yhi2F8XQR7O1DGx8AEigwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259124436"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 00:21:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 00:21:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 10 Jul 2026 00:21:55 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 00:21:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljQSQyGK8uhNPB/h0xuzmpRvaFM9vaZiCKAn41gSBvGrgQ15VwCkxAL629wAFc5m1K1kstyA2MFdsjnb1Ffzrh55cJRKeoFPydUi7n+eabRHn1p+YB7a+vqxWOfigRIGyDLvBYApjN5XnaCdaFeUf/vLxigtMvDCJKk0MXyrkFxu5Rjg7vP3xFL7f5QdgIb2P9IlYOvpZKkGvj0XvVnZ+O4oW7BQs3vUMSSSb24Y9ue6mmsp1NCDwkl2DxFOxhvL3hW9is65DtnhHLMDiwajLrJ7JXkSuA0tK+WSIoYAWtmL0xUTRTvDOoxczeLirRiMJd8RPgXTKLO9W7KP+u0eEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ/Hs3Zg9U43KoCnzG4PDRUsXhYHmH3CehT4aXlxQvM=;
 b=cmzLHIoVc3Yhc6JvNxGnfIJ50EZPMqv9NnJlsl9W7IlupwxyPTWDzpSjjYMRJ3EDCcoZ+VQN3broyTmyRk9MR1qKkPxccf5ChZ+TL3ePFZQCgeifwNL1nXfvBaP5TTDh3no/bkQnxvPnecOVVGGOK0IkUTMNJwr3F/isNafF7408rD1RgPobShB1viVH8dNfdYIM9V8wvhXCN9jg3F7jhly2UNNZ1Ckaz891BU2recSEEsmyA11DHG+qbiE25eQ0Mtsdkk7uAc/uK4DaMe/dCy0aVzSdo9VJQ4m4w4T0/UFF2C3LITSMaGRWh6jlvdT4XEkqTgTMbml8b+jaZCk+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 07:21:53 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7114:e8c2:4d34:2901]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7114:e8c2:4d34:2901%5]) with mapi id 15.21.0181.010; Fri, 10 Jul 2026
 07:21:53 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Dandamudi,
 Priyanka" <priyanka.dandamudi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_vm: Fix igt_assert_f condition in
 test_oom
Thread-Topic: [PATCH i-g-t] tests/intel/xe_vm: Fix igt_assert_f condition in
 test_oom
Thread-Index: AQHdD2f/QrdfOVy6fE+lFkj0P+sv+7ZmWlOg
Date: Fri, 10 Jul 2026 07:21:52 +0000
Message-ID: <SN7PR11MB74894656FBF6984D9509323E85FD2@SN7PR11MB7489.namprd11.prod.outlook.com>
References: <20260709055753.2081956-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20260709055753.2081956-2-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|SA0PR11MB4671:EE_
x-ms-office365-filtering-correlation-id: 00464843-ab65-4aee-8fe4-08dede53ea68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|56012099006|11063799006|22082099003|38070700021;
x-microsoft-antispam-message-info: 6qUXGuWhHT2dlR2uv8z3ymhHfMEizEX4wi57cEg5UHWk/snaAOZm74hJjiLRHgTKJEpfhlrIw5PBUESeF5knGZcw9MD3heLbtFuAnmbGdo9qNlVUkoctG3O6r2lG+7PwAOxT0NIzJHd9Ci8NsLuW7gdZUPGoLLuZcydo9WLm+WWPN60UQSdBQYivwMZj+w9E9/4eaMJQ7bWLOJ/N0EHpKjpxvSiLqj6jXrAGEdgItcn8kgVGkGe3qpPw2ORsfFEntLsSVT3cRk7uwa1qe+YtsMpnNp3uQWkVq2l2CHcdIgWJkXChpeA6sCC93rDYYb8vl0q38RcYjYt6eugRgquXpguSr9KExQ8ET0OW6j/eM1sOFHDNDZfmfi8fWUUu1hQstS05Kf/yDzYKomlXcWynmiFyPJL3G82M3GMX2oY6cLXXz7gzFvKTCdXYzxhpv+ps/efNJYbsI6VjdAYuHcoDveBZn3dgp+q1y3LuJIZYnT6Oo3v0XywWh/+rON3PnszhIaCf19hN6bJJuf9506xm1MMQ85xWjAWkpordTODAOneEpiIrjEJ/z9pxuyZubN3JfJvMvrfGYJseu+iVA8tVm9aajX+a+1WlEiV/QtslVZZbRq0SUnkUded2ewIMcNwV/D2xWsNPvz8yTclNpnj40MQugPkq2JiUq8xg0ai2kG7W6m+9dOexDrhxLkgR13Nv5+PDzdCPsCo8QasZIH4QJldgn9MbfRbD+oyviTbkfiw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(56012099006)(11063799006)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kKf6d4I6z6yVm6hTR5vQDAQ95vQmRvSgXtE7vp/9BpTyEeVsr2xifc7PejVY?=
 =?us-ascii?Q?qYA4/WPoHrlsO4lhaHtbAGP2BkXQjIeQn5amIRSUkSMAvYzWHiewxNPTs59m?=
 =?us-ascii?Q?he8y7nKB5yrZjj8SLLJB/IQIOxZFAMqE9ajYsk0/3wNvPwkaLp7yKzetSwsg?=
 =?us-ascii?Q?4yhPYOUPhj/n015lsr669Dpv9F87s5VtJ3yqq4GuDSgvN7eiMx37Gopq1M+O?=
 =?us-ascii?Q?rjQvjNyFZnD/Cu1dGd2pjo30I6TWL1xpeutcdoXkip5ah+PTIm+jZGcPFT3s?=
 =?us-ascii?Q?YMDpEuvt+VUawvhBg9A9vZspYRMV3V6gXqg/yzOmqsDSBtLXDdV4e/6sGDia?=
 =?us-ascii?Q?oKI+yVbI0wAGFwIsLgdUnu7kOlB6ts8TTpWSfOANNOCQu16kANQONaAUUAhB?=
 =?us-ascii?Q?2Wcp0lA2fIE2uwcYl7PNww+nMWNVZgcXLBtv3k8SqUYQOMLWBLxKN9yCsBpf?=
 =?us-ascii?Q?XJcxio+kqJwq+bSHk983xcG8NlmrJ8atpzrqDKRy8j5mwfJ17KU7dU38LNUc?=
 =?us-ascii?Q?2nZ69pDsOcxfYnwvJEh1gnJlEKtUnz+IvtE1DQl0EGBMIl78x3RxysP4RjaT?=
 =?us-ascii?Q?K5LWofILr4R+aQP8O7mJbCs8lKRZr90KaKnaM7o24PWM3G/xDXfgtnj9DQ/a?=
 =?us-ascii?Q?vhpuyr3weX/rV3P45Os9WaOk43h8qZq6cWxmeSKDL1ybfquAmFErKIqrRiae?=
 =?us-ascii?Q?zshGFQMGR2nhdRhs+B/+fPWPSCwTj/iERtQ9hU2F1EGVg5Blx5t7ETIbpeul?=
 =?us-ascii?Q?f5eL25BNr+qZVFyS5U01eOJ9ZITrroLB9ZWNQlcfWOmyed7p3D8BZEvQfp4f?=
 =?us-ascii?Q?0bLYR3VOjM0LP23yNDbu2pKmhVxVwsdFtRGpfot2Wkh2VsBc1gKgRpze9kLB?=
 =?us-ascii?Q?1cxHkD8E6UtqWKPbFAiojCi+qDyVbXhdGnbHSExlOJsdxHNGfZAGyzAYamEe?=
 =?us-ascii?Q?JYyhGxE6+7iWUQe85xhBwNHqajex6qPInNdPfczyh0GgDSxlkgH4K3r9y7f7?=
 =?us-ascii?Q?EZpVU1BArolbJoA3CRvmJaD3jz4WX+gVD3nbvFCd7T0OukoHetHX44z92bW3?=
 =?us-ascii?Q?1PgZGGrGT+zaKULOrrbInP+Y/ZhbL8WEWqLHlBpHLDFv2/6sNeqlftsxher4?=
 =?us-ascii?Q?CQAPcCbuZHDTtsPx38Im06/q7VxVaQBDnJqKGonfqx155U2jwR14t3ilcwZ+?=
 =?us-ascii?Q?ikaceyhKs61DXR4Mp89gXEixxznpvEyeYMFjgjJMx3uvCDP38CMECRdqiSnY?=
 =?us-ascii?Q?+VCXRA+dWDNSDw6dHGLoyZabCStnGufaI+By8ycYTP/havYbtgPH2HgDPy2t?=
 =?us-ascii?Q?+KuB3mnvl2w7Cd1Q6ZvysavR/hoUmoY43tXKeCdvPxN1UZLJlZ+EepDVdUNM?=
 =?us-ascii?Q?S9aVFQNS6WnaY5naNjrKYtOgv1FHM4z0oH6UXu9KQJs2MpAOi7tPEoG7+9KS?=
 =?us-ascii?Q?LCniHclc2aQ7KWDJWI5G61Jn2UlG+ysXkDAFBeq+hZT1ePt24VwWYZt8LbSP?=
 =?us-ascii?Q?LGxEcYZh6vU6DEoSUVD6gRXo0kZ02ZgWHeqqDP3DM8HgQc2s+DD1nawwyfIc?=
 =?us-ascii?Q?WylZrte1a5wLS260SirWSVMPBG+wSDsP7LoZL/cqoJA2GpFSfX5NCiDASWIq?=
 =?us-ascii?Q?2Yw2JuktYqAwTcY+I+qF5M8OaOuSGILesdNtR19wkjZp9GyYT0F9tR/vbmWe?=
 =?us-ascii?Q?zvfiD+YrDoYu+/XpeXTlZaWlwVKJmQ5qvzchtGAnSHa4APyk5c5YY6iZZ+aJ?=
 =?us-ascii?Q?wtKtja6M4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lSSUilq6jE73mk8nzLzuJXnLP3B8M0T8HW8H0M691A4YQDKlMogNR2PVQ/SFm2NcEUH2cSr1zmFh+hPC7f6/SEof0/W7xSW251lq/+GlhxWHdTXph3bzKBTSykomovjH53ncRIyfT/YOpY3N3J4Mm6kLlqfUUt8Rn2CtoiKnU+cz4SKmwTsvz+CAm85/ZonxuXD8ve5YB5K2HO//hPwIMC+Bg5Y5QvfVSm7nEhSdrQ7Dh73M8VQV4p08kADeYfjHa7V+WpxlvJv6rReSdwGVZBXRewMBm6z81T9sCqPSsBKpQsevmtUEbOWJWXXEhAfrt7nZ7Or6rbevIO2TCxuTlw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00464843-ab65-4aee-8fe4-08dede53ea68
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 07:21:52.9318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ioHo7rHnhxaV90a45ZUzwfV0+lm9d34tqV9YZandCYguT+2Yz/nGFf1NMv6AeBmbBXM4oN9xl2LmtpZfnsl1f81hjjh9DIDielj4ZpV8e8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
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
> priyanka.dandamudi@intel.com
> Sent: 09 July 2026 11:28
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: [PATCH i-g-t] tests/intel/xe_vm: Fix igt_assert_f condition in t=
est_oom
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> igt_assert_f(err, ...) is reached only when err is non-zero, so the asser=
tion
> always passes and unexpected vm_bind errors are silently ignored. Negate
> the condition to igt_assert_f(!err, ...) so the test fails on any error o=
ther than
> ENOMEM/ENOSPC.
>=20
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

LGTM,
Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

> ---
>  tests/intel/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c index
> 386a0981aa..1d109e783b 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2799,7 +2799,7 @@ static void test_oom(int fd)
>  				oom =3D true;
>  				break;
>  			}
> -			igt_assert_f(err, "Unexpected error %d for vm
> bind\n",
> +			igt_assert_f(!err, "Unexpected error %d for vm
> bind\n",
>  				     err);
>  		} else {
>  			bind_vm =3D bind_vm + 1;
> --
> 2.43.0

