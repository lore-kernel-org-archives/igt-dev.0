Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB1BC982D9
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 10:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388BE10E044;
	Fri, 18 Sep 2026 10:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9dLyQD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A7610E044
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789727728; x=1821263728;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tHZHJ+RnRBU7xd+Swfv1KQb8c58Z+VHBcZhUvz61Qp0=;
 b=g9dLyQD0w7FuYPiZ9QfUOlD7mBaEdGjHFQgMze6E0sSxA04dHs0M6Kpn
 Plr9RNztk/QoUvrI2pVZKV6Z/1XDEr24iUBzD2C+8jFIINA4OgLhtI5bF
 Fqbx63O198BA3F1bIHKrveTsVMOl51kppkFo9CP+p8E1MoDM8PV6V5b4n
 5PArqj/2Se5+M2AbiHPKeBOGyLv78El6F4YbEFhwVmeaK928f0lD8C+EP
 kRAvEWfWZ6Vl5Boiy3fEdSKAXJFJfmMWQXkZVUcFvfxCDCrLz6r6F7O3w
 5A0OxN4mvlqW0Y7kHZw+w6qYRKfnTiF0Hd3gUj26kvrteOKXtMy5K88yi w==;
X-CSE-ConnectionGUID: kxajrHw0Tb6bgZQWoX6lzQ==
X-CSE-MsgGUID: Owd58iHKTvGnanbbW6jc6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89156178"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89156178"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:35:28 -0700
X-CSE-ConnectionGUID: Md7WTZglQhCVEPZnrqcdQQ==
X-CSE-MsgGUID: +5MeviZzRxi7KLrhq0Pczg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270656557"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:35:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 03:35:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 03:35:27 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 03:35:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hO6rzKDmcabS/tLQqWiEvauoiU0O4HGeZC07C1QJAOlpzYx1MEaK2g+zGcSZG/L/iAQ3nnXJSwoakaJ65J991j6pceao/f6z8ThG/J/SJKTvFHBgwnDT6Q2NleIGeu8TAQbyqUqjAWS6tLYDSEmLUOFIKW9VNoxQj7nE6LAMLf6wMDRGoaAPxLzBbXCzbNNHb1CU0pfusVr9dHZ1DJyahbWlW0zLb6N5Vq56B1SXJ6nb5CrRViFw+9i9+bWo8VYhSW34ZpDalalPGYauJW2DESboKQbIliJbNljiK4V/rs5oByr6KVt4JeHqyqkLGBMska1rk+4tGcNWiq+zgc0Phw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBk/13shSzX9EV+jqboieYaqAq66kNDzshVB7qq8yTE=;
 b=r9Zn3uFNPOS9xGVMRH1AEIEpvtVSPqiX/5OOSUMg1155Og7V6eZgitiY9r8tLddt1DtTkXDwR2QnandXVBodftrKVUS5lNSF80T2ZTZ56BFpEvA6lfyP9SjnD063znTYMrTvj1pn7/W/vB1eD1lmzn7RO63RQhMj1jHwnpOXWs/KTuzkTzHlDnJZ+Ft6pynIAnOymYLOEubRAoaw6HZPWkZkXJFGK2SZfSXEfoONpOZi6GZpF00oVm1siSOKsemay6tyL/DyOx7gPhNOXdOLXG0QJHtxlTnG9+rPoZbyddZLW/z4o+bUFhUgHCazSc8PXYJB4geLkzi7sJoFJ/uTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 LV1PR11MB8792.namprd11.prod.outlook.com (2603:10b6:408:2b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Fri, 18 Sep
 2026 10:35:22 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 10:35:22 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Golani, Mitulkumar Ajitkumar"
 <mitulkumar.ajitkumar.golani@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 2/2] tests/kms_vrr: Retry LOBF detection on low
 refresh mode
Thread-Topic: [PATCH i-g-t v1 2/2] tests/kms_vrr: Retry LOBF detection on low
 refresh mode
Thread-Index: AQHdPwFbX3KKCfps202E0SPcdZ/od7bUNIWg
Date: Fri, 18 Sep 2026 10:35:22 +0000
Message-ID: <DS0PR11MB80492B92AB23C957951E244DF9872@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20260907194229.3170868-1-ramanaidu.naladala@intel.com>
 <20260907194229.3170868-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20260907194229.3170868-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|LV1PR11MB8792:EE_
