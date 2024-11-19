Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8E8D60D15
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 03:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166F010E0E6;
	Tue, 19 Nov 2024 03:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmiC+xbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52B110E0E6
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 03:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731986268; x=1763522268;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gqOb99rXLxny7c5JXGwJBYf3S/h/SUbO9FLzkAinNk0=;
 b=BmiC+xbQRrdJRkALcgYnjKlMW/fu6hJODlT8nD7QZkDPT7+TXFUJ/fpN
 lh4wciGNxjszsdjAmC9yvVMJSL7WJWu2HmhYxX6T164BvQi77m68PW/9N
 crJRSz50wPdLTEep5zyQHEYrlsiP2vzPSRdvb2IwrSnBuj9G4dixHQ7AS
 p/D/Seaq2uVWWpAyXAGFgkNOQjZbIjT4TnW2RZhxpylXYjq+VCjNu//Yx
 sLUbN85INDYRN6wEX6uhl4TB2CpUHVIlHTrro8TOZVUVvd23cafImayJ1
 IE9E6QuAWTw5SIQgndrEqUkankrakwKCJJGxCMLM1WKCZ3HPepvqgve+t Q==;
X-CSE-ConnectionGUID: ja1PF8J2Q4WA12l/sawtpQ==
X-CSE-MsgGUID: sSsf7UpRREGZv7BrVOQ66g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35740573"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="35740573"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 19:17:47 -0800
X-CSE-ConnectionGUID: SY4HMGhARzCPvOxhtw0sVA==
X-CSE-MsgGUID: oDvAWSg5TkqhfMhjVUh21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94496105"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 19:17:48 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 19:17:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 19:17:46 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 19:17:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVrsqfUDUw+j15UF0JN1HCqFzNbVB715TptcVMOJmptDNb6Cz3KRzsR5rdOGwDalRWT54UK3DgyIKMgV6S3+R+jDn1Ho8DmOYWprzqkuK246SIr93uXCA7CcDhePvaQ6Y7ugYQSsqCZ1+tS4k5Lvz8DyT6hbjfYLm4bP/DhiBerA135U4NIi9uQbJIafIJxpWlqTiH38pPURge4SMJqjyfh9AtNP+Dk3gH22R5FIxD9Dv4VhxwFbgTenrDOEJZNxrxx05ov79+ujKHeqL+HhyJ03Ylya5d1R1eWnWezWaBZh7YyVbehhplNSroFR2rZoW8s1joo+xsTqOxmdDYICuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQVaQeehLqeeVCwdPRD2WJj3dntp6+e5dtt87KMvYMM=;
 b=STfjUjP2K2x6F0g4RYGymm2NzewWBSCYR6KnJMDcDQGkYLIzYvbPPT246nQ/Qj1IKT8zZPXBWO8UmJ1iVedkMq7OIMewj9d5U6GgImrphibay4sr0s8M3l89wYULEwXYzyZE8bOHfVg2LMEtvWKTABJ+8H79SKEGliJqPsUCzOqUdWM1NpwFy5V+NZlv9M4go/WLdx8NIzdaJZQKTiOWPC+ESNnctAjR5NSygGrvxElEiALN31sBa+n2C521Ufq646/sEvHvXrbBHONVGxhDLOXlv7dLzCgidpu/pdzSr/XzD5PV/zcx8jV0vYApxKY4H76bacwAfQ6WRKw/unlW2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA1PR11MB8221.namprd11.prod.outlook.com (2603:10b6:208:451::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Tue, 19 Nov
 2024 03:17:39 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 03:17:38 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [i-g-t] lib/igt_kms: Clear all pipe properties on reset
Thread-Topic: [i-g-t] lib/igt_kms: Clear all pipe properties on reset
Thread-Index: AQHbOcXaFGTf3AfLjkGs5b+Q5E8osrK972LA
Date: Tue, 19 Nov 2024 03:17:38 +0000
Message-ID: <PH7PR11MB6053423A61B3427DB080E81BE7202@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241118141522.2046021-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20241118141522.2046021-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|IA1PR11MB8221:EE_
x-ms-office365-filtering-correlation-id: b0b3a47d-ccf6-4ae2-a1fe-08dd0848b8d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xQDxLY1RDtgY2QCMnbghwOsZLBulCWQHpqbZiz8plAOlca3guR5Df1zAfuyE?=
 =?us-ascii?Q?yOEvobPRZwLR9gdoxikT/kzWpeWJ0lLhGF7Lm7Wd46CfrW6Rz29rvVkE+dCp?=
 =?us-ascii?Q?cHNMRvafTj8JamZZzzIAMihBoePdjWosrpZWoWUqheP8i4nYuJH147POSGN4?=
 =?us-ascii?Q?DBGzxHu8DE/zD3DI5QRxgK3jCXOT2EakP/CAJ8jszIi0YgpUsrHkqaTOBhRx?=
 =?us-ascii?Q?g1AYktxQzxQv69healjj+Rnr2vZ8D6vnjnpxMKPVywmPhkRATva5zDAaDZmK?=
 =?us-ascii?Q?4i3hHpQO4jN1wWJxQ6vxe91iJIqlhnIrq6k6vkTA8CVoMqvdxyuL+vihuBvq?=
 =?us-ascii?Q?GYUvE4jzChz0jY9QXAxGr36F4m5AhqShBdV7sDRZdcg0jFpnTIo3h5OSp8MZ?=
 =?us-ascii?Q?mzjlmvCP9WUZrPluFCGK/OHfHqYeGZ3bliiCg1J8+FPHd86RH8JtT4Rg62ig?=
 =?us-ascii?Q?TJlxAqexp/H13Eoe77XfUaupsseYWsi8SDi/aMKsV7LARFukKLX01r9Z9915?=
 =?us-ascii?Q?cfhgB25EdEI/2VscQEipFxgNUVcIRxBgG6a7A62o8u+TKayXUiZjZ2lhMYf8?=
 =?us-ascii?Q?WTrix/y2JQeGduW3tyBZw1zV57gMA7+jqazvfj+nGLxloq9M8p2jtFXDzGHZ?=
 =?us-ascii?Q?8DqTW+AxsxqNQBrbGfExlKHCcf4p1OuJX3IGA1FsCKO2uZ0IXJ7WRaSyMcQf?=
 =?us-ascii?Q?CDucJlbhxdWgwWX8g2WgLNb93pJvU0G60O+Srv95Wp0j1mCXt5WOhZ2EEE8r?=
 =?us-ascii?Q?By+7SEnY5hwRp+LEOYhxuXoh4ZZqPjm0XWc2Rhu8eg9p7tSBV2Wc+Wrf9/4q?=
 =?us-ascii?Q?9961PbU4Olb/7z9oPlR80pnTTU8CDrj3VHApkZJ9IWT8kC7G1be4BwGafMM7?=
 =?us-ascii?Q?xWxUOPWOhOmmyjQHfh+FI8QMtb4oQAgGf3n0fgK5HeAjfvEQPZLzSdFOyyXj?=
 =?us-ascii?Q?Wh4CxKf6NCxvAErQ2KWcm4WtYqj1WGgcJzmJfRiNATUfs3Rah5qGfJ/35Run?=
 =?us-ascii?Q?9BXAHdDO7lRHaz9sM0FgrcHwhpRL3eFSRKSKK0dVfQyIV0F00rfIaP9pGPBM?=
 =?us-ascii?Q?25dC8RkofpmgCPdAgF2vphtjxTorLIVX3JauMM+E3GHw7XGRa8tqnHzroQjZ?=
 =?us-ascii?Q?bv81tTgsQsKInzKzfikXHKwozkKUYDWucX7JnzNiqKl7Ivx/aQWkDNE/BwTC?=
 =?us-ascii?Q?oDHw+5s3sOWKrcYLst7V94wE/c+98p/L1iTPJgMzeMypBpvvoyz2La7V2FEK?=
 =?us-ascii?Q?KnGlZsgItEXqy9BCxewDI3kOJmxw6AV48XwdHSxoA8IJULC8HM5JwjAAd46b?=
 =?us-ascii?Q?3V1z2rf5VWKZgPpix4kzL7zgSemARcrZ7qINSSV1+zlt4sb4sb7YXFrP3qtu?=
 =?us-ascii?Q?3slov0k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3zH7d8c2WhLxxKGgDZUf+a7zytaKwzf9Z/dOFu7pTu8nC/RR7Oy3IPeyNZwY?=
 =?us-ascii?Q?vaGSLygfcGzG3AOkHaFuSJbLAb88jDvL1vZe5pZFm6FkGAGBr6VY6yRQ4uPA?=
 =?us-ascii?Q?oKXciGpsn0gt8hrpKWrDoN9Fxg/IxNpd0YXyBbwkv+DUnQu2E8dZtOShrd2N?=
 =?us-ascii?Q?qPXUrPM+fT9C0u7JZpybHzwW9JeCHE4H243U+bk5p8AtbLq0u3dOj/gaCH00?=
 =?us-ascii?Q?l/mWbTnWNdSu5Xg2P91rAOZLtpCui+VWxkNeVK0k+v/HinrtTthV9rV2PXLN?=
 =?us-ascii?Q?q6/Hmx0r7HPC7P+iEKO5WequzjkETykW3jvXv/L+L6SFFLkk/RayO3bYm0Sv?=
 =?us-ascii?Q?o6EDBT1oHHa4VQ6UVt1Zvko1yMKgla09BCGpb1DyXSenfhT8hg1xTinEvS0S?=
 =?us-ascii?Q?4KWXuBzBFuLJzdzF0c0EKfVXhR6GcxnagKFSOdWm0VhEYHDK/tn1lCV46MuR?=
 =?us-ascii?Q?x/LIuIRQyw64UQ+3hDFox6ngnSpmW5lCEB/4tkuFyu2iAP7/jwh50PS2VCHJ?=
 =?us-ascii?Q?XSBg15o4DMTt4vsx6JQFvc2vUHJ4GWeNyHVOnxKH5SZV3BlAlBTkO9fpQr8y?=
 =?us-ascii?Q?MvIN9/nBRet9ZHaTjLVr0cTTL/DGuHAaTcxxH8L1IEJoLVeyDvcUa7NAHzet?=
 =?us-ascii?Q?3HAXPIhtav2/zUVKlleXnhNYRYzvxumY83Qe1A8WBylUJx5mxbTj8vrY204r?=
 =?us-ascii?Q?QozIM4t9OrfhRWUuWab96qxERJ1MBvNuFgo6sGljQz8ri9g41KSZpqtahs4I?=
 =?us-ascii?Q?bBK2kMqpSe72qnuuQhYjZHebaLB7fJGemIP1tM1Qy1wtCYrXXJ4lJx8HOvns?=
 =?us-ascii?Q?HzBwGN14qKWMqAPSZyRwa3puqeA6fqGWNtGujpppHmSbamhfWdTT3b15u7La?=
 =?us-ascii?Q?rBYXyQyqOX8VwX6UMBdNoMcYufm9ddF5ihkr57Er5KipcLD3OTQlNLQhVHpr?=
 =?us-ascii?Q?9riqkb+s05SmroctgcbJ4zvy1YMIQEaveTOmxmDI9ZmnoamfSYlztQD+oK++?=
 =?us-ascii?Q?mTDfr++p899x7dLRBWc1wqj9p9MVOlXprmefkZGJk2K6fDUV8qENVjMDVIg2?=
 =?us-ascii?Q?fDmGYIFdlXg6IocbmabPU5IEpFbLX4Z0UA25Rt1bBGP3ti5nSeFX/JaOl/D+?=
 =?us-ascii?Q?s7XAPg09jXMxtMqE3r8SmGQVQQMZIRaGlHjUuHU+k88GOf6/w1DPKKSxru0u?=
 =?us-ascii?Q?a2ANHuNiTrq/9Wcp/Yn5lP35Wk0GHgKXpzVO7zJsz/s2JCNILvoJzg0CsFB8?=
 =?us-ascii?Q?OQMGZpYcOmAo/cU2YgITF3FgzrJZ9VS4/wGr0zDIIaokBnrgAVWWSHQLyaWL?=
 =?us-ascii?Q?ILFpVPhZQ3LNnJwqOqn7xaJDsjfSGS6lbaJSKEjrymYvRCZa+nlfUae3Bhj4?=
 =?us-ascii?Q?k4/2SA72cxiLxXpRhpZ9DxYaCXdrf+0N51mef8Ay81pMmM+wmsQ8WEDoqB9Y?=
 =?us-ascii?Q?/IcxoJOI4f0SdA5NdNJcmCtrVcCXRKFcaePrDXwkEFWetI1OVYPFBKvieTpZ?=
 =?us-ascii?Q?73hTVxx8bldk8osPgmtZSGMZzOuFhhPpujtF7cA1i6z4C6Mk1UdOdmEM7a/U?=
 =?us-ascii?Q?kgMNznWGmzmLZDxEaeQOZamG/9srD1lgc1YG1Zsk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b3a47d-ccf6-4ae2-a1fe-08dd0848b8d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 03:17:38.8261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dSR/+bEWXZvVGT+zSYtWa7bHLoBcGIU1Ypc7gVGEf+vybeh9SiJq7R9rPpccezm7PrPM5S+WuUQlja3eaz8eEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8221
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
> Bhanuprakash Modem
> Sent: Monday, November 18, 2024 7:45 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Swati2 <swati2.sharma@intel.co=
m>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t] lib/igt_kms: Clear all pipe properties on reset
>=20
> Just to sanitize all properties we should clear all pipe properties on re=
set.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 76f32e1e0..22b6534e6 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2612,6 +2612,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
>  	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
>  		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER,
> "Default");
>=20
> +	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_VRR_ENABLED))
> +		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_VRR_ENABLED,
> 0);
> +
>  	pipe->out_fence_fd =3D -1;
>  }
>=20
> --
> 2.43.0

