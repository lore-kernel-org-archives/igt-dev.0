Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA406CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 08:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881F510E594;
	Tue, 23 Sep 2025 08:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoJFGymi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931E610E594
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 08:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758616360; x=1790152360;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v/CYadfjDwocM0abFCftNh8ns1dENRZ29snfRvPuUWE=;
 b=GoJFGymiIFF50GkuUsCUBgqozSnpPVEiarM6q4ndekNOdeK4ObRmFxAQ
 nOytfe1rqN9zInf39YH2iLYe3hJE1GAcHhda8szLaVC/twMfnIv7EuyYM
 BV0AupYzFF+tikr7nB2LqvXXEsQ+WY6fQCO7OmMJR7rsUZw/fNdw1ceqD
 k+oH0AVa3Lu6ynrlJznGfPKYUOaMP836KX+2gDfIf7vtagpODaH8B8f7H
 aF1gDXk/OUDy2itxiOe0KJYB14ujQ4SsVskdwHQI095Q/c+O5WQsFq7mQ
 QEI0aZz+BSGpOoCaGNrjAJnvmnf+0oNVDLwhLZpnN80UYRfV2Z/MfA8SA w==;
X-CSE-ConnectionGUID: dqPAS9WZQWag9YnvT45m8A==
X-CSE-MsgGUID: T+B3tObTQXan5Dmr0oAKAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72249494"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="72249494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 01:32:40 -0700
X-CSE-ConnectionGUID: 4mIe4wqQQty43urRZOKNgA==
X-CSE-MsgGUID: DY+kzAtEQm6nDZuOovcWqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="207462278"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 01:32:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 01:32:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 01:32:39 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 01:32:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDLHrRRZg9RjDuVgzXYQE4G++UFZ3vT4qDO04z6UER37h0BC7KUGvEd0P3vS3pQyQPvMO/YDjkuDMeUD5mBZztpGPrjXmMLJrbIc8mglZx/+8xpDEQVVIcHdF3kKc94R+JGcplredpROrpZFrQ6KWi+OqypnVamR8/zB0p3rGTFw0n7IAZbQ/hPTGKjX08D45LTK8urxmNhpshYb/0sKMkMb/AVr/qiEwSjA6xYJlpW+BqGjtgJEeafRnLO1rXGiunlahL0uoEIWV/lvaafIcl6MsCmTg/ePYQbv+JZYg53Gc/bl7wUAqkh6bULDtDJp/JC5nPoy3W8FsI83HRFmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGX/x0EIs+uDNTCqRweddpkTnslGXGJBoWPQc8jR09U=;
 b=cH4fmidPZuynJcFUEW38as63z8drinU8wDW3qE7HTt/SkB5sNDt9qpMfWROwfROPFXwgiSLumMdQ+otjFr5gZabVHw+f+ukxBNdVuJczSLZ9N03GnWcy/QLFcz6+rZqj+GxF4J5dPekkr9pzsi7fIosanrPcIu1eQ2ZzRPkBQawsFcUJedL/akyIsSV3vejWeVPtbbEVi1gvL35yqcLX0eVwKUW2oBNduBjZ07WuIoPUXN+fYcmbrBFEZMS4s41rXHUukSuSNbV+66tirRX2CyhvH4GpVT+Ngjim9Q9mNPWYc68VKyCE2CwVm5qlMp5GuFSms4G981RFIaZkfokQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 23 Sep
 2025 08:32:36 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9137.012; Tue, 23 Sep 2025
 08:32:36 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7
 residency
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7
 residency
