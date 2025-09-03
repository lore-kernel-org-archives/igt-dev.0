Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC55FCA100B
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 06:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699C210E12A;
	Wed,  3 Sep 2025 06:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9DuHNmU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20C810E12A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 06:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756880847; x=1788416847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IHch0HUw8kCSvOQ0A8waCx0NtZlkx35mzu1DH/ZX7gI=;
 b=a9DuHNmUSiAH7U2aA0kTHHNtIDW/4HfMEHQwN5EfQPlCLrOQT0HlXfPE
 2jyLQKmpjig1BAjqNq7/ZvVgW2Kk8GV5+BWXiLbcCJyVxKNlqn6iLY4cE
 HTTbUIkcfueG+uhVCgrLPjKFIq4+NNtkzHbYUwPDPucM3VUhmTGrJ4mQs
 eQJSfK9YbCqImpNRSJosBiVPYwt69tDsZnU2WP6+xUYdzagfNNNzdthly
 hVWgkcT6TT0RONnffJCSNdpRw3K56RF4d2cnDugA3VX7bqvOG0O50AHPM
 IkVJeS3pmvF9kj5E3qANnevOH6lZBSRgZqLK+lO8RL1tbaPJ6xOeXfYCS A==;
X-CSE-ConnectionGUID: odaJAlVcQRaSsWwnE1oJ0g==
X-CSE-MsgGUID: 0uE+5z9ETkOwxxRwuiPsnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58881038"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58881038"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:27:27 -0700
X-CSE-ConnectionGUID: T+vHnyhCRKiJVN7t1DnUrQ==
X-CSE-MsgGUID: oaA6JJ/pTfmfotxcgtOdOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="195137197"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:27:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 23:27:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 23:27:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 23:27:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7+u9q/ZX6HL1XKfs0JapItWTv/7vt4maesWMIQlaxDHdSXLTFdLER/uUX2b+bSBG0eh9KEeTCV03P65zRaR9x1roLAWCDgDbLFmwPKIqu/pr+JWby+WhPiEvpHZHaDLrYnvsTtcZstcGIpFQ5svNfyrLkpcLRCvwZ809hLPGgXJkIa/bLrnGb78+2LWkBRtKV0r0oLbzlG/AWYOIKmdHLUdCj4gMCCEGIYSPrufpurc7miHamsXuX65Avh2lUAObWV2w+0jnHlNOHCBRQozGupp9foIlcpJ+qZDo9vuKiYrLAV6qfeeEK8i4/V7yFBlrd+ogrnxp4nhGn0R4OOHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+3RGp+OPDIkuv5W5Tlx1A1z9vztYV6PcgoG5moMreY=;
 b=G259W+TNUuJz+/rSal2B2GXK73TDftf9QDDR3eE6umRcymLa4OQSAfioTIzI9r02kKG7jlTG5x3fVei02pCZj3AXaC22vDAps7BSmzSdErrE3t94WVAVP9A56Y4mhRN6QT31aMSsGAPOsLRowl4UKnaMXLSNv5qYenSuhELOMFkLEKliiKDKLl5STGcK9BogJ+UWmavp9yI+1LSkhsfMH3WYYGjmwoja/14U2KCkUVKd1ZwN9KfI7p3vqEsyo37BX46zf3wD/530k7HYhq5R9ql7Ar6UGA6z7ewurqUqUsFXB0R8tQEfbRL7sEZbSFq2sVlV9zMFj71EXExb6tWgLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 06:27:23 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 06:27:23 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>, "Thomas, Sobin" <sobin.thomas@intel.com>
Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_compute_preempt: GPU
 Compatibility check
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_compute_preempt: GPU
 Compatibility check
Thread-Index: AQHcHJik99r94KDZbUCkVbOhNqHWgbSA+6Sg
Date: Wed, 3 Sep 2025 06:27:22 +0000
Message-ID: <CH3PR11MB843417C6B0A33C9C764122C88D01A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250903060306.1516598-1-sobin.thomas@intel.com>
 <20250903060306.1516598-2-sobin.thomas@intel.com>
