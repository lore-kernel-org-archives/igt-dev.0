Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3132BD31A0E
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D859910E147;
	Wed, 14 Jan 2026 06:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyPWwDMp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC6510E147
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768372132; x=1799908132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y0cg4RNUmc3FwxS0o1Boz8QETZgA/eIfVowTtlbVnHw=;
 b=CyPWwDMphtFYh2TChQh1Kzcp/5KwrXXXoZtN7gtBavFSj9uKcfNjZKNR
 2rSmTUoj8+2HPj+X2A+x4lXhG0MMRu2m8dlcT3ppDft61V6kIYDzu7gPD
 Di1lKM6DY6dkUo1jWKsgew9v5wUbm6AQTqG29ueEXOjDW8HHiYhigMVs5
 Os+3yARFkh6gm8XHfXtwd4N+KiSJ6TxqGzK5gtpJcV/wrRZK3E2K6mCIU
 Prmq2MAij3ULjFxibuj1jsIw9NBY882iMIF85uPte4S+iOdGGxtlk9/OT
 eAkRemnWVE5GWn6L9AybL8g5ZvdEjXGOPVULc9rCNzm4vYpIaTGwzeyZ3 w==;
X-CSE-ConnectionGUID: AExZAU5MSqqQXwZeRcJf9Q==
X-CSE-MsgGUID: nJJxtRcITvaF6uts3r8Jcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87079478"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="87079478"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:28:52 -0800
X-CSE-ConnectionGUID: Ns7G7n1vRHW01dTKzXEBTQ==
X-CSE-MsgGUID: Wf6pKr86TnKGidcD0YvrhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205013124"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:28:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:28:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 22:28:50 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:28:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Juvh229Fsx/no2FYkAaMJMgsa9NCu7AzuE2dRoIi80Wxd5nbyfk5V3kGUUMiIEEs2oAJsaPcxLbo9neqBI4jjrlfEpXtyOQdh1L0TsYsHCqGV8fdceB3zfrXdYUpPioh9WqITwaQnIhA8g/ohoWq5lcnzOxj1ZcBAQgtU6pAma13IlD0cofDTIDBgszP5pqZTUTHRl6gCZ+CWGRnrY5udDIBvF0U44+1QnXK+Mm721HhSli0QFbZdqmakJFfEpdu5h4Agx28BrAd/9UgroJeeKRI9f+sSZUMWwW/rMFp3IXdL3456/ICmn9PoemgeRZGu5ZWq6acComUppy+Q71Q6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n805BSfPmYDH2po4ISy2EHwiKT5+uIRuYfPPDukOK3k=;
 b=Z4zHEelkzoyYMUHNnQ8WQNnDzSlGwRY/yCLVjcVFzPeddy5qlTDYYjEdhcj8ZBrgzOiCbHPK2ZbkQNxaalZpeb1wLbiG/M2WNW2HM2MIoWwUeLFbaEqiNecW2V+tmiKwey6g7kzuNJ1WjQbygRdRUeSXgdPzECRdfv703MpiVdYBgIAIvhlRL/KAPtD7Cv71HOfkjuxxAhShxkvUMfAPZHQ2bcUb2cDsKYFm3Ga5bmV1sKBd13BwTmkCzws6QwZS4U4HwG9AnAHIOhRRJDQi4M4SwGIcltzoPgKeLoyzl+NndWfrOlIwn8LRhoEL9pu9iCuUXrvDE3VXUcM5VONKuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA1PR11MB6321.namprd11.prod.outlook.com (2603:10b6:208:38b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 06:28:48 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 06:28:48 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 6/7] tests/intel/xe_exec_threads: Add multi queue
 basic test
Thread-Topic: [PATCH i-g-t 6/7] tests/intel/xe_exec_threads: Add multi queue
 basic test
Thread-Index: AQHccN93wqK3wdUZ606JRa53yLnLfrU8U4UAgBUHnCA=
Date: Wed, 14 Jan 2026 06:28:48 +0000
Message-ID: <CH3PR11MB8434215D867F17921C883D8B8D8FA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-7-priyanka.dandamudi@intel.com>
 <aVWShAsoxGrXXtom@nvishwa1-desk>