Thread-Index: AQHcJtL4qvv58sfwUU+gcl6xTOr+2LSgeG4Q
Date: Tue, 23 Sep 2025 08:32:36 +0000
Message-ID: <DM4PR11MB6312650124CF03C419D8F03C901DA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250916062411.23433-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250916062411.23433-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB7147:EE_
x-ms-office365-filtering-correlation-id: 4537430e-1907-43f0-451c-08ddfa7bbfe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Hyl5kl7Y4ufbLwceEX1zC85tm2xX3zbP+jY32qRNnycZ6BTQZo/dlD/zvHH8?=
 =?us-ascii?Q?upIeu01028YN7jvI5qLvbgXlFaduITuq79GJfqbiidxxTJLuzpYik3KOhDkd?=
 =?us-ascii?Q?do9RD59ZUkI/jzwmsfePrWthz9ZDB63JpJUuS3g3u4KaqdC7Zp09EWWgHG1o?=
 =?us-ascii?Q?L3sFT08BQFllhJW2jZ3u3BjUjOP8j6G1k0g31za5esWFvK2bFozHTHYrdlDL?=
 =?us-ascii?Q?SdgHkTKKnJUJI8LHOxayUBtfirGvoK2ihCLgVfkzkinInvrXn2mx29PLX/Bn?=
 =?us-ascii?Q?h+WG5aSqzQF4xNdZxXa0QKgr31h1SD8Nj91NjNXnCODQYgIV0XFLUENlMVxm?=
 =?us-ascii?Q?f0Igf/ndlu+fdz9BD47PlJUmnUJZn80eZ4dpb/MoWQ82fMnc/j7X4VEXMP4T?=
 =?us-ascii?Q?r11CdgPTc5qEcuJzHDQTuVKWK1QKv+6pZYgwrN+y9s73nRCnaHt2HBLepir/?=
 =?us-ascii?Q?9EPxxnwNBvZqrKm/qvzlokanyPxzHYu5li+SzZA4ZLMC/nDOjQMEal4xe+RQ?=
 =?us-ascii?Q?P/1tUgZSW9LIisDf4kEmV4W7B5B4Docj7RTJQ1UjGPbL4ac+pyBpRZICo/eC?=
 =?us-ascii?Q?S5mVykPjF7ZWPaLUU6y+HHfLlQJGatd1VtweTVFOkwq0Eu0Ows2Dg/1Emf6n?=
 =?us-ascii?Q?m5FyZ4O/00Z5zrree7lwStH5vXU0kVj3G2NZ/Em7m0R80e5Nm2qzObTzY/81?=
 =?us-ascii?Q?e6+ooedlLf1f8thEhzRB9PZepL1BRZO+T/ZwwSra0z1pnufpf3F+fosSvkMp?=
 =?us-ascii?Q?f02j8/NExYNdAbgNOmM3TaEqEoZH6tsc/xwTLm/aEPLj3x4S4rmLJhHac9mv?=
 =?us-ascii?Q?rTrR5aGiw4vMkd53lnOCHSYyhsnVjUWfVV310h9iaLf60Q2XTSdWV/mwe6/l?=
 =?us-ascii?Q?cBwT3MvNLA0ixGEeNwJxHMQmIiy6iazwlgRh7jXyNSZ/uWLgG67I3F6TBFxQ?=
 =?us-ascii?Q?UJeGKTGh7tFubZzD1AtDm3ileWpm+/RURbvys+tl8cKp9q+SYCH64sb2x1+t?=
 =?us-ascii?Q?+o82aVLN9ZbtbnQdVDYV8LPmemeie5PuWKSiDVhDr+LDZan/AEd0Z63LZhiz?=
 =?us-ascii?Q?4xzvPrKeQwrqT+BvAq93AsdLnXo/e5DvN5cXSzLCDMzFMjTqHMN46up69vaz?=
 =?us-ascii?Q?jNvso6qOnfn9XoVr0eUa7tsoB6fjc5/PV87m76Rz4RDvWm+S8pPaZ0cRJZB+?=
 =?us-ascii?Q?28ZzoYim0YoCHWE74OYvj4IG1g8xrSU8GwsT4MJ4RV3qQIkYgaX/bUYxTAXK?=
 =?us-ascii?Q?LfQ1iUEFfLFg6SHtuF4eLL37n38CCU7xbpcIeCzaXR6Cc1nLfN90zmm5JrMG?=
 =?us-ascii?Q?4dekY2d/oaUq5TxFFJsk19YEJU+bxX1KKbv2JpsyC5vVo+9g9+CXLxj6ZE4i?=
 =?us-ascii?Q?yooT0BpiSF7DelmMK08VzQ/PyF+qt0kEg7OCS0d5a9G+EmuGTKll+Mc8Foib?=
 =?us-ascii?Q?Xo+EaQhfFxgBbCMxB1+JKSx7uobHd+wRMUQuWCTwvZI0YQ7yQsXX0JHcnnqv?=
 =?us-ascii?Q?cVD7qWI3VytTr5k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8CdjmxM5JxQfilPHNp6B4hPuAqvT4Ye3PtPbDnvRl9b/ZrK/XSnPT1FkAi8I?=
 =?us-ascii?Q?TtxTelNs/w0iuWGGl19U4h6gP+xPNKkuVMQSuTJAS9PoPdJIlotPxosmAclj?=
 =?us-ascii?Q?J3QlNFnY1IMVoZ+uTT+gcgUPgros0TCToHw4TJ8tGMgBdgr9oKPOfPKjCx/D?=
 =?us-ascii?Q?nWBE+gLiQCqpt1cFs9qnMzH93bcGQr8k11u0jVRa9hahshOggPS1OmPEoULW?=
 =?us-ascii?Q?eMn467ojeMEvVWdChFDJxxfBNLqy3ggrh0sZNAeHjDBnaor1R04YMs73tX++?=
 =?us-ascii?Q?PKABZU8saMO2xAeXhdP1FRXTyapkCNaEtIGpneEbEEaAXmOGpxrE1uh9VHGa?=
 =?us-ascii?Q?KqwzfYkK5DaH3l7sQeZLvKdKqMSbbZEOx6ZIelodhqprt6HMff0LV641xJxK?=
 =?us-ascii?Q?wb3ixoMtuATFEbM4m70czD+WUBw829jLoITygnSPHh+EIdKtlLPFh+c4tdxJ?=
 =?us-ascii?Q?a2tvGrCO68wcIs8GiGnhosld3Eee0gCcx1oLF0HEB5wLwG3kbv7/UOMQASYq?=
 =?us-ascii?Q?RRmR4qKScnEsUjAt9ASizm4DKkZ9kdNw7jgLWEYBUsSPLvjwvRnLeeceR+RC?=
 =?us-ascii?Q?7ao0EdPMEyp4vigBmivQC8OKWmdmyCixLBgPoOean+ZYGeEiPyM1aYqoZDEM?=
 =?us-ascii?Q?5khXfUETgnKXZnboE2FnKdpQmIqHjMhopid8GnrLkfmY73SQLmndsyEOnqIY?=
 =?us-ascii?Q?2sdt9rjRY/eQn0+gXxUpJD5ty5hwBoXx0bVS6DzpE7cCl7A36Apv7VoU0uqg?=
 =?us-ascii?Q?WmQ3Z8bybTHDbO54Yg+7itxCzmHXFmlB+kI16/ysgqVReMv0g8x1bUlnfaOC?=
 =?us-ascii?Q?3Vo5Lt4+RN8IHr+6jHFXGU2mKfUsQznHwHv1ZYfWjWy6/T6ed2pWJRdDTnaO?=
 =?us-ascii?Q?d5uRjTByKdo2N60pQAdVVLvaZ4K9vg/BS9jq4/t3wKNNbG/Y+XouwCziIFKS?=
 =?us-ascii?Q?IsJMCKSVHcO2WTa1oe0gQ7+bbo0p61NG4dp3RZezYZz4mREgIsYyu1Tv1QKn?=
 =?us-ascii?Q?B875vPGuba63Gb6TsK7Z4jz6GL18F8291j/h1liLQpRkkzxytBn2NsJ2feCX?=
 =?us-ascii?Q?3OZj7cxAzmJAgxseZ4STRHhTGs/HmQ/ngHsGnNsxuUpwHpliJyKvlMvX4nVd?=
 =?us-ascii?Q?qraQxRXDFWAl1PzvT57zLLFcuNkjyPiDEe+WBzNh1dKsQKn1QlcI1I+zmxyv?=
 =?us-ascii?Q?n28/FfMlxw+utYX+b3Fto/3K5zXdQmcR15dg1nwbfURUDubmTlKMTx+xrj4p?=
 =?us-ascii?Q?bvwWtLCpozZ2XK0MZRYaM70MvWeDg6ZfsRH2+cVtUKN/YcKBCDlua8Qu4G7Y?=
 =?us-ascii?Q?A/lz4kWtzqnRZZM4bX6W9OSI0RzFdf4h5Q2TOe153DIOIC6cWcmPHHJkl9HU?=
 =?us-ascii?Q?vzn/FyZaXd0jZTO3nOzfQrUzNXTN9WsT30Ufu3lb0Z8YdhA+2vKP7c0HLQMM?=
 =?us-ascii?Q?/MEP1hWz/YPnK/SfCi1w6g68S4rXMDOlyQTsIKI+zMOjG+AKBR9c890WrgFF?=
 =?us-ascii?Q?h5Ylh7fadGdoq5OinBMVwuviQJYhLpUM5Ih6a5edJepEBv8jQNveh0RNsMHY?=
 =?us-ascii?Q?0yGqc97zYX/KLNx53qg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4537430e-1907-43f0-451c-08ddfa7bbfe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 08:32:36.3503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tkm3ycqL0f/tysbHsxVp/WTXFsZe+jq/DdYneCyVYulvl9xjndpHdZtUldvCSKnnSETGLCCqqM1OmKusyp7ZfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
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
> Mohammed Thasleem
> Sent: Tuesday, September 16, 2025 11:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7
> residency
>=20
> This test validates the dgfx Package G7 residency.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 116
> ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 115 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index
> d22f165b8..16b278d78 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -128,6 +128,9 @@
>   *
>   * SUBTEST: universal-planes-dpms
>   * Description: Validate universal plane (set/unset/change) with dpms.
> + *
> + * SUBTEST: package-g7
> + * Description: Validate the package-g7 residency.
>   */
>=20
>  #define MSR_PC8_RES	0x630
> @@ -178,7 +181,10 @@ struct mode_set_data {
>  	drmModeConnectorPtr connectors[MAX_CONNECTORS];
>  	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
>  	igt_display_t display;
> -
> +	igt_output_t *output;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> +	struct igt_fb fb_white;
>  	uint32_t devid;
>  	int fw_fd;
>  };
> @@ -1572,6 +1578,108 @@ static void pm_test_caching(void)
>  	gem_close(drm_fd, handle);
>  }
>=20
> +static void set_mode(void)
> +{
> +	enum pipe pipe;
> +	bool found =3D false;
> +	igt_output_t *output;
> +	drmModeModeInfo *mode =3D NULL;
> +	igt_display_t *display =3D &ms_data.display;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		drmModeConnectorPtr connector =3D output-
> >config.connector;
> +
> +		if (connector->connection !=3D DRM_MODE_CONNECTED)
> +			continue;
> +
> +		igt_display_reset(display);
Can we reset outside the loop. Before we start ??=20
> +		igt_output_set_pipe(output, pipe);
> +
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
> +
> +		for (int i =3D 0; i < output->config.connector->count_modes; i++)
> {
> +			mode =3D &output->config.connector->modes[i];
> +			if (mode->hdisplay =3D=3D 7680 && mode->vdisplay =3D=3D
> 4320 && mode->vrefresh =3D=3D 60)=20
I see we are trying to find 8k mode only if not found test will skip any pa=
rticular reason why we are doing this ??=20
I fell this can be handled better, first find the display which has 8k and =
then run the test accordingly. =20
{
> +				igt_output_override_mode(output, mode);
> +
> +				ms_data.output =3D output;
> +				ms_data.mode =3D
> igt_output_get_mode(output);
> +				ms_data.primary =3D
> igt_output_get_plane_type(output,
> +DRM_PLANE_TYPE_PRIMARY);
> +
> +				found =3D true;
> +				break;
> +			}
> +		}
> +		if (found)
> +			break;
> +	}
> +
> +	igt_require_f(found, "No 8K@60Hz mode found on any connected
> output
> +\n"); }
> +
> +static void set_output(void)
> +{
> +	igt_plane_set_fb(ms_data.primary, NULL);
> +	igt_create_color_fb(drm_fd,
> +			    ms_data.mode->hdisplay, ms_data.mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    1.0, 1.0, 1.0,
> +			    &ms_data.fb_white);
> +	igt_plane_set_fb(ms_data.primary, &ms_data.fb_white);
> +
> +	igt_display_commit(&ms_data.display);
> +}
> +
> +static void cleanup(void)
> +{
> +	igt_plane_set_fb(ms_data.primary, NULL);
> +	igt_output_override_mode(ms_data.output, NULL);
> +	igt_display_commit(&ms_data.display);
> +	igt_remove_fb(drm_fd, &ms_data.fb_white); }
> +
> +static uint64_t get_pkg_count(char *pkg_data) {
> +	char *e;
> +	long long ret;
> +	char *s =3D strchr(pkg_data, ':');
> +
> +	igt_assert(s);
> +	s++;
> +	ret =3D strtol(s, &e, 10);
> +	igt_assert(((ret !=3D LLONG_MIN && ret !=3D LLONG_MAX) || errno !=3D
> ERANGE)
> +&& e > s && *e =3D=3D '\n' && ret >=3D 0);
> +
> +	return ret;
> +}
> +
This should be a lib function I feel.=20
> +static uint64_t read_g7(void)
> +{
> +	char buf[256];
> +	int ret;
> +	char *str;
> +
> +	ret =3D igt_debugfs_simple_read(debugfs, "dgfx_pkg_residencies", buf,
> sizeof(buf));
> +	igt_assert_f(ret >=3D 0, "Debugfs dgfx_pkg_residencies file not
> +present.\n");
> +
> +	str =3D strstr(buf, "Package G10");
> +	igt_skip_on_f(!str, "Package G7 is not supported.\n");
> +
> +	return get_pkg_count(str);
> +}
> +
> +static void test_g7(void)
> +{
> +	uint64_t prev_count =3D 0, curr_count =3D 0;
> +
> +	prev_count =3D read_g7();
> +	sleep(10);
> +	curr_count =3D read_g7();
> +
> +	igt_assert_f(curr_count > prev_count, "Package G7 residency is not
> +achived\n"); }
> +
>  int rounds =3D 10;
>  bool stay =3D false;
>=20
> @@ -1695,6 +1803,12 @@ igt_main_args("", long_options, help_str,
> opt_handler, NULL)
>  		gem_require_mappable_ggtt(drm_fd);
>  		pm_test_caching();
>  	}
> +	igt_subtest("package-g7") {
Need to add igt_require first for dgfx_pkg_residencies if not there it shou=
ld skip here only not assert when test starts.=20
> +		set_mode();
> +		set_output();
> +		test_g7();
> +		cleanup();
> +	}
>=20
>  	igt_fixture {
>  		teardown_environment();
> --
> 2.25.1