In-Reply-To: <20250903060306.1516598-2-sobin.thomas@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB6118:EE_
x-ms-office365-filtering-correlation-id: 58bc602e-eaba-4e78-d90d-08ddeab2f157
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rD9gaGwxOV8Mi6WH2lPTM4oGzsZe3hDKRmxBYlkOyHUFUkuvU42vBqDDtpOo?=
 =?us-ascii?Q?jJz2rnB8eMp1IvzpmEbjcEcFpyAGSsrYqaEVinXvj4EoIzZoeJRqP8ZE1VJK?=
 =?us-ascii?Q?tu1T/RG3QQ688bpPRiYyHJnv80QwgGe1UABMV5y7M+1sMITJMCBgZL6fH9np?=
 =?us-ascii?Q?wMJSWKUITzReQU0+/5ET5e19odMGG5KIpZpvTomcl0IMw2sPZSSx+fXKjV4S?=
 =?us-ascii?Q?8OGlRkz+6eKuDTt4VfsdrVQ4luE/B1E/eW+6m38eG6t88qfErdk2ETYjFsC5?=
 =?us-ascii?Q?K1xQ0rBZlva+DqEstyqjwVVtnNNz/Ovfnv9wJZozTW/UkavtpOMXwdur+Mj1?=
 =?us-ascii?Q?yzKQsvbPME/6sL0AJVIx2DOz1EF60rXMNkUi4EFmt7u79U28PCFLe8ZD05X7?=
 =?us-ascii?Q?qLFSlAHxfUiS/7dLmOL6zD3RZFZyOq3bnSenpUOyWwr8oigKyqAvRstav9VF?=
 =?us-ascii?Q?QoXUFXZx1Qw7/V7qHd+3prKtMNWW0w5AOxAcKqBPOP1drTcMzs8FhxikP/NI?=
 =?us-ascii?Q?CfcxsPbbXfmLZIXN06fYpb/Tfz1NQs7xiqytnpo7wyQ4oKr2s+drxlSFPoxU?=
 =?us-ascii?Q?wBFsGdU922XEXicTTFayUNJCozuKeAdK/mM/wm5IQCNMetZdSCClDIVQV1ef?=
 =?us-ascii?Q?V2OLg9ib3WfqQ04C6v9Qj2Ui+uWpRKPCgBcwkCrx6wD5iZzzY3Ce8XHCM36U?=
 =?us-ascii?Q?ssY9+T9Jumb1BgvjRPF8Tp2t7/ePuJvtfX8oHIrTb3OW+3Vo51BGKvfo/e2g?=
 =?us-ascii?Q?YPRSV433or1Ul+CGFbCWsK4otW5nTxO8mqVuhRWf+2KlJNnT67H4QT/HWtd8?=
 =?us-ascii?Q?3eAyaCAwwK9Y9OAIE5/0gzNSx2/IG/7HH3V/x95DkgM6pXTa08/icgS6zuca?=
 =?us-ascii?Q?S/LG/COEQe0jB81mVXo/yKt/Bma0e7DCeGVcO427+/GTDnF0QD2ixsmmyQde?=
 =?us-ascii?Q?/GQ8m1prdwhzyB48ecRPWBi5Ej4xrCBVSOOhfP9Z/6cl3RW7+uI+Igcd2sMY?=
 =?us-ascii?Q?+3pZPT/c2LWWYpnXSfNBgGo3egOaoKjjzTVLl4Zzllw0ZoBUERe91cY6z1pv?=
 =?us-ascii?Q?xgUW/OTwNOIJMkKTphm+jVeVrGBjqU5cYjtiN9a9A9RaNojCRfrYzf+mPASN?=
 =?us-ascii?Q?Z1ir2vzfKtplXTaKLNiTS/IuivsTg+iTMPOOvL9WrCh636aE9XQs9cPcTJU+?=
 =?us-ascii?Q?JLy7rtmJLaA9nMxAsGK3TqFmRfSHclAE26uMyhgGuEv4hrffoJL3uE0rSHg0?=
 =?us-ascii?Q?Qd9f1RlWxyLs2RNBN+gps2GwLglbsIceetbw51G/OuJuIMl7ICmpxgmWYU+I?=
 =?us-ascii?Q?QgtwdZU4gskvvns9EGGGvotwEIYIhluAzC8SJWZcUnZqHJaMZ+LBPpTKyD4j?=
 =?us-ascii?Q?DWQkZiygDVlx3mQbaAey0oA73UPtObeyIIwe3STw3X4Jvcwrs0TLidNMjxyr?=
 =?us-ascii?Q?njhYzb7wwbzZMeK5LpiP8TxdA081NReHokn9ANCIxku4t7W6kTcVwX25fpgW?=
 =?us-ascii?Q?yyS5q5qlPXzPIvk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wVYrgUzXOxV6cvJ4dmCtT2HXlYllAUYN7MStRsjWhoT+3bOnZHapaufbjGfE?=
 =?us-ascii?Q?D/YifgRCYFNkN+DbiiMKoYGyT55CKsvtxYlSSTxG9ZGeMUeLGuwmOWvMQrsM?=
 =?us-ascii?Q?dngiyqHGk8jXgDl9wYTov1Zn9ym0NHW51TEYeLkRCUHCkHvsEx5qJpZEXTiw?=
 =?us-ascii?Q?TBsQ1gaA2mwLcb7S441s4tjDpDaFJ/dvdNjzYZbkFE+I1T7XfqbEg/2oKtW2?=
 =?us-ascii?Q?SzpNkXNsNpeconuOgCfvQ4zIwjWrFaVM6QGOgU7kpKohh93MVosdyqIa7f0k?=
 =?us-ascii?Q?kgqP2v4oVwuV3f6OqQmRXoEamGlF+Jest3KqrIq91qjkHLB0REEE1rszM7lN?=
 =?us-ascii?Q?agqtN4Fo7afOtfF7oDYoDg81fCWivDiHLVxpSAYGTp7y/Nu/AJODDz5Z+Mwo?=
 =?us-ascii?Q?3mC8VzPH+ezI4i7XVPJ4eIcR+okIgeFfcuYiicZwy1v1uGKGMkgjg7KYav2A?=
 =?us-ascii?Q?uCQPi2PVXvqWzREdJmEDykkmNhNEhpmcNtncsyBJPE7Q1AU//M3QUXe5/JuM?=
 =?us-ascii?Q?lN7iRqSyv4wlJ/Cn4VB4H+a3rOLr1Q8eVYI0+1n7LEaKLNAlzXhIEzC4G78C?=
 =?us-ascii?Q?hCp9PcTPXq/ISuoOaqSIDxmHEaRiHpuBupxufD7lqOztO/oQs77MUZFdS3sV?=
 =?us-ascii?Q?xorDs8LgWbO6zbFbtOkacbmoRCiYzXo37dekPsiuNpbGJ805HbB013xhXon2?=
 =?us-ascii?Q?uGgqF5qos1fPD3oZBwepMv3ABy0PxmX1C7Odb9v6Og5BPFatIEZnGxQd8o9s?=
 =?us-ascii?Q?mRpUC3xHe+0VlfzI2ZBK932Nba+ueyqsUrgTlRIxwEJ01C25HPEmgzXUWZ0U?=
 =?us-ascii?Q?Htyhyat2bixNRRD+mZpI5/ZjSjGpn2UiIQGmJmIFu4X2bMScf5esVQEP8Cas?=
 =?us-ascii?Q?wOiXSzpFavS1TQfT2CExnzQp6MuZ/LSShkKOVDs5UlhwGk4hsEBOITyUTck2?=
 =?us-ascii?Q?DvROYRHmS14SZwzyYweZ78gmIeSlFYR2CIw0WNqrH5k4PNBxULohUk+pUkCm?=
 =?us-ascii?Q?Mo2MUiHbQNa5luUGHGya+Xn6ec5qHbH1FJ3LOtYm23y2Tm9WJgQ9ejwM2XG5?=
 =?us-ascii?Q?Wgl/F7uubZpYJScWXhPJ1wge1UlBg34RSzAAA+Idj80ojmrb3X/OoZ0p3YLm?=
 =?us-ascii?Q?jBoSNFdCQb8d6fkHU+j8xWMir3F9jvbLgi56TkKEbQ9M5NQTUZhzwsel1WLX?=
 =?us-ascii?Q?i727HkKi2GhyZ8MwGvRTfSVE++0UUOUkoytq8wyrzeyEmli8LnHiBP0W7TQB?=
 =?us-ascii?Q?pCGjG+WW1YfzGRWO1OLMtU+Uh4/6uhYd36rpGmZH0+ui07080RgJ+xxN1iYj?=
 =?us-ascii?Q?1Xfvkoa0QiP2ODar8sMJ/zLipBl9iXvBqR9Q+GhG2krxH457hzSq4fXXCqqL?=
 =?us-ascii?Q?ykFLDuY1H07jfRkCSp/bJPIdZo5dgV7/LvJiQCrAKN2Z+A5OK1dxKIohKbfR?=
 =?us-ascii?Q?RV4G9jP1t/Uk39br/KsZZNwBKqB2jfoVXUBdYYRAP9a5RIV0SVg25uptNLsb?=
 =?us-ascii?Q?GSF2wh16EFW9DorstgGd5HImVUxfJkZV+CPvstzyAZKuUTkJ9MNLcbx5RCrW?=
 =?us-ascii?Q?x3ePIJanhxvpOunDZoMzLL24rXhTRFAUkE50Fh8dMiDkPH9oVI3UFcugyeli?=
 =?us-ascii?Q?Sw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bc602e-eaba-4e78-d90d-08ddeab2f157
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 06:27:23.0282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AURUJh1di4dERjg/cwdSvPCHcJlsk8OOPB+Rp51XMsUY801vGfBC3poE7adwtTFdZdxXIpDM0yi1m8u5n3RITiRpnuBWO8Gc8dlmyj8h0u8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
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
> Sent: 03 September 2025 11:33 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Konieczny,
> Kamil <kamil.konieczny@intel.com>; Thomas, Sobin
> <sobin.thomas@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/intel/xe_compute_preempt: GPU Compatibil=
ity
> check
>=20
> Add a check to verify the GPU version prior to launching the
> xe_compute_preempt test. This prevents the unnecessary forking of multipl=
e
> child processes that would later be skipped due to a GPU version mismatch=
.
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  lib/intel_compute.c              | 25 +++++++++++++++++++++++++
>  lib/intel_compute.h              |  1 +
>  tests/intel/xe_compute_preempt.c |  4 ++++
>  3 files changed, 30 insertions(+)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> 147dd2916..d8627c78b 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2211,6 +2211,31 @@ static const struct {
>  	},
>  };
>=20
> +bool check_gpu_compatibility(int fd)
> +{
> +	unsigned int ip_ver =3D intel_graphics_ver(intel_get_drm_devid(fd));
> +	unsigned int batch;
> +	enum intel_driver driver =3D get_intel_driver(fd);
> +
> +	for (batch =3D 0; batch < ARRAY_SIZE(intel_compute_preempt_batches);
> batch++)
> +		if (ip_ver =3D=3D intel_compute_preempt_batches[batch].ip_ver)
> +			break;
> +
> +	if (batch =3D=3D ARRAY_SIZE(intel_compute_preempt_batches)) {
> +		igt_debug("GPU version 0x%x not supported\n", ip_ver);
> +		return false;
> +	}
> +
> +	if (!(COMPAT_DRIVER_FLAG(driver) &
> intel_compute_preempt_batches[batch].compat)) {
> +		igt_debug("Driver is not supported: flags %x & %x\n",
> +			COMPAT_DRIVER_FLAG(driver),
> +			intel_compute_preempt_batches[batch].compat);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static bool __run_intel_compute_kernel_preempt(int fd,
>  		struct drm_xe_engine_class_instance *eci,
>  		bool threadgroup_preemption,
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h index
> 412791d07..6c8414c56 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -78,6 +78,7 @@ bool run_intel_compute_kernel(int fd, struct
> user_execenv *user,  bool xe_run_intel_compute_kernel_on_engine(int fd,
> struct drm_xe_engine_class_instance *eci,
>  					   struct user_execenv *user,
>  					   enum execenv_alloc_prefs
> alloc_prefs);
> +bool check_gpu_compatibility(int fd);
>  bool run_intel_compute_kernel_preempt(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				      bool threadgroup_preemption,
>  				      enum execenv_alloc_prefs alloc_prefs);
> diff --git a/tests/intel/xe_compute_preempt.c
> b/tests/intel/xe_compute_preempt.c
> index c9b194869..65ad5d4d5 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -98,6 +98,7 @@ igt_main
>  				 * CONTEXT_MB * 2 (long and short) job
>  				 */
>  				child_count =3D ram_mb / 2 / CONTEXT_MB / 2;
> +				igt_require_f(check_gpu_compatibility(xe),
> "GPU not supported\n");
>=20
>  				igt_debug("RAM: %" PRIu64 ", child count:
> %d\n",
>  					  ram_mb, child_count);
> @@ -118,6 +119,7 @@ igt_main
>=20
>  			igt_dynamic_f("engine-%s",
> xe_engine_class_string(hwe->engine_class)) {
>  				int child_count;
> +				igt_require_f(check_gpu_compatibility(xe),
> "GPU not supported\n");
Though this require would help to skip before the fork, but it is like dupl=
ication of the existing code present in __run_intel_compute_kernel_preempt,=
 which again gets executed if this require is successful. Make sure there i=
s no duplication of code. Try to make this common across all of the tests. =
If that can be done this require also can be added as part of igt_fixture w=
hich would be common to all tests.
>=20
>  				/*
>  				 * Get whole ram, then divide by
> @@ -153,6 +155,7 @@ igt_main
>=20
>  				igt_debug("VRAM: %" PRIu64 ", child count:
> %d\n",
>  					  vram_mb, child_count);
> +				igt_require_f(check_gpu_compatibility(xe),
> "GPU not supported\n");
>=20
>  				igt_fork(child, child_count)
>  					test_compute_preempt(xe, hwe, false,
> EXECENV_PREF_VRAM); @@ -179,6 +182,7 @@ igt_main
>=20
>  				igt_debug("VRAM: %" PRIu64 ", child count:
> %d\n",
>  					  vram_mb, child_count);
> +				igt_require_f(check_gpu_compatibility(xe),
> "GPU not supported\n");
>=20
>  				igt_fork(child, child_count)
>  					test_compute_preempt(xe, hwe, false,
> EXECENV_PREF_VRAM);
> --
> 2.34.1

