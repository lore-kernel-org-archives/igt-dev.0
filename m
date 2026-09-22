Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78863C982FE
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 05:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013DB10E608;
	Tue, 22 Sep 2026 05:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJPV/CC6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C5910EB12
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 05:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790054735; x=1821590735;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vkZn9cOH/Q/sHTCFx175JkhADhoe9sGbwpAr3E+H/UY=;
 b=OJPV/CC6JdTWkICHN7IZcQLT7RJOLJ/YZm0jD4nsNlZskSkQMfJmNYLR
 1rDESyFfpJ47xF48YlY62WoGcXNqh67fPflYIjFL2TGGMI3l8qDjlc2Lu
 Bp3KriJN4tU/tgZelRP7GWFjQmsI88d+CK/h7Xi7NYqQRt5Ydlwwslch+
 B64eMHQb+LADadDifQ33q+bf3I8G2pC35k+cid/dCTLNAQJrNUcrfafZc
 c9LC/XCJXFCloL30kj3lE4mleG1aCWKzGOXUPAHuTm+tezlxsjBZi7/H3
 qdcuC2snf8yEPmM0nzmDQzWrEhJ/mMPpT26VYaN4mB0wusldOGV2jgHas Q==;
X-CSE-ConnectionGUID: eieGxkMiRkSp51Ys7ou7uQ==
X-CSE-MsgGUID: r3U6QLdnT5qRX/jhMRzC1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89761780"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="89761780"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 22:25:35 -0700
X-CSE-ConnectionGUID: tNX9dxUATC6n7TgjieWsjA==
X-CSE-MsgGUID: FtvkJQCMSoKFk/6RsnTA6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="269502032"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 22:25:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 22:25:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 22:25:33 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 22:25:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSq3y6+idBvsLKmjyjau+uQ6E+qZeI2BEr7IZKWFFqi/YV+7Qom5kFXV5ryKCmySe2mYT/RcgIF7TXny21IoXXCJuC8yZZQyK8sEy3HuVIJFVSdRrkHafEcV+D5wTcab8hAPZoEJmCf1FpoIIMe/wXMtG/eAMr2PcQ7fJXkLB2PfXfocfmFmq854H+65NEzLqK58JBUGQ56JMnM8koreCg3MDTlrQUTXM4MQ6pdGNRTh7UqeRxNrQEjNFLewhZkUIMc8TUMZspj8MXDn0KT4gFPELL7FPb56EFLE3P+HI/8o/e1P9x3xqx44JZB/QqHndqs5BX6F7EUlbxrG3o6BPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gcpbkBrzqDpES5Iv8ylXd0+pMTgsIp2sq1eIB77uQI=;
 b=NFPrkG58mklnKm1JUo3g72KMOY8tojcusbn6rRkUJgVRkxvm2ypeTI1rAiEfItsScNucefAVfS/8lESDJ+UTgLccPzUZOuR1vcS7CbV0xf+dsxuDK8zMNVNEnkHeGDXRAiXhiasKSr/U3vwdZ5JM+UlTlmrbqTLrn3XK1l5ZHv3sXEq6objEfkVGCi2iyY53AyAuNur6RuARAvqer3R46SyHoKVbQSNWTKjF4l2XxBPTZ8L2wxiKMmQgw5WvWtUfIhJuhHYMMW/mQu2u/qkuTTC+k27mbHv3IgVig4qe56yonANpfdPT9XBHlBgbFlZIiJWP6uBnw80mE51US1TGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 05:25:30 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 05:25:30 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 04/13] tests/intel/kms_dp_link_training: Check the
 config survived training
Thread-Topic: [PATCH i-g-t 04/13] tests/intel/kms_dp_link_training: Check the
 config survived training
