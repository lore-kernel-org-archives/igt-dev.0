Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F094CD2ED0E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 03:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6708310E234;
	Tue, 20 Jan 2026 03:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWTHv/e4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1E510E0A8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 03:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768878419; x=1800414419;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DCdadO/Sacrw8NmokA44IIYa4gpjGVWhJIAQWfELvs0=;
 b=jWTHv/e49VMCC72z4wBD+/ZLqUqrRMlF2/fAJEnAs9bAeUwgCMuhnhHW
 hUnUUAf/OWfte8H+wGO736R6uLW80ofTp98W7/1jZcxeoc2W5ZF5HNt16
 J2Nb4Shb0sE3qv7CoqZ+OpzJF2s/knegmu7xMIWGwyis2nkiUuiO4xYTY
 BwiTbP/PKeZ8d/NHST2ltw0zXyPnK6AHswce/fUH4jT/48C18irrIVJPW
 k661Q3r96fp05PU06+D6Yxolj9gUEyHa/49b2c+Wx4PgdzV0PiVocfbHN
 CMkOXG/D4FPgw4I/q2CqetjoU83j5alyBH42NeU2HPzn6F5iUnBP7mqCb Q==;
X-CSE-ConnectionGUID: XeQlnP8dTBqUtLCdRtd7BA==
X-CSE-MsgGUID: urvq1n64QR+bbzVjomW1xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70169800"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="70169800"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:06:57 -0800
X-CSE-ConnectionGUID: uQn8Xs0FRVeoM0oO9eVD3Q==
X-CSE-MsgGUID: v8HdRRpmS1KQiv7Iztb8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="228928521"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:06:54 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:06:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 19:06:53 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:06:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a21LPr1Be7Nnps65XR/OZYhEX/bYliisQXHTywra7BI+Vj7CjJIsFYg8ptJsNRjh+K9hg+XAnTGpQgjQ6xVPXiQJJ4u/g3TXKQD3QVpYn5cpdeVMm2x+5XSXMR7kZr/ZIzrapQ328UXI4ZTSKgMgdIMOACfyRx8ufFZ+qGFxTRfUPzUkQCyYL+jqe7jkfj4BYPGhJeykjD+2LBWDfdX58VgK19nNSywUp5xw0/iDnwQ84kgS4eSE/wLD9RCjUraB5CK6vnfcA3HbPuPeH2VQipl/te9LWk4L4gi5fWAhIksiVlhSlqY1sZFffc+qsg/myvZzfs8BsHAKc4vqnWWpsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZku67ZLYKLXCksfnsVh0G0crep33CkPqd4aWI/zY/g=;
 b=W8VSuhCJMotpuOF+F1uejUzoxjyo1PAR+/3dq9rUoIcIgBmRcG+eDOf0J0Tc5Fi2d8cbdfS+IyCsndId3DJOmMvR32K41D/eqjj6zanwTmia0yPsLnrS2aC46IrYDBv16hVP/T/U3QgOP6iRDstBUHSY1aphMiZKbKtkFU7Xmuoh7vfzoTxXSuqMH0eOK+t6CB7HX2TQ07ngt9Vfihs8tH5eMMOvDUPI1zJa1lV6mNXKnkDaQ4FzanctnhjjpCD8zko0otrtNba8dLuKyQdePZqhJZqnu8cSVwT9aDOZBWAjVKJugIy5xfNqow3b285hZswZ/TfYaoMMOAIUUUOK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV3PR11MB8742.namprd11.prod.outlook.com
 (2603:10b6:408:212::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:06:49 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:06:49 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v6 02/10] tools/intel_hdcp: Rename variable c to
 connector
Thread-Topic: [PATCH i-g-t v6 02/10] tools/intel_hdcp: Rename variable c to
 connector
Thread-Index: AQHciUARFm8s0XscYkOject7p0qoEbVaYPHw
Date: Tue, 20 Jan 2026 03:06:49 +0000
Message-ID: <DM3PPF208195D8D234A700E891B067D73ADE389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
 <20260119123142.504623-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260119123142.504623-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV3PR11MB8742:EE_
