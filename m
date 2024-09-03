Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1A7CD342E
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 08:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756AC10E436;
	Tue,  3 Sep 2024 08:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ekcy/ROF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6527910E436
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 08:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725350469; x=1756886469;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4DkRaeoY/X2pzJfMCK2n65VyghdoKQczHGBx0lnH3UA=;
 b=Ekcy/ROFaXAZi4RJDI1wEPBHWhpVMSPXzX1I8PdYVjdowDeydboe4rR6
 KTXPhhth6g5dc3OMNK7NhRZvUOZ+FPgso+1iopbno+e5PlXBEzUktMSkf
 RS9RX5VsYXeffO64Ls+ddewLftIBp+GicMpytmXekKn2ODSBk5LPMRPHh
 6Mmw5z/EwlkyZb7BSCJ4yi2OQgOEhngM72PNK8sx6XVPNXln6JQnfIT6m
 IbQFG3YjPpC7GdcQbWrp9iOR9bP+YGsXj8AGb1t8r25kx6hMJMH78vdLa
 73FoQJLHMfzDdMuXAu0BblVXaVU1q8J5hMC4ahX4Hibmj2V5YtQSr/60z w==;
X-CSE-ConnectionGUID: MYl7YMy2QT2/0pPHH8kHzg==
X-CSE-MsgGUID: wvd/H6NTTZG19AzTpxJyXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27687796"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="27687796"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 01:01:09 -0700
X-CSE-ConnectionGUID: 2B6qBl2tSWiN5+f5Fihyiw==
X-CSE-MsgGUID: 0FV9GtIMSX6xqYzf/TZcEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="64837571"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 01:01:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 01:01:07 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 01:01:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 01:01:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 01:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZHvuJDC06GOhMO9RR1Z+sGP6jaRjtFfAJR1hHELe02vss/5ZPTUGy4RQ5SOgyultIPP1Xrn1P3iPW/yci24eVQ/BB4hBvjYdoWNUIyAigz3rMQabLbKD9jcFPEedcPJwIygaFmcUF+aWQX1JGk1NOTX68i7xUPIpTLziVDR/1nBZlHwcRRSvxgZj7rIQxBjldTwA0Kc/H0AgWjFIecODm9H6IjkpaDa3vgsujgY3OzDndiaxSJ1x7L7BEpG/ZuLoLqnlDp4vjbSNSFBCEjZX1RHhdec/yyYqFFif47dJKxg3if/0cn2YqXuvk9vB4icE49pvvahj64wksk37hRU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePFgBcdrogfhRTqvTgp/wEyxZ0pnZEcP8XCr/eDdN4U=;
 b=PhaYTgEkShVKYodPf13n5fjI31PKMzkoNvIUWMGZ+Gk9/F8lZziijb9YoCPQcuQXzGlW9V8MKbshdsSEmEIUJbgT2cHSge/0K7ZWmO1hdgfYGEXY2uP7jBGgwag6+dCaASTTbLtvkjcah07NFrH+OR3GhJE3W+xYoy7Qui8r09N0C7k5hb6dr0YNzF61a0JsBbo9lsX2P2xQIEWyhZ5Ii1EoYy9f2UOA+ZU0H6klP8s31kRP3C5x1myTSmgjt/cC2O6LX6trP0VbhAZc9cU8o1oDghd2viIAvZJw1HtOVs75AWamQA7zY4aEZAWoaEnbMJ3eIiL+j6zjcBX5dj1s1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 08:01:04 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:01:04 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 07/14] lib/igt_kms: add function to check force link
 training failure support
Thread-Topic: [PATCH i-g-t 07/14] lib/igt_kms: add function to check force
 link training failure support