Thread-Index: AQHdRZP/m2YIeQQUHk2mQJO9lnlHYrbaGBPA
Date: Tue, 22 Sep 2026 05:25:30 +0000
Message-ID: <PH7PR11MB67964B23E3DC7E298C49DBAAE5832@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-5-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-5-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|MW4PR11MB7055:EE_
x-ms-office365-filtering-correlation-id: 4b688f44-2617-4762-0626-08df1869eb1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|5023799004|4143699003|38070700021|10067099003|3023799007|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: KcOnyDnPQOetAySIEsaUw+3h9nSd8SQswn6PzwOk2LJOvh0nayR5iUjHHL1qn2xVlzDfaVzTET5mYTRobVRbCm/Vuk8zLJ2+i6q9NQI6giyN9Qh5E2V5/9olQESjYBcG46Q8ndoDbwMqWBLWuug2Bc/o8lTyYdMwGEZ8IjpUuccXw4CQtPAD+DZBpyrghl45KWjviLx9ffQam4OqLM8azjjIBy2DzeswDnDuiORthZFFdtcZD4n2IwUEQi/v3/wfPIiJAg55/4p9QBzjUMxDOQgtBRfIOVuDETC/EQ8Y9OPQVn/vQo6RITWwlZ8FKhHQ5xenW7kFtXg0wOwAO76dkFz6tsWPD8raRL6vwYV35NjYCQVLeZu3HXn+dwyJGcz8B1YHPdwbAgUIzF+WFiFWAUGsnbQcCwYZvWolf0NFt42yVXfiwp6r5WNDYu5wz38Hdb/heHiEye3L/6+vKWB0k3QhXo7/e2vO7L0Gq3bKVyp37sL4QrxcRiDSPEr/iKnmqbrD6RVG/dovDc6alSjawofrTHtCZvqHZa7wiIC0jCDxthiF/DjbWwanBbqL26hF4+E9Enq6lFIlQeW9sZf4cyDoocMq0zRcLQXhGCiaJvvcoWii6X0cOyx47EJelOm8r9hBvVpl60HyS8XXtD9zuYJL23w0YRep77gytRYTrJqdeJL4w+gCjKe8YeVCIr+AkbLKdyo/Us6AbC3+BYNvRWCEVvU6R7G9I4Pwjw6kNPc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(5023799004)(4143699003)(38070700021)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s2nnvI2R9Iy6nOeBX6t11lke65JC6g3TfgfK869/Y4Urd3GJnp+6vfeU68ud?=
 =?us-ascii?Q?DpBeQVScPatUDxgmvDWzKBNNalVHj3AUDHFmrxdXR16Aq74VVCPD98SxA7JH?=
 =?us-ascii?Q?bWEv6/ZTaA7rYExXY8pgT92ZosSA5IUzcjCEE27pIBSkpty8tF35CxrjHeeY?=
 =?us-ascii?Q?FtwXHyAEs2lklAFErL3PlpF27cCRwuMuOhGmnYMW9ij/2YNv+ip1UEOn0xWW?=
 =?us-ascii?Q?HCal+Wjk1Lvu7BLHDHeUTZoUxWa4NksvvOdH38K2DqlkjYSUUxuid2sRLm7o?=
 =?us-ascii?Q?vgH9dRN75vFq6RcqckhYodRBEPYEGLQDOBWl+LFt538VPZGa6rwp53MxUxE2?=
 =?us-ascii?Q?S1Oqn0M4HdNZq1CZGP7cJuaEr4wl9huqn+duzk+i+1RslUYvZp3jbA2XIKOg?=
 =?us-ascii?Q?dOM4OQ5uxRzuh04UhO66FS8lydCB/XsQnU4Peg92zd7BV0kxl3mYViIUBNME?=
 =?us-ascii?Q?GgWtUOxttfB3hrKaMPwXpPqKmTEdupFbc1qDmSdaYBO2o2pVHUexCFiI267Q?=
 =?us-ascii?Q?zI9DcX3d5dUfvK1IHwqGl78P41dZ24tyVWY+y+LPsk2sMwg57kjKLAX1SI3+?=
 =?us-ascii?Q?tD3QNdqNr3RnrAIRUNielCEymOVUml3X9wnOMzlQ4t0cvrnB9WHNszBxooXn?=
 =?us-ascii?Q?Z48awX96nTBsvTQT8WwPH8R67JmG7Y0r0xjT9A2P+KiA1FO4xEvhhNaPTBEz?=
 =?us-ascii?Q?xsPJVWK23d5NMnddCsGJN1PH7aN55gtJ1ALZxBh6mSI48nzk4qa5Lbgt0eKE?=
 =?us-ascii?Q?fs2MSU6ddxcUVoEO26UQxIk0RXovNm9VuTq4FP1Wol+YmQzVNaQ2+JaM2oav?=
 =?us-ascii?Q?haWeh1bjGmbSDrCaMsbBEn9MLMuDrWZRn4wSaBMqzDPb89QR89wNzTkVIk80?=
 =?us-ascii?Q?WUsVbx3InslqacxN2CXJST8k0195Y6Xig+f4p8rBFe6jeD5lYQirrigKXd22?=
 =?us-ascii?Q?Ug8diN6w2UbPm7m+yk0o/HqSgQE3DTsXq5Pswc9mWYDQioBFVvRwtvgR+5HE?=
 =?us-ascii?Q?FFK+eBF4sj11hVK+R1YqTYngtXPwSBmY7jtSU4cpAQQ2/mUQsiiNrVKl+xsE?=
 =?us-ascii?Q?/uR7hL4Ip47cYvIE1KqphmwzHI8GfA1BsHF9FSEIvSulaBOkpolmEAIhfwZ4?=
 =?us-ascii?Q?495NeXCRxs3y9Q2FzBehHenYIrHx48Wl1e2yvJmmvpSnWXmRMDqHUMAwA1tO?=
 =?us-ascii?Q?Tk0bnSEAuTWbkEJR367eJfAgOE5Cdozr7jqeJgS9tRolv+x6b+Q8qZUxkMxr?=
 =?us-ascii?Q?z17EtQeB2OowSXPOIJqdiYmZeE7GBxf1redGpgJR39uA7rkyLp5GytQil0hh?=
 =?us-ascii?Q?Vgh/6uHb4XmWMy4KbLOIWi2Yd+Pu6UC+2QfbxddXMtl0YASm0Eh/BUzFuIhs?=
 =?us-ascii?Q?VnSdcszZPkb3fmz2bCNN7J6nX8cEUSwW/s/t4o/Vwr5yMj9DBC+C7VvOm7uC?=
 =?us-ascii?Q?lyAnMuH7Segdzm5AQAMAH8o9+yPMaSTnLSh8Y7b47aMK8sUHroeyhFVtfvXp?=
 =?us-ascii?Q?ZoRk84nIJms9nGFSwxu5oyd+VvFoxXYP02dsv4X/YjktdGj6s3JyCaVaqPji?=
 =?us-ascii?Q?1yaZZrMdBroLMEA9oQ83afhIY+kWjR2ukgx0fEwl0dXqjHd6oxIm4YcY6O3M?=
 =?us-ascii?Q?qDnmvGUGZT3iliYlVW5SOQLIyesNvTLfMl/QJd0hW2elcIJvfd8psL6XwFwC?=
 =?us-ascii?Q?e9/4xz2nzO3l0ZW+d+e9ZibwCKZ7MpZRXz5L/SIc2p8si1ub?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: n59PCLatuz3wFd09C6cDY+EV9dFVHqSiVDylW27mpCWLLdVFch+eo0XfjKvgofP3mDB5sDxjzId6r6IBpyK4Ftjq+XcLolZw2FKVl2YQ9JKHmazqb1qVdWJsbnJSztMshyTIFGj4LktCDrrM9NyBHPCvhXMj/PiVfQhyK3D8XohOui4GTg8hMOUIuNcARJl7I9gqIcpYEvW+PL0WpcW365FDtQcVgTr+fsIX8NgCdrr4KyJVgdXp9H5MnYsO/zi4GSDyYxQdm4t27zfI2o7cB+Y/t+sn1w/Hw7rnNPTCcD7Z4suey7cRlq2AZaP3AuhAOVBMDPN/SIiO3P3TG0vk4A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b688f44-2617-4762-0626-08df1869eb1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 05:25:30.4396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6xrURNBgdsXyOTUftjpa+cf/vN6figvTauPT+kQT+D+TJ+POla9VGCqJmoHIFWUvDwWtjRyhN7pQpDc62NbMog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
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