x-ms-office365-filtering-correlation-id: 6f6c6645-0458-4e53-6819-08de57d0f42a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?KahDEICSuTSjLzZC7ByBEMxHgr9SDOHDjKU/gINCMpQY1nseni0KLfpbkGHY?=
 =?us-ascii?Q?uRxRFtS/BxtNNonw4JfDRFClusYM1pe7HAFceDXbLT9LFXUmh3+5xy1wnJ+4?=
 =?us-ascii?Q?8fpBHF9Ldnwu2vsEuNPGmqDCnCAT2eDMODDyR7n29w9yTH5jYw06+6puAWrN?=
 =?us-ascii?Q?lJzb8E6lrtCMRYXOg+dqZni2F0Wv0Q7DkIV+Un6+iDKW/x6wcDzwtvpTIOYA?=
 =?us-ascii?Q?7yX8kaxpPIdCp2vPwgwrp93ucxHi8aimRmUSakgrZXqm41Bty7XI7yNHEkOx?=
 =?us-ascii?Q?YyYNUT7DHqTiwcqJLOIijEaqhF922opSl5E/SV1LwjdEwLJKsc9OVc3k8c3k?=
 =?us-ascii?Q?WmhdmO3dqr0CyQsXBoh4KKSVhYxVrn0TvSY6Es4ZCmZ62wYce+6Q+L7D+8N1?=
 =?us-ascii?Q?eRGmPB4XWIL0hFKxQKNXDhaLV6gaFwhkBwOmFigfvwlXBYt+Mvt/04Z4sTKK?=
 =?us-ascii?Q?bEvchOCCeJ1j8FhM7JxdDhyg5OszJC/jfKQQP/b9gM/tm48JACMT2V1hpDkG?=
 =?us-ascii?Q?i3TlhUJ0ui49XW5BHeH6wSSFh5vEVzNgETKYe5GZG7Dfr//G1EljLsG5uMz/?=
 =?us-ascii?Q?mQ8s1w/9VJz+fm+uBj3clYGOMw+aoX5u/RXJMwW9AWAwfHiNzuD1Mt6X6AbO?=
 =?us-ascii?Q?SGdtJXK7YrP9AZYV3CGjKgeLj47Wg+dG3MqjFyrm048i05Ja8F96kaMafzjD?=
 =?us-ascii?Q?/E+3+N54QgxYApyesV1pElIORowx/rNiDK/IHB4Yxhouf/fK+X6QkrQavt7r?=
 =?us-ascii?Q?h0wl3Hva7Rscl4i8VJlbEnDxO88WtlCR+TeFVYLkCq8ZV0ACMOAHeSgYxH6+?=
 =?us-ascii?Q?oeNIuNRKP+LtWL01qJuP3ZP67LT3mg9y5Nql5NMDUKxjUDsXmrDIzfIBl9tE?=
 =?us-ascii?Q?kIZIYbl1EAZrHAMgYOb/+mwqdy7aAZ0GKTjFuKiXVcdMa7qXst5weWiTWQtD?=
 =?us-ascii?Q?y1wsXxbW8Z6XtpZDqiEV2qkiB3Otjdwl/w+QSjaTEOHly48RjxtusYzItIjJ?=
 =?us-ascii?Q?U3B5uLDLOOKEAbX3iWflO2/+oeUWLwLwamvVrKIwPDFCe61uYM6B+jAYecEB?=
 =?us-ascii?Q?zgk9kRdlkTre/i81Y5CbKp83KZaeNDcibI+xi97NAUb4W93Uo4fUreZpU3Mz?=
 =?us-ascii?Q?HdwMiAYZEMBdDpaDCx0m9sF6AIbcZRFzlTFK1MRxW8ll37iGGTdyySnG2rqm?=
 =?us-ascii?Q?YTrHQEFVf7J1mHjorHmdAiVvM+r7UU5qruEmrsLW6mV4hsSPC4o/qFT0VY8A?=
 =?us-ascii?Q?7af9Em8ifddwllCDdmJFCqqCgipyRkQh14eeTz+K+kQjL3jgkCp/Gv5s4zX/?=
 =?us-ascii?Q?uDtLxcodEfsXq6VzplA1O1hJeQgy7RJb87coMAm+5e7ImIcrtKvzIJMDB15f?=
 =?us-ascii?Q?7R0VADVSafmkGQeOKm18yJKa9lJtjX2kgthfuzTVn2iAMgcvxMk8MBDbwpT2?=
 =?us-ascii?Q?8t1altyxI21PP9pzZQqw9ilr7WAZtoP6UuMfqmfdEZ4ZCovQsdHnw7WNnpmK?=
 =?us-ascii?Q?KL5gqjOUhT44Nnt+Qhnll0gZQDJ7OiXEpmy3e7Vjyk8fLFmZoWUWO7A78OLD?=
 =?us-ascii?Q?MS4KF5W43gbloUv0I6/SwUJqEie8kod2KuVYHAHaLmTHMP/llqwNuJYYZZ1g?=
 =?us-ascii?Q?bJg/BuQFqJRAv1vMxCi3rpE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4lv2sylFawVA7TlBpR+uh4QssISI5MhVJIaduoDsT7qiDTKDADzpvuXd8HYi?=
 =?us-ascii?Q?FfYgsKxQgay/+Kp4X06etNZjh6NzIwBphe3bioqlV77684h/EBDElv/tfDFu?=
 =?us-ascii?Q?UjcwAJMdFs2jeYeEqkzN7uslGDSEbkLE0hVOlzgrcYKq8E0EJrB0bUD5CyUH?=
 =?us-ascii?Q?FSKHhxshMWqyayhh4HHJL8Q4vacCUGlG6T4rzNeml70Nr1e+7CiL2yaiM8hH?=
 =?us-ascii?Q?rFptr+uOyp5WfR+ZWvefRdp0mkuTVfv5VifX6B8dUKVimk/r/7/lRcztkxs+?=
 =?us-ascii?Q?t9poKBhs+ll4vDVPKRhOI+GTpPxcdIlyPtQxJWKkH3ZXyssE8FB4UgAiarR8?=
 =?us-ascii?Q?eOJnU7UT6NLNAN2lqh4yAc3gW4/TVcJOGRMKQGkCyKQ2DAWQuJ5NZRa8y8wl?=
 =?us-ascii?Q?hhHnZsK0+T9zLrD3QsPBBxkFuMrmZxz/tsgmrgv5zkhjM/0PRSASWLMAlV/z?=
 =?us-ascii?Q?nuBmT2yAuPznvksI+GPeBzB8MCLUW+tQiIIyrLrgInooCW2kjSLYVvjnkx1g?=
 =?us-ascii?Q?1KuQNN6oAALm0ApSqr9INmfSpZN3ie9EYgedGvX4bI5i4RfZDRrXpdcDE0jx?=
 =?us-ascii?Q?Z4m+yGDiGLCWB/H5AVmAWmBt/gc03PHHBvTiJXbJkOHujxcHeAzE2rF98BRb?=
 =?us-ascii?Q?Kwa0t99JbulQtIWvhDVOuDNT5RK1zkqIOkfVeor7SaG7TbPayRtdv9JqerBa?=
 =?us-ascii?Q?w5T3b9fFzAXLUcum/1o6mFnJinqx1vge+WA1LHANKeo1GpPfErK6N0UdQDDB?=
 =?us-ascii?Q?kfU518nWOSHSuZrmuufOYEm6zkVJg9NnWRwfT6SrXMb75CEBjOl+7Y2cnXBH?=
 =?us-ascii?Q?HM5O0FsRgm3wxBVmOKTgg9yG/0G24bOJhpDAojIrpJlPbZpDUSYFnzzuXaWf?=
 =?us-ascii?Q?SD8j4va91tC/Z0+P05KIpU0FxbZaZWg3IYspb4VLKJclpWXOzZZLC//8dZb4?=
 =?us-ascii?Q?M9BIFdlcHWMvuoXvHvMtiCpkWsYtO22yELjCUTuilymUgs8L805X3oH+kobc?=
 =?us-ascii?Q?S/mLsNeoHChR+mVu7Al5zqWMYIeluDP5ybnodr5ypK7v02SLBarrE7k3Gq90?=
 =?us-ascii?Q?t6ZzBoEAujta8rkiJYxG0ArSDMie+9SHeDYA82Xe4Jbrp5Gn2tPeudgWDXgh?=
 =?us-ascii?Q?VJy+HiT1OKX7wO0YmQsgfIj1NqiRgDUnzsD/3B7eIynLHVFR/EeUl4wKDe78?=
 =?us-ascii?Q?4yZUI+OTJ1ifzPiF1ptCYGHL3Wbf0KYSOlXNjNI//0Zb9un12Nnll3IGXtJe?=
 =?us-ascii?Q?1gy4jWzQG8g3WEuoT4fR2koX01+nOBEom7MGekDwRfcBIuhI0lNjzMutCnXz?=
 =?us-ascii?Q?mojgdaJpAq5leqFK1mjw0g5dOHhHSh5L/OdZrvYTH+qCpi55oxluOEyXi0MQ?=
 =?us-ascii?Q?KzzrRaVi6/2D/6UtX499iYWnezkD/ocxM3nmf/lIE8Y1oZSzmAzNIRD0Cz5W?=
 =?us-ascii?Q?9iqi8tmG9ys/3omYKHsgjAyXU5Y0pUEU4j8DHQCmFjyzhPGen6cYFMdkB634?=
 =?us-ascii?Q?MZqYCpZQV21GV+R0C4wLAXq7fFotAmkw+2U9CpeRdr8x/2WFS+pBnyyjtMOq?=
 =?us-ascii?Q?c8T8V2+dKc3dWB6d0itpk9hYb90VSluGg3WOFtxTXJG87k0uPK45eWFC2mnL?=
 =?us-ascii?Q?jCvnhZLMV83Cbdd0p4Of+t2NO4kJtMZDqiaXIy1ZMX5WKbfJQehnM+dpQP7G?=
 =?us-ascii?Q?ROnmdhAoaIbOuoK+YX46hPGtIZAJvoJfS2U2k/pKhfBH9VlHp110ezukZ/3o?=
 =?us-ascii?Q?dJCVdNwARg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6c6645-0458-4e53-6819-08de57d0f42a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 03:06:49.3997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ifWvOoVPEVxWUIBlFLKueoiqpGmjGPxHjKnOB8HBMRmQYcWBsry58mIAC/7MBiPegOPb42zipi4NViV7vE03uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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