x-ms-office365-filtering-correlation-id: 5afdaa73-6ff2-4716-2783-08df15708b30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|38070700021|11063799006|56012099006|4143699003|3023799007|10067099003;
x-microsoft-antispam-message-info: 6eJeIxOY77sLk/klbaFqroiv+LgonQMT3/qYbyfCYGA9RoleJzyFODEsjmLOr+V16iAA1T6Fv7FrpD/d1pqLRsIl7u3whfM3nsHS6uB5mX6nBZ0LDQyZsEOgVXD/u9disUD2YxKotdIkEsyLCGRijCD+W05ngMRzkip5yNEO9VHDRaMVufII3sitzor1WXzEKYap/nqgZraFXZSCCVtIZKARIL5uW7jgDeDo40mqvD7P6f8FGBdi0w4MCFqYw7hzUlLPEq5mVNXR6Vd3YBiizxRiz0K45WWaw8ViMpjdruLEbt4VFGNTdXyS9Tf0cgkfuB0YVX3xHiwK+XOqQ148Pfw1VSkeKnD2SjkiYksMxYE9dqRDaYTXoDRjnoEPKQnYwyDoYzgBrGH2D3i5xJGwuE8GROW6WaZ8eF4r3P7sZPKmp7M1sTfaEw2565YYxsI9OJCD/AMZudAQ6hoLOpVF8csO4xtNlRC20OZYVh3PaHCz9tx/g3Trx0CL8n1i7+BSZTA0fMhaTDoYu7kXZnvXNHdLHm4/dxkwzY01/W5FilDzcgljPeIPP42/BlfozF4gwFjSU2kDTWUTb0TTQmHa5iavBHYxl2znYjzibIYxGf5fC091FNjcLBga7WGUAw2vWK/ZykzGEVc2BkZCcDNBnvRzKyWgWVrKnJ/N2Crd2l2M+tal8N3g10TJ99FjDBLssiN+C0vIWWAiO8zC9Amp9RMGxfl9j2MzWdix7/CAKpI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(38070700021)(11063799006)(56012099006)(4143699003)(3023799007)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?moO3HdL6JI9P8kPqDlAkpJLLZf8MMUzJ6dLKUzkmL2VWvDOC9C0Brl5Gics+?=
 =?us-ascii?Q?j+yTqxRsyeUZr8WG2NlrdtCfmANG+/HL2GNReMViA9tevQW7npgILOJWugjr?=
 =?us-ascii?Q?l8T6hj32+0Inz7CAduS5GiOf2I5KJ1SB+m3DBtmykusYkYJ+6/fpuPebPDMg?=
 =?us-ascii?Q?fYQ9gqnkYKIBhifO772ui0XiW0UPKSJd9w8teBPJZmOx2WgNj/f12tL4n2pl?=
 =?us-ascii?Q?aBfEzJgOEznfdfbBbjW3wkz0LVYvoB3rwERqR7UDqI32H8R/Er/GevdwYwhl?=
 =?us-ascii?Q?H1WJOi03azHByLDXLobiC8kCrkp6DysiP2IGAGgFyGobgRB41Nvx2RgoL/UY?=
 =?us-ascii?Q?6PMjKZimZrlZbLN0qmFUJaxi0D84zklY7q6jQAwH4rFEeIPJsp1WKxMCTVRQ?=
 =?us-ascii?Q?g+FN1P2jIOnClZQaqXtwMqAPFTGNwLVaW2K8sgq0fIMkNtA79LVVbIF1Ojo9?=
 =?us-ascii?Q?v4jWRC6i5nYGBmsEgrPdwByRL5TO6Xwh5QXqESJhkQCM6IeNxcxmXJslZC4X?=
 =?us-ascii?Q?TxmkMXHlNYSE+9FcoD9Kt/UoRJxjivi+q/070uvPFCD2xQE2FIpsfbOvaqcO?=
 =?us-ascii?Q?Wsl9PSilnheXifFvtVcd6o0qg8w5OsUJPazwEQkfJDQ9jAnaP25PzTr+/zrp?=
 =?us-ascii?Q?Q0cso5+GJGH6FLT+OKlzPebE9wd7MGpR1gr2K7Z6bNZeleDSTW2YGRKK46BN?=
 =?us-ascii?Q?38AeEYFarGavbvzMJlNGJioUudU0OoA63XLbMPsVGFVOr11UbRihDzTUoghx?=
 =?us-ascii?Q?GX+CPLDsM4/Zsb7j2cDdVq+lQo3wBKgz+4yk4p9Zmf9TBdwn4GQRC2AFOD6Y?=
 =?us-ascii?Q?439gWkgkOlIMysaF6aRC+pEsJ0hMyT7K9bKqnkKJS/BI3Xr21YFJBXE0MGdz?=
 =?us-ascii?Q?HaR589NGCbU4dAP/FjCfDafRQql5eWCDsZL9+Co2NbXD13LMpdtE1Ishf/v9?=
 =?us-ascii?Q?tHq58YBI5C6ejjX/AfSVYO8UBzRrbRCrv7rTHDDwe40x8UMRNZ3EtAL9rKMb?=
 =?us-ascii?Q?FibzKDA+fRkBZZUclXhzloGa1NRxSxpAmNZuWl+63dNV5D4Q2MF2+n8QuQDy?=
 =?us-ascii?Q?4uuzN26JUeqYlgEPa4tqvW4OI3t/D5a6uu8VE2GrfgloYLrX6LbhPf5W/JZP?=
 =?us-ascii?Q?JtnMeAb7nIvklD+gZpkrJytUdwrV/oviHXcodNI7vUq7Bs3eJg187L06G+Ax?=
 =?us-ascii?Q?HdtDmIDxx5QWU7E+HMOhhx5X6OMabsBnuXiwl5cpDkum4clB6TsILjgZJPHR?=
 =?us-ascii?Q?NGLBwdhZGYNjK90bAtJs7rjD94voek0Uy0k14LTXvrzaBFKbxo6YvUI/fHK9?=
 =?us-ascii?Q?ZmX0kMhRPsUJCNbHupV79IOb5X/av0Zd0uPFJUOOspqLj9LWrBEeOKItanW4?=
 =?us-ascii?Q?P6CqvfM4nXyhh8zI883cDiTx/lPqy0YT0bPT9TeKpIGAoxrefd0ZppR0Hh3S?=
 =?us-ascii?Q?kzDJjXmx19GR8EVOK2HjNvTLWrBt7lgkxsAFPuVPwDSKQviYWKWAmq+fYSMZ?=
 =?us-ascii?Q?aMU+j2WHy3TUcAyLk5rAGlig8P35niHUgsihP4arS5IaUpz7MJufk0cIoeMZ?=
 =?us-ascii?Q?FKiMwIyqlfEiLJfoNDnWfvJjWURw1YiYaUZnn12ipihk+VErEBOC4wkXJK2L?=
 =?us-ascii?Q?m4OKlmDp/6HX+2uQAxFF1e+aMFA8q5cikEKK0N9/t8bd/gQJ10JTyTfYHz8I?=
 =?us-ascii?Q?RDCIjBjoxqIKmtT28QyCC3dQejBoSWzmTlys9gn2q9E+5oH9J3u1ufCd06ib?=
 =?us-ascii?Q?LWXqk9cr9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RLo9aISulxzdTXgjlc47xKJej4tQs00m7u+nUJv5i5HL3cN1BmLIAhFj8szbpFasfo6sgaVIUEPbVxFwNSxjIrWWtwZ49PQpbtQ9xdPoPO5ExUPS5ky2VwrLMfWMKFLc7N9N/GUj7QnCbngy1tT1QswBghUBrlsP6srl+YEGmlX3HqEWLNJLhTG7ibvw5NXbXjeVhRrxi+DSw+9jqlpZa6pbksxeWjkt8sTWlUCzqMUyYl0/KI0yuYfBI38e7xHw1kDHbiUE/oE4BF3b6sClH2YK6qJoQOMO/oHJYI1HZdgOrCAPafMihWJOs49B+9iphCM16eukawyKEeto4JFp8w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afdaa73-6ff2-4716-2783-08df15708b30
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 10:35:22.5215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RVPd06ZisKBY+zjArmyILPLOMU7HdYCsvFU6T8kjZFhbCqRmPO/yENQjZFY/MMGdelrJKrt21EiIRg/Wyi/JGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8792
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
> Naladala Ramanaidu
> Sent: Tuesday, September 8, 2026 1:12 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 2/2] tests/kms_vrr: Retry LOBF detection on low
> refresh mode
>=20
> Replace the synthetic refresh-rate sweep with standard video timing rates=
 to