In-Reply-To: <aVWShAsoxGrXXtom@nvishwa1-desk>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA1PR11MB6321:EE_
x-ms-office365-filtering-correlation-id: 258e33c3-45cc-49b8-8531-08de53362d31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?x61qPK0ouJozVMWXq4rxGcYNT+zMPpqbU6yiO8GtWJROFVUyrFkIdE/amEwZ?=
 =?us-ascii?Q?QX7sC08tVz5Y4ycXvux3Xs8Ja4aXgtI3rIpoUntopV03SD7oY33s/NrkBG+Z?=
 =?us-ascii?Q?vl4hqBD3/2kn/l34F69rQuYwO6BZ72damDcjYeATf44M70yrUXBgUuT+YeFK?=
 =?us-ascii?Q?y5DZiRMKOA3AD+430LuH/9HzX2yRMUTCdaYIyiQMRp+hswL+ZeTFskjgT7C3?=
 =?us-ascii?Q?RO72tXD8l55aQPgMi+I1kjZgXaG0FgscXiq7zrhkV5QN1gRrbpofnVgJN0jj?=
 =?us-ascii?Q?qHsBPFLcHduo2fFTE9Vj/QjJ2ZwP4dNp1b+qezXcqVvccSx2z9sV5PA4YgeD?=
 =?us-ascii?Q?pUd8GXrTDRoM0HiQFt/rVOjctbFCEBDyczIj0ChukX9xC5XZ48wpi9ERdYvv?=
 =?us-ascii?Q?MiZlF+oZp2mdEXxtyj74pMNSrX4d70Pf91r5IzDCW9iwcUASZ50h23DKZskS?=
 =?us-ascii?Q?T7N+ffspForYNNhRGJ0zCbicxNsOA1X6slRNUw9GX2/X4rEcBbpkq/SZj6B1?=
 =?us-ascii?Q?MJjXq64rLbeZk67ijzIJK9vW0ZoV9J+dDCb7fw9N/KuBPK1jPrGacLR22hIP?=
 =?us-ascii?Q?vWT5NzKqN2vnpdL1sERFwI3ZYw45DbtNtYtU5QCIcTUusLABpm5Fbq+PgROs?=
 =?us-ascii?Q?4riHWpVGwG6K5stENdWthkzO84Rd0ftJp9k1Q7b+C/g8hJrjU1kN86JbBbgo?=
 =?us-ascii?Q?/TOBuhQDVl2Game6T1zf+VvVbe5FXkClLCucPxRDIrYSNYpcO07TwgAIq25X?=
 =?us-ascii?Q?m8TaEPmhwW8x1/JnvWdJSteZKuaADchot+9MrSPY95Uxm0ek0+4hq0Q/ShbM?=
 =?us-ascii?Q?9rkm7Q2qT60YugX0o0ub4empdFGOT+mKAisoNspcNdXfZKIoXqpnyBD+ixSm?=
 =?us-ascii?Q?mE5numubHNac2MXQ/uH7Xbm4DvjXx0fqlO9uCDJJSWIaStrAgwPIPAAAiDCm?=
 =?us-ascii?Q?hmCEZBmDJ1tVEFgdGGlb8jc9UpuIjlETZw1U/K+510j53xjPEGkaIn14v+nQ?=
 =?us-ascii?Q?Y+htQgeidFP0PymeR9ax3tEGHg98AFGA1yvwW/mcjj4550gpL39UXb9TTd/B?=
 =?us-ascii?Q?UcKms/LhzVxpNwUymtwf3FnHXTQhyaGlN0JMsDW/MKcg3Wqyp/gBWLsOkjty?=
 =?us-ascii?Q?iT+4Tisth65WnuFcG8H2cLkQ81AmO/B1ZWrUxsZyZ2PLYzAfthBRYM3+rPUK?=
 =?us-ascii?Q?Pi9QkZdur9FDv1v+/mcbhUB/Q//4h2OzI78hpeTX7SL8/hqDGoNEV3SALALa?=
 =?us-ascii?Q?MdALJ8nwial6MEJyeXzqrEzGj1CY4NF67AdPW+ZjjVah5YGuZIibU6m9yQEC?=
 =?us-ascii?Q?4vgPeEtxShzWoYeQLiYkMCvnmtc0vCggTrUV7R4owtOEEt6XNM8BM6gJ4Mxa?=
 =?us-ascii?Q?1R0BKGc2x1qUCtCf/x2bvJqPGUN8UDQTty+eXr/u20uDyH4vaeY8pNVb5yWy?=
 =?us-ascii?Q?8Wt4xId3yuyei01k6rQ7yCYBMnLMSCmDjSLDUCdAwU7ImBYWGTSFTg8lMfr0?=
 =?us-ascii?Q?uJTceGxcvacl3upBA3g9CvX9EDdnilHSlvVF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?44noAgYwbt3RW4aXlV3ejlT9V3i0/oFt5DXlZQtj0nQtA8UVZ0f2pCIaoyVL?=
 =?us-ascii?Q?UrgzWU6uLwK5jNngBE6eMX2X1Wb0qxJpK/U9HAwl8wrFCVlHSmmv2HNhTLZZ?=
 =?us-ascii?Q?rc+AlEteoWs0SfzVEY1VCRuOieVPjMC+2SQR1GbJFDXjTskC05ibM71GDXda?=
 =?us-ascii?Q?MS9Lksd51kNTHh8j7m4ffdFa4+biIQ8NZm71c3iJS1+pMvXgkwCnuNq8JE0v?=
 =?us-ascii?Q?gEuKoquf/1ujn1AIOx+dOTgCmrkrBPXloYB7ZcaVZE3x0ULbM+Wdxmn4rM0I?=
 =?us-ascii?Q?6bp9ShlSS5U5LpwsSuYIk3EBj6jFVIygJV1QEH4WOZFjk5wNm2FRT7m4/ESw?=
 =?us-ascii?Q?MkN67zc+V1mZoOHg0wfBt+DooeX1OoQ+ubkhIlVzRcF1cdpFkfNBujE5re5b?=
 =?us-ascii?Q?3JqeBTF2DlNH+OgQgg1qOVTfGfiPUOa4ZybeJzB8a9iR7nvfZ3kpdUb+qIhd?=
 =?us-ascii?Q?bF5BeHb4VMyvwo9Mi68LZQ/9vrerkR0Uai3Xk/wtjmWXgrDosXLwulGyY/SD?=
 =?us-ascii?Q?aK7N+AYuMM4WUMerzdbmMlQzUHsgA5raI6Lmg/PBjFg2xdRuWNbwcMdm2ZLT?=
 =?us-ascii?Q?wKavN6gP+fmyEpORRobkduHRXd6Ygy9QB+7OhpM4pQ9A3BH6F/eSoBOjTypE?=
 =?us-ascii?Q?47YPA/0MsODqTX/4Ua2Dyrqnlzx6dlnwaj3Bw4lk1IhgDePeOfaSA2S6FWZJ?=
 =?us-ascii?Q?ME/ON1DDXR80VhG6Yud87/O0IMA+qeyqeez/81HQE3QjoEtN+TBYWIUceeFH?=
 =?us-ascii?Q?WmrkzD6DDe7320wISJO4Hoyn/QZnYsblfYao8W2vQGnyHUT5/ICb2CKX5jnD?=
 =?us-ascii?Q?sejlDOhsSU7mhQL66Nc6XQdrNZsnGdTAEIUbCT0oo2to3HGVMAaQ3ewSIkS2?=
 =?us-ascii?Q?N5LelDLuvKg9R5cd2D3tj45ESbejlfJ4YvNH6HWsHvB2os74+Ud6GbimNU3+?=
 =?us-ascii?Q?qCt0K8Ft4wrftbiKf9Aa1NlS7JmbCtl1wSfZW+B8Auhs/b1B0YlKl36IMrSR?=
 =?us-ascii?Q?rY+rt66R0HWB0MqcXZzEVwwaTUljcnsMgm51B3iGBx8z+1EF48S4cee3nRNf?=
 =?us-ascii?Q?Y8QRI74c7pHi1UMlaobsMdx0bNsle5WDy+lupR417WaiqAv4VJXjVtJBjWmy?=
 =?us-ascii?Q?NiL/cCTe7imc1FvHouSBC6dbBPvxCaf5kp/MSv0pGISpOKEfIiHPScVxmzJB?=
 =?us-ascii?Q?ikCvqHuhnB4lC4zKL7Moh/9PqEj0vUwgZNc9JvtgVociqBZr1y6Dudfs0hNV?=
 =?us-ascii?Q?WfofkMtM+3xRXfT7Jtiyrd7kP2u9Dn+QpYVxJRBuMv/5lPjlxG3dq8U0IjSw?=
 =?us-ascii?Q?tshcrBOzr7EFphCAHcU+Djhsacg1T4vh+fek3l3gIQJSbKkn3g3Nvi6ScqzN?=
 =?us-ascii?Q?JWkaxpFookgpwDPCXNleixSuFSyM+pxWnq+43yCy3ufB78xkU/VzHegGm/CO?=
 =?us-ascii?Q?n6yMHe9mS8hFLyhW+jtgHLZH4OBaRYsDeuxXNIe1M7Dl24lIMevFZ7hxPhrd?=
 =?us-ascii?Q?SnWb0a6LRCIVbaTUYS6/AfGY2xPfD4daFQ2whCq24F1VWTfzYhjawN154X9y?=
 =?us-ascii?Q?3JlMsLyVJQJre6NO4jjKqYyIZ2RGcqy4zsJaupISlTQ/raX9BV01DgVoLR3s?=
 =?us-ascii?Q?UtKwv4LJRZ089K3l0aNO+VYOGO2vXx7yUCCTHd66QN+h47rvL5sd2Yf3dySE?=
 =?us-ascii?Q?vTRHwwcFS/JP7leehEcIJtRRbF4G5jDTKCLD8tE/g/ZTgVmPm1LXcFVoiYcF?=
 =?us-ascii?Q?jZGQ2X+UboXENnJnrDwP7Sq8U973HDA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 258e33c3-45cc-49b8-8531-08de53362d31
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 06:28:48.4615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bcbZcuztckljH8eJntTyRxAzBA8wGJKSboNgs4jURpr91CEm6UxwJ77VjlxwEbylsIVxHRCigGWM6bcV6uVSvGHHF/c15JRPSpIVJkzQi2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
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
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: 01 January 2026 02:46 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 6/7] tests/intel/xe_exec_threads: Add multi que=
ue
> basic test
>=20
> On Fri, Dec 19, 2025 at 05:31:53PM +0530, priyanka.dandamudi@intel.com
> wrote:
> >From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
> >Check multi queue functionality in parallel execution scenario.
> >Changed naming for multi queue and assign exec_queue create
> >
> >Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Same here, remove email ids that are no longer valid.
>=20
> >---
> > tests/intel/xe_exec_threads.c | 39 +++++++++++++++++++++++++++++++----
> > 1 file changed, 35 insertions(+), 4 deletions(-)
> >
> >diff --git a/tests/intel/xe_exec_threads.c
> >b/tests/intel/xe_exec_threads.c index e8d56a3ef..4bf1cd1b1 100644
> >--- a/tests/intel/xe_exec_threads.c
> >+++ b/tests/intel/xe_exec_threads.c
> >@@ -41,6 +41,7 @@
> > #define REBIND_ERROR	(0x1 << 12)
> > #define BIND_EXEC_QUEUE	(0x1 << 13)
> > #define MANY_QUEUES	(0x1 << 14)
> >+#define MULTI_QUEUE		(0x1 << 15)
> >
> > pthread_barrier_t barrier;
> >
> >@@ -540,8 +541,22 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t
> >addr, uint64_t userptr,
> >
> > 	memset(sync_all, 0, sizeof(sync_all));
> > 	for (i =3D 0; i < n_exec_queues; i++) {
> >-		if (!(flags & MANY_QUEUES))
> >-			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> 0);
> >+		if (flags & MULTI_QUEUE) {
> >+			struct drm_xe_ext_set_property multi_queue =3D {
> >+				.base.next_extension =3D 0,
> >+				.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> >+				.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> >+			};
> >+
> >+			uint64_t ext =3D to_user_pointer(&multi_queue);
> >+
> >+			multi_queue.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> >+			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> ext);
> >+		} else {
> >+			if (!(flags & MANY_QUEUES))
> >+				exec_queues[i] =3D xe_exec_queue_create(fd,
> vm, eci, 0);
> >+		}
> >+
> > 		if (flags & BIND_EXEC_QUEUE)
> > 			bind_exec_queues[i] =3D
> xe_bind_exec_queue_create(fd, vm,
> > 									0);
> >@@ -979,6 +994,8 @@ static void *thread(void *data)
> >  *	balancer mixed fd userptr invalidate
> >  * @bal-mixed-fd-userptr-invalidate-race:
> >  *	balancer mixed fd userptr invalidate race
> >+ * @multi-queue-shared-vm-basic:
> >+ *	multi-queue shared vm basic test
>=20
> I don't see MultiQ mega feature being added here as done in patch #1.
> Looks like it is not consistently added. It probably makes sense to remov=
e it
> from individual patches and add a separate patch for all the multi-queue
> tests.
>=20
> Niranjana
Will send Documentation changes in a separate patch independent=20
of this series as it requires addition of xe_exec_multi_queue along with th=
ese tests.=20
Also based on your suggestion it requires name change of test case for mult=
i queue which need some discussion.
So, will send that as a separate patch.

