Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B05CA1016
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 06:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF5A10E08A;
	Thu, 11 Sep 2025 06:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0xbnvVL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497CE10E08A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 06:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757573393; x=1789109393;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Ai1BjLNcuJ5avNE+0Mc1RecRKzVK6gFNnYj/x66PT4=;
 b=K0xbnvVLr+GIji4fVWK1QVqTK7FlugmuNQPWwkJemjSEmxVMANgOiOKr
 9fRwOJDAXyOUCfNWSHNzhYjNzjoOpBz05XXvFbsJUkkEsBqjTSxbfS/W4
 DjPlk2gSFqwiN3hI8Dt4HXtKogBUFBNcrHQSPBCdIzv9MMZHXqTestbw8
 n2EBke8JHGEM4kRXfr+vOMhkd7ePJfmR+nbCEOdMwYFzYmqBGnWKSS1N6
 olCxyCoMCpLQEvT77KVR36/93vuH0grwXMTmAA5nZl8eE6Aq6V3Biw/Dp
 YzEDTPPwmOtcth0KbT6UJ0Dj00lrw5afPaKUsPLQ2tf0JqPdCgn1VcmSm w==;
X-CSE-ConnectionGUID: 4dL2C/1mSKSnOoW5Khc8rw==
X-CSE-MsgGUID: wUikrzhPSKmbid0OXNaGPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59814792"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59814792"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:49:47 -0700
X-CSE-ConnectionGUID: IMZkXwGRTC+nVi35qZ5zwg==
X-CSE-MsgGUID: 1brwPczNSIuGW7E9/pw+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="177912534"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:49:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 23:49:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 23:49:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.68)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 23:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS07Qf1kVpSWKgmGMk4gJ2+xhcSyseGNrRxSqmJVIsr6B+sXt0iKKsJa8FoaZLsjuoajfQZ18Fy2EK8chWAyTUrmranq0lx2a4/ThhIwAVOhDVT03JKICwp4ifBZ9aHDNZwhvxW7fIJ0vveGwDfDvovW5vBltRvU+1G6060J08JKgXPdF2Jmcg2SIRWcM/Wb/aruooE9F4Fo0c1yrXAVvwkoyO2uN8bmlhOK119N3cOEQ0dFEygBO8t5C/EgsbtkTvODmu6f8UUUfiZQ9buEoV3L5pGMpzw5qvtsBo45JVgi4HyXg7qw9D03uAXw23+ZmV4o1iyVgGQf/SdmOA59iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVeCx0XyUzEbvyalK9TchddGCwmzC0SQM4HZq1fIXOU=;
 b=fV28VEEMOmxRcp2oORopNjv+ylrmspgylLF8ghHKfGEY3ylDTSJq7ajGeBPwmHOWLK+kSrA2PIrC0FM9/EQIgb3Fb4Bgv8GKy4m4zZTiaRN+nH05afCXn8g6+Rx48KLOEokA1bJ96wGATvsJGSTWemWo+TgKukcOBeSv0zbXdcaZ3zH9VAtnFWUD4LvHOWF8QmeITKkACN0ifguyo8CTxj2xkADVP5CMzjduqkPNyg5jsNOmhp86RDuusht9IO6R65wIec0FOzzNfAZJmURZqe8lrMGqZXid7bNi3CCv/r2QE6dPOtETaAAjTz7238owiytf8bJAR+5Rv6+egAwGQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 06:49:42 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 06:49:42 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>, "Thomas, Sobin" <sobin.thomas@intel.com>