Thread-Index: AQHa9yit/uSc8XwiA0mOJwbxx86ZILJFwCRw
Date: Tue, 3 Sep 2024 08:01:04 +0000
Message-ID: <PH7PR11MB6053DD0EA328811FFBC9B7F8E7932@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-8-kunal1.joshi@intel.com>
In-Reply-To: <20240825200612.4036178-8-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH0PR11MB4934:EE_
x-ms-office365-filtering-correlation-id: cd772948-ba9b-4c06-eded-08dccbee8f74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?MRSbOVc2Vg9asvTyOex2KuUpGuhs2rQSWYRdo1PXjXbk1apWSiJO2JKgJlra?=
 =?us-ascii?Q?8hu+B+wvLfNCgaIMnjLLUCLUPqOJY1bCqAde6PTyt1CYeq77WIznFfgpsJsS?=
 =?us-ascii?Q?TAAUNXYlZzmMw8LFBDVcR7YQ4tBxeuI7MXeccysXrDnPxl540zhmvinMoiX5?=
 =?us-ascii?Q?cj24AW6aRs8KOn2xCHyipwnyt+5pd21sg0SIid9rdUB5Tr1zM6DgPwp4H6Jb?=
 =?us-ascii?Q?aiQSk7h06YmXMRqiWrn8fc4ieLHVzyVYPm+pVkbP2dsZPNHsy37FWPxCmQ/1?=
 =?us-ascii?Q?uqtL1K9pMMuauegnzF/L9UkY248pJDo3whaRThqcCxL+/ZGnSp9v6aWk8ulI?=
 =?us-ascii?Q?EucDE/yQQkmC/RNsa8w9nxpQE+DMl4SV6iL5U8b7dp8LB18d890ecJny7Zeb?=
 =?us-ascii?Q?W3qbfU5ZPWf9i3ia5g6ZpurEvFB6C3cteoGJbIWO3ypCH+kSZE+QfprmBGu4?=
 =?us-ascii?Q?9AlZ2oecMG0d5EAFZ6mUcl4mNkyUeNPJ5P5cjTgDqVjTP8CczRBEnO5ZA66G?=
 =?us-ascii?Q?HU/NZH8FpKExQHmTvLTatCrq80AAO6Au5i7PBqrERTxYuI2O8pLxwDfz2nmP?=
 =?us-ascii?Q?lRS7Z2MdGJGnA7pG3BzSA2MA3NK2JkYGILm374oln6hAUwfxj8toCW1csEik?=
 =?us-ascii?Q?MMkowa9p9woAMZRn5FWJym+KOnS2RNyhS1tZxb5ULAa8/GM4a3FcZwScG6Eo?=
 =?us-ascii?Q?d1w5M1B472DGvekHCA8vkVqvvhA0tdzRPm2wxF2v+IWcPyg27xOsNkRDe9Vk?=
 =?us-ascii?Q?8lr7i2cpHCAA1uFc0Z2ZtuhgVEsgR+zIGSXjqvA2KHeb6v5pCuBe7kTzx4zO?=
 =?us-ascii?Q?0cBXuNi0JxjcLJKPyJeixKcASSF4HK1Svk+JVAuO9nynrEw5rIGxdc5aCY5Y?=
 =?us-ascii?Q?hTUOu2m0+6XhXSGfyJB1PZQnA4xKa6zAgW7ZKz0fvDOcpbwk66JHEhHuaskc?=
 =?us-ascii?Q?VXd3VzhL7Rd9sux1OPzQQY9Gl9pMzrHu9EqwUWfPFObdBwWIUOb9H+iSzrt6?=
 =?us-ascii?Q?JL17GWHeu3eW3w8So2nbSXT4rhDX7KmSvw7oOH2zPjLgdZPrvA+dx6p3ojFQ?=
 =?us-ascii?Q?Q/+hVK7nfLqFtW64KmJvvSM1zGBQB98zgW7hz5hZmERURVvY1MljOpmptI4a?=
 =?us-ascii?Q?BMseBes8AEIHjDv/7lub0V6/ow4i9IM04vCJhUpB06RaM2B9n+nabacOrYCx?=
 =?us-ascii?Q?A744y41DxDnJjrGZkqOB9cXR6fYCchdzEgh4Q2Mp/XTtTE8AK6ZYcYaIgDnW?=
 =?us-ascii?Q?dwBa9drrpQn9xKxpC4hmvli55xhPZV1EZ+AysknGZq0ynk7ZX9xFyt9hxg4t?=
 =?us-ascii?Q?UwtZqI1Es1z+DPwG5TltetgoUfNyLj0ROj7IckEBN9RQVdYEEf5mKE0HTo7G?=
 =?us-ascii?Q?DNx9EK5/zx0IyD/G4A/pL6xlUhIuW8Htx4NjFLqMrguxuNdSMw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EJmTSXRuCmwZaAt7ijPvifSNXnuO58+7n3py9ImlIbBVbVCQjEXoHiG6CmV2?=
 =?us-ascii?Q?fUAkKdfSnyF8IQZOduMFdx63/6YpXeISEHL5nL0A/UnolIJpkCWAXYqda1vs?=
 =?us-ascii?Q?m/hqZBuofHN0UKQLXptHQ889thk9JqAxRrXUpBcpejM4SEtApgahqY31LOcn?=
 =?us-ascii?Q?WIy1UysFvGIkblSJJaXZYNVXhFlgfTRb7mOCjwOnDov94DEmRAPdVy638qlA?=
 =?us-ascii?Q?kIhplAi7P2H1uZgeShvtVKu4K1/tBSdpBWwkOm7dWFC6qEbG/EdudDO9qSMB?=
 =?us-ascii?Q?R1la0q5PbVwCX/WNExl+G2M+DAPVGuD+CZNT57NFck/Fu0hGVnjp3m12C+9m?=
 =?us-ascii?Q?+6zYHZZGlRe6OZL5AIlR6pjFfF9RVzk4bHwrsrkKaRS28jQR7CKCfIHHl3WZ?=
 =?us-ascii?Q?M3Q11Xmualn4wEVRxHHogy6FISUPedFKC1mXZVuEK/vvt13ibkVP7htTc//W?=
 =?us-ascii?Q?jP12srj2uJFS2UDQP409Zv+AhtZgd9fgirl5aenFOkJSHlST10xKo6XuhvFo?=
 =?us-ascii?Q?TUDfiyU1aO3DTRgTrVSquRLRP49XrZ16wlwWLDDN81088ieSjS8Q50ynllmD?=
 =?us-ascii?Q?euscHJcRsIYAE6M5DE8zYggorMT5IR8C55FbAj0M5xqP42c0Tv6PdedJKCoH?=
 =?us-ascii?Q?U1siIy1Ttj4cb7750P/8URyUaUQgeVymD0X2dKzpd8PNcfEZPrfYXkqThBEv?=
 =?us-ascii?Q?7xkJAXwzvtCL4CL1wXgU4tQFPNOq9TIiusfLGCVk9YZutBRLcHQvsi19T+zd?=
 =?us-ascii?Q?hkDgS3cGaTn5Tdw1vIvBSrxmNf1oCq9hJr2aw3/9xKnkL/9vdU9N7X2NeOY1?=
 =?us-ascii?Q?dx+dfSoXwPFgEcuXZ58Bx6iumUbiaZ2lDcCWqWZHxA5ZG0ALE8SJo1xGSW6u?=
 =?us-ascii?Q?Fm7zxK/4YEQj++QDZlMHKlZiNEKcpnboFpFoHWmHEn0HymEc02iZ5a5DXtAQ?=
 =?us-ascii?Q?npGfngJr25gLiMA+5JxxiQSdYXHMEG7QIHY4y6ddK/D0oHCP9eBK0CazHOOl?=
 =?us-ascii?Q?nO2opnTV1ASSHMPfVklW0DfbWfqCxKLPO0IhSO2CEedrRlyUT5X+jg57dFwV?=
 =?us-ascii?Q?0IJVvborJrne6sNkusfsIVtbIju7A9BoaumHXD9k/zZmVGYNX8Jz8UT726kM?=
 =?us-ascii?Q?N594AWsoKGc+WDWl3HUqsmpAKAp04g/Dva+vRbe2ujHrxuQwYxJPH5hNtIob?=
 =?us-ascii?Q?Rz3ShtP2S73/4XQpmkmot30VDfbmX/tcq0Z6ZLKxinJorvMUpsOJI4JbwQYb?=
 =?us-ascii?Q?nVoOa/piLdTE3aN9r9zUScJZFVJmQkrlCDrqSySq1nRoc7y4DrqhwzEmNHDT?=
 =?us-ascii?Q?v6NjBCdX7BPf1CtSq3k5gjqi4SX45gAxoebEkjoFhF2wVhPluFfeXM46abPr?=
 =?us-ascii?Q?uLxRpHvY1YQVwUy3R65CC6x0R5Gmv1oGc2folAEq3h9u9ASBt83pve5PgkEQ?=
 =?us-ascii?Q?GdnG0l9nqFpHQSG1gwmbprcAdsELr116iB0gz3BOdefqXPeW96m9wvsAGeDr?=
 =?us-ascii?Q?G4JdfANdifVnEDM9id4IkvHQOy143+lLtFzCBhQaw7Phq/4y5OFTXQCcy+dj?=
 =?us-ascii?Q?jhVSkXX3NrITpHqTTVUfqLPM6C9gAiFmCFWA3AYx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd772948-ba9b-4c06-eded-08dccbee8f74
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 08:01:04.9147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kdenWBObBzfOp1MeLXs7kQoOtoiygwSB7hZDNjgKiCo0+Mhyq2eOgHMl/jZ7xDpVJlwb1kKXFvstKwOCFSBGcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Monday, August 26, 2024 1:36 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 07/14] lib/igt_kms: add function to check force lin=
k training
> failure support
>=20
> add helper to check if platform support forcing link training failures
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_kms.c | 25 +++++++++++++++++++++++++  lib/igt_kms.h |  1 +
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 2720095d4..4ab47e2e9 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6893,3 +6893,28 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd,
> igt_output_t *output)
>  	igt_require(res > 0);
>  	return strstr(buf, "yes");
>  }
> +
> +/**
> + * Checks if the force link training failure debugfs
> + * is available for a specific output.
> + *
> + * @drmfd: file descriptor of the DRM device.
> + * @output: output to check.
> + * Returns:
> + *  true if the debugfs is available, false otherwise.
> + */
> +bool igt_has_force_link_training_failure_debugfs(int drmfd,
> +igt_output_t *output) {
> +	int debugfs_fd, ret;
> +	char buf[512];
> +
> +	igt_assert_f(output->name, "Invalid output\n");
> +	debugfs_fd =3D igt_debugfs_connector_dir(drmfd, output->name,
> O_RDONLY);
> +	if (debugfs_fd < 0)
> +		return false;
> +	ret =3D igt_debugfs_simple_read(debugfs_fd,
> +				      "i915_dp_force_link_training_failure",
> +				      buf, sizeof(buf));
> +	close(debugfs_fd);
> +	return ret >=3D 0;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 2d69d794a..5ae324f6f 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1254,5 +1254,6 @@ enum dp_lane_count igt_get_dp_max_lane_count(int
> drm_fd, igt_output_t *output);  void igt_force_link_retrain(int drm_fd,
> igt_output_t *output, int retrain_count);  void igt_force_lt_failure(int =
drm_fd,
> igt_output_t *output, int failure_count);  bool
> igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
> +bool igt_has_force_link_training_failure_debugfs(int drmfd,
> +igt_output_t *output);
>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.34.1

