Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE06DC27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 05:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FA110E0F6;
	Fri, 14 Jun 2024 05:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3h7uMot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A665210EC30
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 05:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718342938; x=1749878938;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FWhuQafPG9/Mw/EOIOsmH8U8HSKWNApSRIlHksPS91w=;
 b=D3h7uMotHjiMsiXz3b0ARJCKHxXYxpUE+7L4LonDlFW6cEbgZARx22te
 GRMl7Wq5fP8kQaGqptgpGY+Q2FWHigbPimBJRav1Ryx6Hdl3BrIriuEaQ
 /wf0RwAiN+cmzNLE9CLTcAhMmInSyn6PUb1x7OucVfqAeNHObKgsQRi5+
 +oRMWQTLSqK9L0KxiR4/CZouBBsEMRIejiRKZ8lwNBe9SgBUpMBYPNW19
 p7ulKBT5ldHE71urmMLzHjGVni3GwuWkcb1+Z3h5KAQlG1UKmRqKoW1/T
 OgoSVuGAaAJxBXVqfXE7n2dsCjMImsu7OLMCMJX8C+85HD4M3D9Nyc+A4 g==;
X-CSE-ConnectionGUID: f02A76ReRJibCF11AUGicA==
X-CSE-MsgGUID: oFh6evVwR+ebszEtWm5yOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15184268"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="15184268"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:28:58 -0700
X-CSE-ConnectionGUID: Lb67G88tRXGzV1lMwgQgSA==
X-CSE-MsgGUID: Loq0/YMtT8Kp3mfBqVi6Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="71598280"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 22:28:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 22:28:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 22:28:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 22:28:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 22:28:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfbD2zadE1vDZq316SEebdqVNM1+TMQPA1uup4b6QF9FzK0b+rpUzahBtVfnmfCrojBEGP4o9AjKu/5WBMa8EZikYj2LRspi4Liw7ET6y1u8osIXyen99hsBQSjyIfk4YjtCVofBXmlK/1usAucDxfdbxio/TGWhFDp8/JqoPtJerMO0Zz5H5t/9xC8QWh/InRECoH0tP7+CgFvs2xH++wy4yDG/MKKFfCXBoh9RK3p4sBlPJs4WjwAX3RJd7Hm4FAfsyIpvpLRRVbf0VSF+ZBeIfGuw/MZDkJj5YfeeLrXNsS7D0WpEQdcOVKMMXolsYfcVNrBwzs+ERaEgDTchoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNGtiFg6rTz8mN8G6dIl/o8E//riJmZCzT9QlzsTnEI=;
 b=FjNXBLSO9qLDNb759LOGXkX4EIHk2oedjswLf9rPCTXBMNXQlSnlVRvWS5LvMm19TO2Vtnd3elge7vEfJ6rbZVPgixtqm3boEIv5ppSuc9LXPT/IFmJmF7x6TMGJkrr8VQ0OjpS/ab4gwnZc79NX7yi9iznC8V85ikxLncVPXfXPJ3ZZbMRu27n2qSU0LiZM/NvxsdY7jAWbjpd407E3t9PmwVoATQFLd+lVhjLMcLgmj1dD4sUu2h3WLTn8KDP1xeKABvrvKhdVswX1jehwTBvKDS2m18RqYgdjM86XQqL85MVRmaxaB2If1+EQ0z1zcagLzMR1xqA/JqDIN9lJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.25; Fri, 14 Jun 2024 05:28:49 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Fri, 14 Jun 2024
 05:28:49 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t 1/8] tests/intel/kms_fence_pin_leak: Test cleanup
Thread-Topic: [PATCH i-g-t 1/8] tests/intel/kms_fence_pin_leak: Test cleanup
Thread-Index: AQHau7x8AgF12zprTEqT82n1XU8zWrHGv7aA
Date: Fri, 14 Jun 2024 05:28:49 +0000
Message-ID: <DM4PR11MB631279420206A09A9BFC6E9F90C22@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
 <20240611045348.3727239-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20240611045348.3727239-2-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CO1PR11MB4996:EE_