> better reflect real content playback patterns.
>=20
> Commit the selected mode before running measurements and retry the
> validation in the low refresh rate mode when LOBF does not engage in the
> high refresh rate mode.
>=20
> Assisted-by: Copilot:Claude-Opus-5
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

LGTM.
Reviewed-by: Animesh Manna <animesh.manna@intel.com>

> ---
>  tests/kms_vrr.c | 74 +++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 57 insertions(+), 17 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 27f18e8d0..6250ae43f
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -31,6 +31,7 @@
>  #include "igt.h"
>  #include "igt_pm.h"
>  #include "igt_psr.h"
> +#include "igt_vrr.h"
>  #include "i915/intel_drrs.h"
>  #include "sw_sync.h"
>  #include <fcntl.h>
> @@ -815,6 +816,46 @@ test_seamless_virtual_rr_basic(data_t *data,
> igt_crtc_t *crtc,
>  	}
>  }
>=20
> +/**
> + * lobf_flip_video_timing_fps:
> + * @data: test data
> + * @output: output under test
> + * @mode: mode currently committed on @output
> + *
> + * Flips at every standard video timing rate, from the highest to the
> +lowest,
> + * on the currently committed @mode. Rates above the panel refresh rate
> +can't
> + * be driven, so they are skipped.
> + *
> + * Returns: true as soon as LOBF gets enabled, false if no rate enables =
it.
> + */
> +static bool
> +lobf_flip_video_timing_fps(data_t *data, igt_output_t *output,
> +			   const drmModeModeInfo *mode)
> +{
> +	uint64_t rate[] =3D {0};
> +
> +	for (int i =3D igt_vrr_standard_video_timing_fps_count - 1; i >=3D 0; i=
--) {
> +		uint32_t fps =3D igt_vrr_standard_video_timing_fps[i];
> +
> +		if (fps > mode->vrefresh)
> +			continue;
> +
> +		igt_info("Testing LOBF with a %u hz flip rate on %u hz panel
> refresh rate:",
> +			 fps, mode->vrefresh);
> +
> +		rate[0] =3D igt_kms_frame_time_from_vrefresh(fps);
> +		flip_and_measure(data, output, rate, 1, NSECS_PER_SEC);
> +
> +		if (igt_get_i915_edp_lobf_status(data->drm_fd, output-
> >name)) {
> +			igt_info("LOBF enabled\n");
> +			return true;
> +		}
> +		igt_info("LOBF not enabled\n");
> +	}
> +
> +	return false;
> +}
> +
>  /* FIXME: test_lobf : Lobf can be enabled when
>   * (Set Context Latency + Guardband) > (First SDP Position + Wake Time)
>   * one the depends patches are merged please fix this function.
> @@ -825,10 +866,8 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output=
_t
> *output,
>  	  uint32_t flags)
>  {
>  	uint64_t rate[] =3D {0};
> -	uint32_t step_size, vrefresh;
> -	bool lobf_enabled =3D false;
> +	bool lobf_enabled;
>=20
> -	rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
>  	prepare_test(data, output, crtc);
>  	data->flag |=3D flags;
>=20
> @@ -851,26 +890,27 @@ test_lobf(data_t *data, igt_crtc_t *crtc,
> igt_output_t *output,
>  		 output->name, igt_crtc_name(crtc), data->range.min,
>  		 data->range.max);
>=20
> +	/* Settle on the high refresh rate mode and sweep the content rates.
> +*/
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
> -	flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20
> -	step_size =3D (data->range.max - data->range.min) / 5;
> +	rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
> +	flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
>=20
> -	for (vrefresh =3D data->range.max - step_size;
> -	     vrefresh >=3D data->range.min; vrefresh -=3D step_size) {
> -		igt_info("Testing LOBF with a %u hz flip rate on %u hz panel
> refresh rate\n",
> -			 vrefresh, data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
> +	lobf_enabled =3D lobf_flip_video_timing_fps(data, output,
> +						  &data-
> >switch_modes[HIGH_RR_MODE]);
>=20
> -		rate[0] =3D igt_kms_frame_time_from_vrefresh(vrefresh);
> -		flip_and_measure(data, output, rate, 1, NSECS_PER_SEC);
> +	/* No content rate enabled LOBF, retry the sweep on the low RR
> mode. */
> +	if (!lobf_enabled) {
> +		igt_info("LOBF test execution with lower refresh rate\n");
> +		igt_output_override_mode(output, &data-
> >switch_modes[LOW_RR_MODE]);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20
> -		if (igt_get_i915_edp_lobf_status(data->drm_fd, output-
> >name)) {
> -			lobf_enabled =3D true;
> -			break;
> -		}
> +		rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[LOW_RR_MODE].vrefresh);
> +		flip_and_measure(data, output, rate, 1,
> TEST_DURATION_NS);
>=20
> -		if (vrefresh =3D=3D data->range.min)
> -			break;
> +		lobf_enabled =3D lobf_flip_video_timing_fps(data, output,
> +							  &data-
> >switch_modes[LOW_RR_MODE]);
>  	}
>=20
>  	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
> --
> 2.43.0