Hi @Joshi, Kunal1,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: 16 September 2026 10:18
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 04/13] tests/intel/kms_dp_link_training: Check the =
config
> survived training
>=20
> The test asserts that the current link rate equals the rate it forced.
> Both values come from the same debugfs file, which the kernel prints from
> intel_dp->link_rate, the rate the driver asked the sink for, not the rate=
 the link
> ended up running at. A link that failed training and fell back still read=
s back the
> forced value, so the assertion passes on a link that never trained. The F=
IXME in
> the test says as much.
>=20
> link-status does not close the gap either. With both the rate and the lan=
e count
> forced there is nothing to fall back to, so the driver never reaches
> intel_dp_queue_modeset_retry_for_link() and link-status stays GOOD on a l=
ink
> that failed for good. What it does instead is mark retraining disabled, w=
hich
> i915_dp_link_retrain_disabled exposes. Assert on that.
>=20
> Wait for the verdict rather than reading it once. The driver clears the f=
orced
> retrain flag when the retrain modeset starts and only then queues its aut=
omatic
> retrain, so when the test's poll for the flag completes the first failure=
 is still in
> flight. Recovery ends either with a trained link or with retraining disab=
led, so
> poll for the whole recovery timeout before calling the link trained.
>=20
> Read the state before the next force: forcing a rate or a lane count runs
> intel_dp_reset_link_params(), which resets the recovery state and would m=
ask
> the failure.
>=20
> Drop the FIXME.
>=20
> Note this can newly fail a link whose advertised maximum never trained.
> That is the bug the FIXME was placed for.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 57 ++++++++++++++++++++++++++++--
>  1 file changed, 55 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index 595d78d98..b2d686f28 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -29,6 +29,13 @@
>=20
>  #define RETRAIN_COUNT	1
>=20
> +/*
> + * How long the driver's link recovery is given to reach a verdict, in s=
econds.
> + * The automatic retrain is queued without a delay, so this only has to
> +cover
> + * one retrain and the fallback selection that follows it.
> + */
> +#define LINK_RECOVERY_TIMEOUT	5.0
> +
>  typedef struct {
>  	int drm_fd;
>  	uint32_t devid;
> @@ -99,9 +106,46 @@ static void assert_link_status_good(data_t *data, boo=
l
> mst)
>  	}
>  }
>=20
> +/*
> + * assert_link_recovery_idle - Let the driver's link recovery reach a
> +verdict
> + * and check it had nothing to recover.
> + *
> + * A failed training is not visible the moment the forced retrain flag c=
lears:
> + * the driver clears that flag when the retrain modeset starts and only
> +then
> + * queues its automatic retrain, so the first failure is still in
> +flight. Once
> + * the automatic retrain is used up the driver looks for a
> +configuration to
> + * fall back to, and with both the rate and the lane count forced there
> +is
> + * none. It then marks retraining disabled, which is the one place a
> +link that
> + * failed for good becomes visible.
> + *
> + * Poll for that verdict rather than reading it once, and give recovery
> +the
> + * full timeout to reach it before calling the link trained.
> + */
> +static void assert_link_recovery_idle(data_t *data,
> +				      const struct i915_dp_link_config *config) {
> +	struct timespec start, now;
> +	double elapsed;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +
> +	do {
> +		igt_assert_f(!i915_dp_get_link_retrain_disabled(data-
> >drm_fd,
> +								data-
> >output),
> +			     "Link training at %d lanes, rate %d was given up
> on.\n",
> +			     config->lane_count, config->link_rate);
> +
> +		usleep(200 * 1000);
> +
> +		clock_gettime(CLOCK_MONOTONIC, &now);
> +		elapsed =3D (now.tv_sec - start.tv_sec) +
> +			(now.tv_nsec - start.tv_nsec) / 1e9;
> +	} while (elapsed < LINK_RECOVERY_TIMEOUT); }
The final sleep's outcome is never read: the last assert happens at ~4.8 s =
and the last 200 ms is dead time. Either sleep first, or add one final chec=
k after the loop. As written the effective observation window is LINK_RECOV=
ERY_TIMEOUT - interval, which contradicts "give recovery the full timeout".
> +
>  /*
>   * train_link_config - Force one link configuration, re-establish the li=
nk and
> - * check that the configuration took effect.
> + * check that the configuration took effect and survived training.
>   */
>  static void train_link_config(data_t *data, bool mst,
>  			      const struct i915_dp_link_config *config) @@ -
> 127,6 +171,16 @@ static void train_link_config(data_t *data, bool mst,
>  	igt_info("Current link rate is %d\n", current_link_rate);
>  	igt_assert_f(current_link_rate =3D=3D config->link_rate,
>  		     "Link training did not succeed at the forced link rate.\n");
> +
> +	/*
> +	 * The link parameters read back above are the ones the driver asked
> +	 * the sink for, not the ones the link ended up running at, so ask the
> +	 * driver whether it had to recover the link after training it.
> +	 *
> +	 * This has to happen before the next force: forcing a rate or a lane
> +	 * count resets the recovery state, which would mask the failure.
> +	 */
> +	assert_link_recovery_idle(data, config);
assert_link_recovery_idle() does not assert idleness - it asserts that retr=
aining was not given up on. assert_link_not_given_up() or assert_link_retra=
in_not_disabled() reads truer.
Thanks,
Sowmiya
>  }
>=20
>  /*
> @@ -222,7 +276,6 @@ static bool run_link_rate_test(data_t *data, bool mst=
,
> bool uhbr)
>  						   1.0, 20.0), 0);
>  	assert_link_status_good(data, mst);
>=20
> -	/* FIXME : Driver may lie max link rate or max lane count */
>  	/* Read max_link_rate and max_lane_count */
>  	config.link_rate =3D i915_dp_get_max_link_rate(data->drm_fd, data-
> >output);
>  	config.lane_count =3D i915_dp_get_max_lane_count(data->drm_fd,
> data->output);
> --
> 2.25.1

