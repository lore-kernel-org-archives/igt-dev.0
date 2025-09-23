Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39ACCAC5A5
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 05:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A23210E563;
	Tue, 23 Sep 2025 05:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUfpllM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D0C10E563
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 05:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758606052; x=1790142052;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2/e6ekMh9EQY/VkE/IU4NftTga/I1eHV6cCz2dWyW+0=;
 b=TUfpllM05pz4CQLcPHgLHvwLNMXGpn9DdAF1FnI/PH7EnqcnSjbFFCnC
 xxztcRl/IfnXaxE/EdyZJG2773R2HpsLr8HDuxWGUj2rSecltbVZOHeDZ
 3e8fCVlU8w4TVhN5sm4p6oA2OhPWyTkW+savDzXL6Qa5mtVojVJYqQ3ae
 Rnw8TDqoZbZun40lD2fdBPNka7t/Jsf8mKd7HcvS2nOtGRHWGkWDtikpY
 8QjSiCFZMK0cSOJit8tf86hRaemqRkg3B9lOJgjvkZE18dK1jwD3yFFp1
 7479g9MmVG/mSWQbeJUWgEsm1I7YGZb6lmpoDCCe0gje8LvLUCzutL/Ja Q==;
X-CSE-ConnectionGUID: HTMPifekQGytD3cLeR0h0w==
X-CSE-MsgGUID: q8u9wdRwRQSQHaaCrBh4MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64516851"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="64516851"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 22:40:52 -0700
X-CSE-ConnectionGUID: +QhXZoLdRnK/dvvLDpy55Q==
X-CSE-MsgGUID: n4DFuyFCSB2SAPJyyoDvvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="176254921"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 22:40:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 22:40:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 22:40:51 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 22:40:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3JkgaGTcp0Q0OTtyvLNLhcjJ/G2bRawOym46j5jqbZp68WvxffuWwCDeP4acsoKGYqJvrtERgvJgfYQoPsGIwfukxUua54YO4Oq3uXibinbzcOS53oQQwbZtICRwcD3inLOinpTafKc+RTzPoK4/o/rPrH7lLrR32qSSda5z6q4k34asSt4Ssz59bbKNIHM9pFi+S5XKJsUw31ijPtIX8b9eh5a5uKPOKY9d4QXu/QrZ1h5h2dW11at8xXKFOzEKo1v7RhNy3A6THuL7Ydbb39AHgiQha+YEKxhyhOPy4RYIqrIHNsZq80ICDx1nLEf9RVkH+H623zo+o7KxE94kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9e/x+H81CTglP8gBrZkBPjarxlBEqQDgTEwyI5kQYaI=;
 b=UjrD/KFCzsj/o3rzNWowkC8jAIQgHJe8emC/ElnmSdAXRy+6weOL9bAHpD7VWEQ0EnpQ/dfmHq+djOI4aVHCazWXaaOnsNp4tElrquBrrOE9KWdKbWHLSs+aOowg9zhu0uCqOkL5j7tBtWhEpt2RkV+hjZBvEPY8maMBhTkdbmoofKzLO+WNixW6Nu8pie1C5udKpm+30DSfQx7xCxR21vA8pJUxgA4M4CbR7F1A6ApUOKQcH/Q4IJZQAfIZxq1R3GGG6hsCoTq0YC4bDJwzpR4uppGj8nz3wWsuHiU7AwlHSwOJJqwjUegAs2/AZe7et78zHSyiIyv/INZmR4genA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB5197.namprd11.prod.outlook.com (2603:10b6:a03:2d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 05:40:47 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9137.012; Tue, 23 Sep 2025
 05:40:47 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend idle
 test case
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend
 idle test case
Thread-Index: AQHcKM6pFlG+g0gqXU6y5rf146nPo7SZTRMAgAb5lBA=
Date: Tue, 23 Sep 2025 05:40:47 +0000
Message-ID: <DM4PR11MB63120CA419902E603E263AB7901DA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250918190105.37420-1-mohammed.thasleem@intel.com>
 <20250918190632.37576-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250918190632.37576-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB5197:EE_
x-ms-office365-filtering-correlation-id: 74cb1e73-930a-43a3-8b32-08ddfa63bf21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hGgM0tJqaVuUP49ooFdJYxJWwkfrCiX4H7rmmaFVCzdsX1e5jpRX265al6Qy?=
 =?us-ascii?Q?YtdV0okCn+hrvt59uw1BW4ujMRAp4SrkOGM/PswIhdGrs7+hBsVt49jl7q5n?=
 =?us-ascii?Q?CIHlTh8tbWPIyVShSUMslTypn9xB0Z++JgOqVF6XDPk/4z4Rp8lfUJ7ckI4+?=
 =?us-ascii?Q?sU5Ho5wci/MhVoiiGe9WQcx4gmJgGyHLKLE9ZYyqx3BRSHfS2/dErE6fEsrv?=
 =?us-ascii?Q?iJtKnp9WMig86Kf6t2MazmNyMxihSac7sSrSf/kgADPEmU1Kjem/6lD6TTTy?=
 =?us-ascii?Q?MPp7BmJeMvdpmQ48/l1+D6ORCUMx7Qnu6Gg+ZN5hJb3Rgdgm2NLxOisG3WsJ?=
 =?us-ascii?Q?egY8ZVWKzk9o2Q4P+CaNMAY9YVRTy4HzuXwiInH9F6A0GYqZc5r2rSpmt7gS?=
 =?us-ascii?Q?BCTukWyyUSFHyPuPDL4BAwROOAkmdKxRwEr1ar1DoJLATxtAJ+K3aHFlcEgf?=
 =?us-ascii?Q?CgsKeTCNCdlhCoC4emFsJY/KeWsM3hXr9xEanWBh+lkrwHusGAukoss2j00q?=
 =?us-ascii?Q?TQwyW7B+t8l0SAckWf5fRFrGIi4CWxdzLzxyuGo5Czf8T6d6NVtRCybIuI/d?=
 =?us-ascii?Q?fsWbNEtx4HWbjXNpSxN6uSbUFb4txVw568x5S6HA2OgX36SXZWENGhf7PgMH?=
 =?us-ascii?Q?HLRW5SGk6O8hij8fOa7IZHwTQH46DVg+zeKseTDIwBeRgy6M7Xx2DSXttgb3?=
 =?us-ascii?Q?lLek7urek8xQbV3HyyGXD0Ccfcc9Z0H58lFfIZxuA9ZhfH7fNYfjaUwFQiH1?=
 =?us-ascii?Q?7eFuddTSmaF+1A5eTRTc6TAiKoaKn3oM72gn4BvrmmLet5FGxQSW1rA1DOfl?=
 =?us-ascii?Q?4RT+nLnl7YAVc9o6By2aSnJ+xJFDpno+8lpjCdbNvgu4hQvGqNsQfLAdHNqh?=
 =?us-ascii?Q?Qq6TVuEjYIV/Nl49gsuWCBMOdTdkuyxMpEJTI6dMy3TvKoj6UHw29jsD38BV?=
 =?us-ascii?Q?bKh2nm90H7mWwziFkCzv7scDrC0ZPbzoJLiN+o6jcJnqLMVVQguzrtcnCSzP?=
 =?us-ascii?Q?yTtU8DZ0R12uKAE/6pBqzfj/5+PoUTu9QoNvJquOkFZi7A5PCT6L20T9btA3?=
 =?us-ascii?Q?1roVmtaD3TXQVGZ3+/PL0KwfrRNAccSxZ0fNlOHnuVsoTeGKxpWomPm56qa+?=
 =?us-ascii?Q?2AXMyrApk/kx5VIuSK32s6jLv5jqdgfh4rfAke17lSElpbCFv9y4P/4IGG/z?=
 =?us-ascii?Q?GDUo8YOCfS3jCYO0PMgFqUcYoyxpRtlSlBNZvi5/RUSAFGhJtb2+fN2kipq0?=
 =?us-ascii?Q?dkv6pLxpC3Ukz66ygOhUKGxUn/i0I7grCnMofczxNeY6koZiPpRKTtC85iqd?=
 =?us-ascii?Q?r79RY671pyNF7RnObAAH/ffvLvRkryXR8hUe6seW9okPPSXvhC6K2MY/kjMh?=
 =?us-ascii?Q?5GurlX3yeqbEYUG1BvRjpSLZY3+ap2X8YJ8LEZnyyBpKoPvl5+rLAuBI+Ws/?=
 =?us-ascii?Q?XEfoPlaz9cwuus8nytL/d2XL7vJn+AP2FzPU/LGQrZ7W68vH2a6lXw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LlKfj7yX8xaUFCLLjJxyVsVeVhJ1xz5ypBWx1vayhkbSGRfRBp8+F0PTe7FB?=
 =?us-ascii?Q?KvBq7xIYLSc9xARR0PlbqslUbhtpW80Af6VvqIq/eWUDB4JEtBoRceUAjwOW?=
 =?us-ascii?Q?5Yud4y6T66CgMz3oPkMZ83hXGnDN6ht1dqTx4y1ScbbNtyYW3/LufdiEJb1r?=
 =?us-ascii?Q?cCEVddX1PNhvByoQti9YT3crJfUPEhL+FFcqNpLE1HVs/R9/pCQY5VEFMfIw?=
 =?us-ascii?Q?RPv4LJCG7VmUxHWxtNxGoPtblXiZzfWlQP2Ax3Osi1AWWDOo9BCLroFO/9NC?=
 =?us-ascii?Q?JJTrbB6w9viBfP5NAiQTC2bgObdv7WMPVV1w2X+VLGW88daG0wvtWIAXHKBP?=
 =?us-ascii?Q?MtkAOGT42FL1rX72ZS7mbA/2E6fyrDhYo31xD3IU1HsJDgIdB4zyfnLg6bva?=
 =?us-ascii?Q?oaDUqEekxmotdCCM2PSR/b0GgyH/AlTDrPEI/LVNxX6oYwLj5QHhCnXUtuGN?=
 =?us-ascii?Q?Za1NxDbJeyRJScd7Ak5B181JN+ZKJ3Jn+cv3i0rkzjS2JaldhldwTrptO7PG?=
 =?us-ascii?Q?BDSkT2rh3p4QadRcrL9lOqkdW9IanxhPCvpJJzVVGMK/pgnBIJZDJ4O6La8m?=
 =?us-ascii?Q?eyxyOl4IvueEo7vVhX3em6EEN3CAbYgx8Mlsif6YHgIaZqt4QD6SRwL3ClAO?=
 =?us-ascii?Q?pUFg/Q5AIrJ7tGYd39bhzRbC9BCzrDTxFA6sYzzkFsXQ/fxf6i+TIrnO5IT6?=
 =?us-ascii?Q?o7QRAqRrdlRP/Z9UZvYDmQ4cy74lOaYcq97TW6G/aWuvgrvNXykZdeEHIpC/?=
 =?us-ascii?Q?jUhd2ohE1D9AXLrTPe6r6OROk2cwmeFK5TBsQ0poEdblO+4nV252c5P6mnOt?=
 =?us-ascii?Q?OaBpoo1tYcPDBb25yztJ/K9oFxOlK88bhofWskdKnTr6Nno2MZkVrtWb4+5j?=
 =?us-ascii?Q?owd+YJOJsqHMw5KMTFzRQv7B+MrZbS1KStMMIslqUM47VAzPAdeT/3B29ity?=
 =?us-ascii?Q?RIRsmvTUQKW8vtPWNwiLWDEDESBH8OidZNqK0mbA2a2WjLWiQ3MFfeUbLNha?=
 =?us-ascii?Q?30IKOWre8pKY2GInv81mtMeInZ9IwFPB74tCs7G7p9t5BZP+iEHTDNlIFsfM?=
 =?us-ascii?Q?N0T5oNd18SzJaXjhZI17GWf+Ug8o2cGCZBYEyk34lDz/g/qd9Ah73yRPVwU5?=
 =?us-ascii?Q?5YC2dL+eU9+RYMs9/xs35rWf/LiWfZUlLbYGmk3/IPa/DymlD24zuVpqssqx?=
 =?us-ascii?Q?UBCsO6U/EcuJHd7hJGxxvFXBlL9oyuM9tni1vrpMRR4o4BTI38PHw3VW1g2B?=
 =?us-ascii?Q?3Qi43yfG6PcOOu3n77Jvxf5+9J/Vip0MEi+AY9RT5ohcXNrgrd0+ROfYMlgk?=
 =?us-ascii?Q?Hyzp18VDfGTbIBJ58X0ci97XTDIa+XM4wiL0TF0HwQhiPLCi4nUCNCWEDiIw?=
 =?us-ascii?Q?uG3o/BUTMwoLLBOuePH3w+T/ARHITueqR+QiiTPyT2nt8xX1o0fK9ExWGGpv?=
 =?us-ascii?Q?2Pz+Ya1dHbitkp32YZpHUU6lsJUrvIe+EsurbpvW3rg+Zp4VaRZHdn0hy5kY?=
 =?us-ascii?Q?m+uZDOipUhbG1dtUguhZ/nrXjKQ9ZwBYuO/o1xAKrOGgSTvgeiGK3u4nqp90?=
 =?us-ascii?Q?JwxKjEJpzUaOS9Dg0dc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74cb1e73-930a-43a3-8b32-08ddfa63bf21
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 05:40:47.1428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e9zA7FXTGUXvG4tqN7g2dBQmOaqCbIqRGUCAyArPK5Cy66GFDuFzJgZUisT5vQlRuXIY/YLVD9REPEjTX9Ickw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5197
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
> Sent: Friday, September 19, 2025 12:37 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend idl=
e
> test case
>=20
> Added a new subtest that tests S0ix (suspend-to-idle/freeze state)
> functionality using SUSPEND_STATE_FREEZE.
>=20
> This expands power management test coverage to include modern low-power
> idle states for comprehensive suspend testing.
>=20
> v2: Update subtest name with system-suspend-idle. (Kamil)
>     Update the subject title.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index
> 344ef8c94..1610404ff 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -128,6 +128,9 @@
>   *
>   * SUBTEST: universal-planes-dpms
>   * Description: Validate universal plane (set/unset/change) with dpms.
> + *
> + * SUBTEST: system-suspend-idle
> + * Description: Validate suspend-to-idle (S0ix) functionality.
>   */
>=20
>  #define MSR_PC8_RES	0x630
> @@ -1685,6 +1688,9 @@ igt_main_args("", long_options, help_str,
> opt_handler, NULL)
>  	igt_subtest("system-suspend-modeset")
>  		system_suspend_modeset_subtest(SUSPEND_STATE_MEM,
>  					       SUSPEND_TEST_NONE);
> +	igt_subtest("system-suspend-idle")
> +		system_suspend_modeset_subtest(SUSPEND_STATE_FREEZE,
> +					       SUSPEND_TEST_NONE);
What are we waiting for in wait_for_suspended state, is it same as SUSPEND_=
STATE_MEM which wait for
Some dump/check pc8. what is it we are checking for FREEZE we need to provi=
de more info description if it is same or define the test little bit more. =
=20
>=20
>  	/* power-wake reference tests */
>  	igt_subtest("pm-tiling") {
> --
> 2.43.0