Subject: RE: [PATCH v3 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Thread-Topic: [PATCH v3 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Thread-Index: AQHcInc32mD5QfxiNESuPDgWV9QjL7SNieyw
Date: Thu, 11 Sep 2025 06:49:41 +0000
Message-ID: <CH3PR11MB843412041E1150999B18C36A8D09A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250910171959.1852534-1-sobin.thomas@intel.com>
 <20250910171959.1852534-2-sobin.thomas@intel.com>
In-Reply-To: <20250910171959.1852534-2-sobin.thomas@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CYXPR11MB8730:EE_
x-ms-office365-filtering-correlation-id: 0a2952a7-f518-4d3d-f5ed-08ddf0ff62b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?stWT5yJOPBIiUkp7Ifz+r7k4WRZFx4J1apsi7NsVuPd+8to3sa5kReOFVU6s?=
 =?us-ascii?Q?h8EM3vMN6p75WIA4HKV0svke0JOu4nFbb/+gEfN6J3ebjsc7JM8VNC013Tyw?=
 =?us-ascii?Q?LTNBMg3EVO57UtvE0k6+72AhPyvGaStAhEIqXx5qLU6OM+jwdnBJUw8CuS0v?=
 =?us-ascii?Q?beEs/bDc910XiS/FWi1XqODvENStiwRB7f1F52Nrot6Jyvl0OLn2inl2olxY?=
 =?us-ascii?Q?2AWfq/IoYLYcXg9i3UeG+BHlXT44CxZOy4G1ibdYtGxnbUt0LKw/w7yKvmuu?=
 =?us-ascii?Q?fVRIvlrjn0K/yZh/ddFFLxKsfxHemR9IqrZ/Gp5hejxbsaHPzR5jJyP0NKup?=
 =?us-ascii?Q?9n0Sy3VdLav6dx9HBWUhWEWm/UJSRNJybtZVsWl3X3Qk4poMqSJsrAd3VwNR?=
 =?us-ascii?Q?s9ZKKutE/gi5IqMm4AX+JE8r7/iI+asyB4Ip5qVwi7TsB5z4/mNOJGeTr97J?=
 =?us-ascii?Q?+FRe0nVmBJgNUXSOuXM36QXi4VPHWG0cA6O23o9vyPBf7bR5Daf0Bt8B/C5N?=
 =?us-ascii?Q?ukdVZ3OQHv7bwVsbKjVGWndMGQwmE0Px3jXpOuKzRb/V6yUzcGMTJWF3rywJ?=
 =?us-ascii?Q?DmiJnzp36DidrcvaI0ElOnWmHlCwi7iLXwZzDUdqq6HX1GtPpqPu3Xp+8FAl?=
 =?us-ascii?Q?U1XDHv4p6DLrYjRECwvR/3SOPDr85a7hmQGQbWn1LwpidPmlEiUmr1mY7rLp?=
 =?us-ascii?Q?UNtA6eK5jmkwZQQ2iVoOy2wcOQpaWY+Quj6JKRTYjLJZDspYdQFGIF+RVV95?=
 =?us-ascii?Q?lZ+GvoKrykGC7y8CeIWtOrZ48M8FlxLpQS9OcwlaXlKuypouNi7z9/WqOBPv?=
 =?us-ascii?Q?gZKxY0+4dCRBASsWnEdgLtIq0O8vIyRIbdbu5vaq5JIWuHK7ZgHL92bMBUmd?=
 =?us-ascii?Q?dlU04KG0qWGAC0vjFZZViByDggPvEmxkl7W0N3Oucto5dE4mu7+IWvjINnL6?=
 =?us-ascii?Q?0RjAunLQCQibjEvxF8MfY/5ypjdNQNVs8WCbc5KUtA2mU99pUncp6LsdY6yw?=
 =?us-ascii?Q?JR3VIzAEM4mTYdeCb3QuGIjdmwFEvHIpljFtSysvPk2OXN+sRcsVuTVShSXD?=
 =?us-ascii?Q?MkQEpRo8k8+rWqY/l2tyMFZZbNrrqq0o1ge25DyoyDUls7iqTqVjUQynaO3M?=
 =?us-ascii?Q?k14paCsbsq+moo0rZafXZ4TsCnuLpe24YcPgPD/UAlR5C59ECnX7cJdp2uXb?=
 =?us-ascii?Q?r2I4WVBMn7Fi5i6+3wGeEPymERgG5NPi7qZwiYkelQJE8tVvphU+mTcIB8GK?=
 =?us-ascii?Q?ojdaTTzVeUDCT6JTM4Huyu7WswHr9K9HSlMFXVvRLxkPL+MtTKrKtuovxy7w?=
 =?us-ascii?Q?g9w6oSth47JUMmD6o+pBLaXCgTOPMWArv/zcBUTyL013AUpqB965N0Cw8oqN?=
 =?us-ascii?Q?f/gCWXFmhAOBnSR1iKz2sr1OE15tkmiiWEJKTRq2T3TSmYVlx42rxBTuPDG8?=
 =?us-ascii?Q?99sFuvT9t5FylbK/qkNbF7b9K4nmQ2q7scTrSE88kbTsuYvk+UN6iqh7YFFk?=
 =?us-ascii?Q?1BDWyn6sNtWikxc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ED6P5v4TYCXphaGtBfq2GrKdyMOexLqafmbMC5EUksEBZSWhgU+gFiv6XIqC?=
 =?us-ascii?Q?I7B3MTRtfgkaKXWS1hCfUp5E9Uzp78usP4oEnRUSeKLbxLP+rw47n+y7QqaN?=
 =?us-ascii?Q?aABfzFr6KANabqnNa4/GX2hWZ7VyGXvzcKEHcc0vtN7KfsRtuniqOv2C8M9D?=
 =?us-ascii?Q?s1FN+lwWTTdbef6UXEGHOn0kAbomcdfEYBg2IncfXJ3yThPZbuKN08vMBKUz?=
 =?us-ascii?Q?bpmobCsk+lE4obr2kWVQtk+lbIkF/aige9rrsYt5/KvatvSXeucB4Y0u2Kyn?=
 =?us-ascii?Q?ntQSSx+Fkvb6psXr2MhBUbSxd1XX5G+7nKxadj1l+wbCivGCnIz32nDWy73Z?=
 =?us-ascii?Q?ooxG2HI4C+OX3oGyKrpqRCJrPF1l3vC5+yYhps98Y2eOtu4CWlkYcUlZ8VwK?=
 =?us-ascii?Q?d9x9TVcwLIHBPDNM2OHKld1QU1j/j9EloRK0pdmbjPOMtvupuWNXRgs7ym9s?=
 =?us-ascii?Q?dI7qU93ojliImzaHJYgDb6ufzfJ6vSAVfgY/2X9RnaM3sDKtdMUdAidZCvSk?=
 =?us-ascii?Q?G3De1VWM3TUqRtUJEh9/NuMdZIvH9vz4rvqbw5VWQFrGoWumrcaWsKojjQQ9?=
 =?us-ascii?Q?HJ1HrwyWGVWtf3USNiX9zjZTSVfQoeuvUhrm1KU/WrhV10I4Kvmv+EjipmGr?=
 =?us-ascii?Q?1muIqiCMDrhHUJLNnj4p1dDo3jzSDMP2R46CQq+3UYY2S1tTTyNtrng4E5A2?=
 =?us-ascii?Q?2LYFciC8AqzPDSQzZlRv6A0Kstjp0M3MgbXedvmY+70pt/qDSX/i7GocW7tB?=
 =?us-ascii?Q?vMmz1xTVxKgttduW2kxokNdNbm4YZZrGLZWvHC0c1dcFwvuyvsyg4jgI9iN2?=
 =?us-ascii?Q?vEO94bX41oyf/8c0zP1ZhO2uxqxftgjupT+MhuyN9DY9eWd5FP/Csj5DSnIn?=
 =?us-ascii?Q?nEGGRraovLh9FFBlA837zug3O66Ia63+Vp5Fno69xMraC7WExt/29+Z/lLLq?=
 =?us-ascii?Q?G/8EPJeRjVE8kz/nTZXNJxrZ6gM+EDwQDMEvJgdwTTXcGogyFOANzMIxD1sX?=
 =?us-ascii?Q?kyfY9qr2Ja9Plx0DTcXYpix6PuT8mw4XWd4pxUM/Y+otWP2Diwi7uAgnv0nv?=
 =?us-ascii?Q?ay0vCTtH330UtitT8hIV+qPTgxFYa1nNSHab14TklyDvVEboE+lUkxo6pzlD?=
 =?us-ascii?Q?l7MiYawaDpFaXN9E01GJCeUWstgv2zZXFiBUJzdWAM87tn6pul3gU7a5Np8w?=
 =?us-ascii?Q?hU0Yx/FG94B9/z0fpfvdZelygA+rrUi99zTWav/w3waM0HwyMAdM9YwnGiRm?=
 =?us-ascii?Q?oCHW3tJ938k+CeceLAgnrxKGs13E86k9WlKcU+cfJKmwCn6pIci+eQ/67RCx?=
 =?us-ascii?Q?I+wQV9Wycn3orYuYrBHSo9yCv3ZIb+wIXKAy6WQpVVnX81O8X9yQxMOLrYqK?=
 =?us-ascii?Q?UvbTwZh+eUsa48QTAipDh7PdxRMmSqY9rDbB8/4hAgH7iL2ePa3GiVPRCGof?=
 =?us-ascii?Q?qL/NNPTN9HQB5/4qFM4bX6x86x9DU5LpPXpAVPSXQs3/m8Mda0h6byQ/bPXp?=
 =?us-ascii?Q?nFox5VB0lWbOLxE55twmLCghHNL7DyDpEUmi12qPjNke7BkhSDVORRjJYFsD?=
 =?us-ascii?Q?sSYLeGiHiHDG33uHoc++OxgA/xKbPZIMW0WWuXZ+8/qBBhIl9s/y9YGFxieD?=
 =?us-ascii?Q?Lw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2952a7-f518-4d3d-f5ed-08ddf0ff62b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 06:49:41.9567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3KQQEwqFI4ze+KQNmgKGBO5qr/86XcGxFAjY+sW7YUvADwPAaHwDRSBvVoqGGEEVa/Ir5X6Mt6bAHf15if6omi2QFwY8qrfC3L4OAF7feRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sobin
> Thomas
> Sent: 10 September 2025 10:50 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Konieczny,
> Kamil <kamil.konieczny@intel.com>; Thomas, Sobin
> <sobin.thomas@intel.com>
> Subject: [PATCH v3 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
> preemption check
>=20
> On platforms like PVC that lack walker mid-thread preemption, running tes=
ts
> in forked threads can cause inconsistent states due to mid- execution igt=
_skip
> calls. This patch adds a kernel preemption check at the start of each sub=
test to
> ensure consistent behavior. If the GPU lacks required preemption, the tes=
t is
> skipped gracefully.
>=20
> v2: Moved compatibility check to igt_fixture per review.
> v3: - Added thread group preemption and WMTP checks;
>     - Introduced enum flags for preemption types. [Zbigniew]
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
You are sending every version as new series but it should be sent as new ve=
rsion for same series. So that it would be easy to review. Please check tha=
t out.

> ---
>  lib/intel_compute.c              | 22 ++++++++++++++++++++++
>  lib/intel_compute.h              |  7 +++++++
>  tests/intel/xe_compute_preempt.c |  6 ++++++
>  3 files changed, 35 insertions(+)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> 147dd2916..7538c4b42 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2193,21 +2193,25 @@ static const struct {
>  			     bool threadgroup_preemption,
>  			     enum execenv_alloc_prefs alloc_prefs);
>  	uint32_t compat;
> +	enum xe_compute_preempt_type preempt_type;
>  } intel_compute_preempt_batches[] =3D {
>  	{
>  		.ip_ver =3D IP_VER(20, 01),
>  		.compute_exec =3D xe2lpg_compute_preempt_exec,
>  		.compat =3D COMPAT_DRIVER_XE,
> +		.preempt_type =3D PREEMPT_WMTP | PREEMPT_TGP,
>  	},
>  	{
>  		.ip_ver =3D IP_VER(20, 04),
>  		.compute_exec =3D xe2lpg_compute_preempt_exec,
>  		.compat =3D COMPAT_DRIVER_XE,
> +		.preempt_type =3D PREEMPT_WMTP | PREEMPT_TGP,
>  	},
>  	{
>  		.ip_ver =3D IP_VER(30, 00),
>  		.compute_exec =3D xe2lpg_compute_preempt_exec,
>  		.compat =3D COMPAT_DRIVER_XE,
> +		.preempt_type =3D PREEMPT_WMTP | PREEMPT_TGP,
>  	},
>  };
>=20
> @@ -2260,6 +2264,24 @@ static bool
> __run_intel_compute_kernel_preempt(int fd,
>=20
>  	return true;
>  }
> +
You haven't removed the below code in  __run_intel_compute_kernel_preempt w=
hich you made that change in previous version.
> +bool check_kernel_preempt(int fd, enum xe_compute_preempt_type
> +required_preempt) {
> +	unsigned int ip_ver =3D intel_graphics_ver(intel_get_drm_devid(fd));
> +	unsigned int batch;
> +
> +	for (batch =3D 0; batch < ARRAY_SIZE(intel_compute_preempt_batches);
> batch++)
> +		if (ip_ver =3D=3D intel_compute_preempt_batches[batch].ip_ver)
> +			break;
> +
Here there is no condition to check for ip version failure. If ip version i=
s not found then also it might return true. Please check that out.
> +	if (required_preempt &&
> +	    !(intel_compute_preempt_batches[batch].preempt_type &
> required_preempt)) {
> +		igt_info("Preemption type not supported %x",
> required_preempt);
> +		return false;
> +	}
> +	return true;
> +}
> +
>  /**
>   * run_intel_compute_kernel_preempt - runs compute kernels to
>   * exercise preemption scenario.
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h index
> 412791d07..b70cd7185 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -71,6 +71,11 @@ enum execenv_alloc_prefs {
>  	EXECENV_PREF_VRAM_IF_POSSIBLE,
>  };
>=20
> +enum xe_compute_preempt_type {
> +	PREEMPT_TGP  =3D 1 << 0,    /* ThreadGroup Preemption */
> +	PREEMPT_WMTP  =3D 1 << 1,  /* Walker Mid Thread Preemption */ };
> +
>  extern const struct intel_compute_kernels intel_compute_square_kernels[]=
;
>=20
>  bool run_intel_compute_kernel(int fd, struct user_execenv *user, @@ -81,=
4
> +86,6 @@ bool xe_run_intel_compute_kernel_on_engine(int fd, struct
> drm_xe_engine_class_in  bool run_intel_compute_kernel_preempt(int fd,
> struct drm_xe_engine_class_instance *eci,
>  				      bool threadgroup_preemption,
>  				      enum execenv_alloc_prefs alloc_prefs);
> +
> +bool check_kernel_preempt(int fd, enum xe_compute_preempt_type
> +required_preempt);
>  #endif	/* INTEL_COMPUTE_H */
> diff --git a/tests/intel/xe_compute_preempt.c
> b/tests/intel/xe_compute_preempt.c
> index c9b194869..a4c0bc59b 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -76,6 +76,7 @@ igt_main
>  	}
>=20
>  	igt_subtest_with_dynamic("compute-preempt") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -86,6 +87,7 @@ igt_main
>  	}
>=20
>  	igt_subtest_with_dynamic("compute-preempt-many") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -112,6 +114,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-all-ram") {
>  		igt_require(swap_mb > CONTEXT_MB * 10);
>=20
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -138,6 +141,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-vram") {
>  		igt_require(xe_has_vram(xe));
>=20
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -164,6 +168,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-vram-evict") {
>  		igt_require(xe_has_vram(xe));
>=20
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -188,6 +193,7 @@ igt_main
>  	}
>=20
>  	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_TGP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> --
> 2.34.1