> Subject: [PATCH i-g-t v6 02/10] tools/intel_hdcp: Rename variable c to
> connector
>=20
> Replace variable name c with 'connector' in get_hdcp_info() to improve co=
de
> readability.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tools/intel_hdcp.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index ae2520b03..6ca=
067b41
> 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -71,24 +71,24 @@ static void get_hdcp_info(data_t *data)
>  	fprintf(stderr, "Connectors:\n");
>  	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
>  	for (int i =3D 0; i < res->count_connectors; i++) {
> -		drmModeConnector *c;
> +		drmModeConnector *connector;
>=20
> -		c =3D drmModeGetConnectorCurrent(data->fd, res-
> >connectors[i]);
> +		connector =3D drmModeGetConnectorCurrent(data->fd, res-
> >connectors[i]);
>=20
> -		if (!c)
> +		if (!connector)
>  			continue;
>=20
>  		asprintf(&output_name, "%s-%d",
> -			 kmstest_connector_type_str(c->connector_type),
> -			 c->connector_type_id);
> +			 kmstest_connector_type_str(connector-
> >connector_type),
> +			 connector->connector_type_id);
>=20
>  		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
> -			c->connector_id, c->encoder_id,
> -			kmstest_connector_status_str(c->connection),
> -			kmstest_connector_type_str(c->connector_type),
> +			connector->connector_id, connector->encoder_id,
> +			kmstest_connector_status_str(connector-
> >connection),
> +			kmstest_connector_type_str(connector-
> >connector_type),
>  			get_hdcp_version(data->fd, output_name));
>=20
> -		drmModeFreeConnector(c);
> +		drmModeFreeConnector(connector);
>  	}
>=20
>  	drmModeFreeResources(res);
> --
> 2.34.1