x-ms-office365-filtering-correlation-id: 166fbfc6-3551-4f22-853f-08dc8c32deca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230035|1800799019|366011|376009|38070700013;
x-microsoft-antispam-message-info: =?us-ascii?Q?2FGTogV7cVioENinp00nfl88c574bNCuCY0jSECWs4NiSNtfL4euJxdnMqOU?=
 =?us-ascii?Q?hYNVAfXtpv9tTVicthjAHDb4ofFJc137NB8+bwCLy58kHksfedOMrEfbgO90?=
 =?us-ascii?Q?Xck1kpKrkYlFAsBWuQc/ny3GGLpyjqYHY/56wnRNw8rYx3z228h8gT0j7Ppv?=
 =?us-ascii?Q?HiRXGBiPlJRhG4BB/WEf3f70UsuKtln6jH1Fo4hzRQg363CLOUiJbbBqTCIQ?=
 =?us-ascii?Q?jr8ZVjFGqnCzIUtpYxqLX13L3QXzp/bkaHBNe73NC48IHsId1Ut5DKPMrM5U?=
 =?us-ascii?Q?HPgkShc6l+vFf3UpZ42ssHwitwW+HiqYgKBX2j+71esUQuJDO/zNLrlVJlON?=
 =?us-ascii?Q?Qp3AXKeVPpLcU6eI6nDqksiitPoe5Jo4pv3lCnz6h836PlvPv/4lp0GaRyWp?=
 =?us-ascii?Q?3u7ZjAkqfjEErz0LNXyYVUZ+ZlseHyH4xKRFdyDozCxoXUCS0JqmmLPVwy9U?=
 =?us-ascii?Q?p7XkLSm5FWUy0cuYFY+yz1gK8/olmQoK+AnKeDRfz4Ek0B+1GkqQlRRlDdWL?=
 =?us-ascii?Q?SFFtIHlSVhtg+YVVj7FF8VgYV35u1QpoDldnTC6PKkFpssck34AnpxPXQ47Y?=
 =?us-ascii?Q?Vdy/2k+X3VPTi8GQf7XGUDbPltiq9acthad5gacXwwoC2onlBb3srpBGs8ri?=
 =?us-ascii?Q?pJBUy9lVKwV0dwgPpn4i29fX+5THGn4QYQALPAeo2mty8XzQVxbqRnxlezpu?=
 =?us-ascii?Q?adbbjBeqWlcjLefTxIM2/bkiRc5DK90ecaaw/7V6qFBXMi1rC3M/e0Wy3YDg?=
 =?us-ascii?Q?1fOKMKmjUUVQN3hFve+Jw2THeDymL71xbxz5vhsUmghqoURZ3NUOrvbb5mZL?=
 =?us-ascii?Q?iOyoNFIypls9DiFeMHK9c4AqXbB/eIFDgvZo/ESaBsD3eJOXohufsPAJ5WVY?=
 =?us-ascii?Q?61Rj+15IRviViXyBXx6pJ2fiK3VR+VwR8t8RZKiWvzInOzW5a+zio7UOq4bi?=
 =?us-ascii?Q?L127sjswoQeLHLYE29/ofN5/FVkX4M/YbQ7I9P15r8bvEcxrebPxT6s8czi9?=
 =?us-ascii?Q?63G5uJm3lLNsgnSfhSO4naB5WPY2PitXPz0x1K9+JvXsWWpL5f6JC++8Q1lJ?=
 =?us-ascii?Q?xbnHlTqAFNWh0S4JE3PjQxpAYiiIPhKIIdXejMVOF/rkTBfH9L04s4dYu4/u?=
 =?us-ascii?Q?g2TN5y/bhuqig4niWjJCeY1PY3zkPCX1CL3ADZcJ4Mwen7QoX8yGEBnsv9QW?=
 =?us-ascii?Q?wof2XJD7tA9ffJT1jW33bwckKs0i8Jy+FNeAl4abDWA+6F8ACDTE0fS4g6yP?=
 =?us-ascii?Q?UpBqcRUdeEHVDMOOdaLsNSP/ddvMspPc/cc2QDn/66gOzF592gBIvxiGpaEN?=
 =?us-ascii?Q?uIQ9ksWNnW9jUinAKH7JUBvK7Su2jezofDoIRVccNj5yI68uoQpmCkH6qoFm?=
 =?us-ascii?Q?G4eCwtg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009)(38070700013); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KvxLTzeqGqNxWaCyYUPsNrPRE9Ztjz00ORN8BKQd5Gc5dYxR+JqjdtnR7Ij3?=
 =?us-ascii?Q?Tj8rULTLYKjTiKqk2kn17Uoa3t2NXzQJz+mSbY4FsRbN0/0GcEc+yNufPO/q?=
 =?us-ascii?Q?lHV3KWuTofbXFAJ1FS3jlEaNVdNyihJnJscuWxsGYL3qVX6v4oOhqBRoZheK?=
 =?us-ascii?Q?PfAfrDfcm1NZwPyTt5jLmLqk3oDPB6O4Tfc5KEGnZ/wYzxM+VU54ludfTBTB?=
 =?us-ascii?Q?gLD6QAffrMyTjIapLbM5IWDjKkGr/WAlT0eE4aM8SGRmwF0WySQ8DPXpvfEr?=
 =?us-ascii?Q?sBgzmr/yIMi4cOkyTwQs0P35i2cLd9gUSfY6jKeSmCDlVGZr3WwV+0Hh+bbg?=
 =?us-ascii?Q?ydAcXiebCnajKXBvX4PM7OvdG6LYZBJ0J+AVOdJfDz+ff6IMQmt6jm13y9nl?=
 =?us-ascii?Q?biNgDFiRGDdJONX7buBw7ll25GIxHsjgWsTPEyJSQBVR2VB13acazMOoClgC?=
 =?us-ascii?Q?a1GAmFU45c5qJlJHjobrlfBmrTy4iDpPMEOX/pGgtLDbGutAP2tWUyM4853u?=
 =?us-ascii?Q?w1d333Xg3yxPdRroh9pbv/QpiHiKEo8RZncwzWhedUd+BMCr/HojkNm5+vfI?=
 =?us-ascii?Q?XD7f9uZQXPKDwgUkoiWJigpEt6NDQPEwGPCf/NHivK44FI1KVcyRIuZHP4Im?=
 =?us-ascii?Q?Ka8CEgi1pcucXu7X4sh0jFceGVwXBBASG+veBxvba+4TJTeaX4K0PFNBc4Rc?=
 =?us-ascii?Q?rpJU5u9HFjvCWsno1k0eQLjmsk+9Lr0kiJQxbR8YnrK0faXBImDPf2T9DCPj?=
 =?us-ascii?Q?eoSWnx0qBCffS6Izq3RzzjHnHLZG0gWXtTlJz30FGXO0VEHX4HBToiw5WfHW?=
 =?us-ascii?Q?uj6fooWfGOgMnEg1oWYFhEnkzjVqzGan3QkU/k/bJs829XyUPMSSH1187EA+?=
 =?us-ascii?Q?E7aOJGpYHHqULG4b1FIPxAa3cdDg4Y/H+R6roU8Hi8Kay2+8/+M0UY5Omr8u?=
 =?us-ascii?Q?LFpdTLJDG1JN72XszOlUnn7fbK98Y92SG/DDZeDQFE8uueW1oUjF7H6vUDzN?=
 =?us-ascii?Q?YbS4QbaeklOH/yiYnPoIRW51A8hGeQo5lp2xyGggupaxRuI9PuGYDc/j3gjr?=
 =?us-ascii?Q?Oz6BFYXk/ghnaugHMGPjjO28KIOOpzpaxu9ZYDz6yU6Ubzy1+INO34UfYQ9H?=
 =?us-ascii?Q?89wWlt9WyKaBFaog703OtmCU/k5p9BZMEsOl6RNjiTW6tS+b0XRWy0nhxD1E?=
 =?us-ascii?Q?3LmiXLNWdO5ElOMOB4deH3YWG5NyWHgfYKixrm5fSL0Sv6xjnhgdYDOvwbpB?=
 =?us-ascii?Q?cRXzqoglpEni+w3bc+musZqHPOrlCTztTqdeI6SAmXC9udsPZi/nqTPcXI2H?=
 =?us-ascii?Q?ndDx47tdRODsK37rud+2rJbkjZtuXvgKAIraaFNc/6SOwMonv60nnhllO+Xm?=
 =?us-ascii?Q?vkjEh/VJLwR5tmxR/Bc7pzrE1oozmRPzAIH2w7l6Lt04it/sJZcXkrezNf8+?=
 =?us-ascii?Q?6FdXO/XTctCFhoxHTSKATD/myewm3hEWH996cNjLTje/zvFZrgU67Qgm6Y6P?=
 =?us-ascii?Q?pTI2tCZyCnRSbO8YvcheVSJivQHvj2esfLMG3QAPcf8zo+DA0T7tWZOKlUCn?=
 =?us-ascii?Q?IWQmt8bprxNesFrCAAw68AwjnSgeV7XlNos5cCMD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166fbfc6-3551-4f22-853f-08dc8c32deca
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 05:28:49.3564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uOh6dUzOKJ0/AlU6dth7CGTb8XPoXOFQ16P3QncYa+K2wLIKQak5PsiOMX2QUM1uoW+4/s093et/YqP5L1F8SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
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

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Tuesday, June 11, 2024 10:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 1/8] tests/intel/kms_fence_pin_leak: Test cleanup
>=20
> Make sure the below points in IGT cleanup:
>=20
>  - Sanitize the state before starting the subtest.
>  - Clear the states before exiting the subtest.
>  - Update existing libdrm APIs with IGT kms APIs.
>  - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel/kms_fence_pin_leak.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin=
_leak.c
> index 5d25d9ee3..8ccd73a93 100644
> --- a/tests/intel/kms_fence_pin_leak.c
> +++ b/tests/intel/kms_fence_pin_leak.c
> @@ -199,7 +199,7 @@ static void run_single_test(data_t *data, enum pipe p=
ipe,
> igt_output_t *output)
>  	}
>=20
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_display_commit(display);
>=20
>  	igt_remove_fb(data->drm_fd, &fb[1]);
> @@ -234,18 +234,17 @@ igt_simple_main
>  	data_t data =3D {};
>=20
>  	data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> +	kmstest_set_vt_graphics_mode();
> +	igt_display_require(&data.display, data.drm_fd);
> +	igt_display_require_output(&data.display);
> +
>  	igt_require_gem(data.drm_fd);
>  	igt_require(gem_available_fences(data.drm_fd) > 0);
>  	igt_require(gem_has_contexts(data.drm_fd));
>=20
>  	data.devid =3D intel_get_drm_devid(data.drm_fd);
> -
> -	kmstest_set_vt_graphics_mode();
> -
>  	data.bops =3D buf_ops_create(data.drm_fd);
>=20
> -	igt_display_require(&data.display, data.drm_fd);
> -
>  	alloc_fence_objs(&data);
>=20
>  	run_test(&data);
> --
> 2.43.2