>=20
> >  */
> >
> > static void threads(int fd, int flags) @@ -996,8 +1013,11 @@ static
> >void threads(int fd, int flags)
> > 	int n_threads =3D 0;
> > 	int gt;
> >
> >-	xe_for_each_engine(fd, hwe)
> >+	xe_for_each_engine(fd, hwe) {
> >+		if ((flags & MULTI_QUEUE) &&
> !xe_engine_class_supports_multi_queue(hwe->engine_class))
> >+			continue;
> > 		++n_engines;
> >+	}
> >
> > 	if (flags & BALANCER) {
> > 		xe_for_each_gt(fd, gt)
> >@@ -1023,6 +1043,8 @@ static void threads(int fd, int flags)
> > 	}
> >
> > 	xe_for_each_engine(fd, hwe) {
> >+		if ((flags & MULTI_QUEUE) &&
> !xe_engine_class_supports_multi_queue(hwe->engine_class))
> >+			continue;
> > 		threads_data[i].mutex =3D &mutex;
> > 		threads_data[i].cond =3D &cond;
> > #define ADDRESS_SHIFT	39
> >@@ -1277,6 +1299,7 @@ int igt_main()
> > 			FD | USERPTR | INVALIDATE },
> > 		{ "bal-mixed-fd-userptr-invalidate-race", BALANCER |
> > 			MIXED_MODE | FD | USERPTR | INVALIDATE | RACE
> },
> >+		{ "multi-queue-shared-vm-basic", MULTI_QUEUE |
> SHARED_VM },
>=20
> What about other tests? Why not add multi-queue variants of those?
>=20
> Niranjana
Author selected some of the variants of existing tests based on the discuss=
ion. So, not all variants are present.
>=20
> > 		{ NULL },
> > 	};
> > 	int fd;
> >@@ -1285,8 +1308,16 @@ int igt_main()
> > 		fd =3D drm_open_driver(DRIVER_XE);
> >
> > 	for (const struct section *s =3D sections; s->name; s++) {
> >-		igt_subtest_f("threads-%s", s->name)
> >+		igt_subtest_f("threads-%s", s->name) {
> >+			if (s->flags & MULTI_QUEUE) {
> >+
> 	igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0)),
> >+						"multi_queue is supported on
> graphics version 35 and above");
> >+				/* Balancer can't be set with multi-queue at
> the same time */
> >+				igt_assert(!(s->flags & BALANCER));
> >+			}
> >+
> > 			threads(fd, s->flags);
> >+		}
> > 	}
> >
> > 	igt_fixture()
> >--
> >2.43.0
> >
