Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CBECCD19A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 09:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1CE10E443;
	Tue, 18 Nov 2025 09:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgBydPLm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CD410E443
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 08:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456399; x=1794992399;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KvFf8uvhFm4myuHmgPbRq98L6O9Uvgnr0kDb9p7L724=;
 b=MgBydPLmq/1ZN7sgTTTXPo1Ikzbd18xH8gEze/WGGxh1t407u8ZXPAtp
 Cx/cHXEmuCHvExC+zyHX+/d+91A06jqmxCvFaq1Gx2Id1Zr/Ss89UgCCf
 C7wFjbeYLpffLs1tfjdDW9gJ6y9USNVpdVVB0cjM1bdmtiJ5gzkUfOVps
 7HbGfhA5/Ru7mOtXNfrzCRef64dyzrKJRzXk2hV0/E1zapqHGezg2YvLy
 UyhUBsV1VOLgWHBkkuEnpV9QHynHSOX2Abl4p1Eyka2lye5Ti7BxwCXBh
 aGBRggSNJrmaxC6dlTkcTA52G49NZRjQ815VuL7pfx5zCGkJJN5bjNwAQ Q==;
X-CSE-ConnectionGUID: KwaEPQekRNK/UJpZwKmzwA==
X-CSE-MsgGUID: 9oK/O+tsRgGWRNuZYtWYSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69340963"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="69340963"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:59:59 -0800
X-CSE-ConnectionGUID: 66rj/RhbSPqno9vpvBy/Nw==
X-CSE-MsgGUID: 8cdyYVpzSKq1ekX0nfRuog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="221365946"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:59:59 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:59:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:59:58 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:59:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZJyeJW6/wkIOMinhnv2nj9tTYJMf/1A8E1qIWVNIBd9ZBeEF2xXJlHnGPGJjCAYGZX69i+a7NajBlnT9ea1iCiFyK8tOoCon0daPpkLaJjeWCv5pshBZ0aidJZehPjjRaX7OoDCcOGsY1GQNyZZUQKvxrzRXJVL8/H/4NqyNCoCkXe2004uIH7LBjf6Cch3Mi66U1hXG70Upp9mqEhyLJdKbWTrCdgAj5ZcoIZFCHdaCyYmvk36coCM1qh+58dMIug8XLlW+3DUSWyAbblkDrlgwZcwIz3YE1hd3NXnVDyzVlSYw7xez4al426CLLERp5k6yyQpiy3JEG+3nyqRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LFjteu9PX+wqfun4LmVinPa+RILfiZ+mJxK0U67avU=;
 b=EF5Jv2AdcfFaVWvN2dF0oVJ+y1sHl2zTAnkjUY+tDy5legIef2kC4QEna5JfM5krchqnZHYI4EH/2/ygqA6HAv5+pjKRsGO1I3HxIWU0qAP6eHgeGd9WfEJpXzPXV99cYRPCHtWqq1A+NrLJ9dz7qEGPjdkIOaQntWgmnWIjSfDIXJl4z0olApLNKGWMvVmYuuedmWFXuofSTYhEUA5ZuVzn8d0JsiCKFpWAXDJcdxGJo2dgsY8N7DRZLGZMZtiDLsZMDpzW/W7t2kgFKx2/bzxHyxKMgaZxR5kckQV/WAckcTjPG4vGbztrow6pRZ+CNu04S8nNVJzBi+Gj8Qop2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 08:59:55 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 08:59:53 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v2 6/9] tests/kms_writeback: Add utility function
 for shared logic
Thread-Topic: [PATCH i-g-t v2 6/9] tests/kms_writeback: Add utility function
 for shared logic
Thread-Index: AQHcVHk2Fyb4Vz2J302zDHdgJWI3krT4JuUw
Date: Tue, 18 Nov 2025 08:59:53 +0000
Message-ID: <PH7PR11MB6053FE73A7043A4F3CA0BB4FE7D6A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251113085801.3088957-1-sowmiya.s@intel.com>
 <20251113085801.3088957-7-sowmiya.s@intel.com>
In-Reply-To: <20251113085801.3088957-7-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CO1PR11MB5153:EE_
x-ms-office365-filtering-correlation-id: b070a4f2-7327-4ec1-a986-08de2680d695
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GGawJzb4uGMi85ggnmizeFifTGvg0DBSkrB8E2iyP1jARvjPDln2yPgYEQmw?=
 =?us-ascii?Q?InUk+C3KG+g5JHN99pllgmz4K9tjHACN5FlIyL+keTQyxTxPeC2D3uCIioX5?=
 =?us-ascii?Q?tStPdpmnyFR+p3L9+wU9NMhWDMTtmjY9j6mQPnh0iT4EWjCtLbhQsaL7+IAx?=
 =?us-ascii?Q?blVnfZlPCA99zPzlnGwjIhZ43vXr91rMnf3Ao5ST4Lo1z4cowb2Yy5l/f7RB?=
 =?us-ascii?Q?WEOZWr+Zm7EqplWhge5052UHLq06t5ztclJTSKuxi6voaD42kLDXr0uLyQbe?=
 =?us-ascii?Q?2Fa11zGx6RtzmxmdtY/ASSz5E1GYsQelAFDxX5aRIroArJWneMmvoF+YwoDQ?=
 =?us-ascii?Q?fkF00Q8FMF462Hl28/NmFdRwcb6y37EsF5VzdwREAg7kNYjVpXW2POeP8fPw?=
 =?us-ascii?Q?17WXXKwnsNKiIzI4DmhWM84sSzw0IWH5xTFdeJDX2Cs42y3H1G1UNoWtqBhH?=
 =?us-ascii?Q?80CwC0lWPc9qyHsAp96amZIi/qv7XX6OA0AiiLAw5oAADZNVil2YEnU65A3J?=
 =?us-ascii?Q?/TlEs+BqktiuhlS+l/Jt2JSLVZOIR9YrFFzJPfcAUw29gI3T613PMVi4fuM1?=
 =?us-ascii?Q?P3DXSmS2NxqHroTpRG1yYXQRxlydEiwETH2pTWfwlXkyx8t9dgOyfXo9XYQW?=
 =?us-ascii?Q?fqNPgmnKOcFoozGJTw1VukILbKFTkS3a6f2aWrBuoDUgz7o2MWwKLzJgzLYw?=
 =?us-ascii?Q?bYBeKaaeXCVX9Lpk7IcQCnUHK8XXx5c7yXAdYUXWkSkRzFohjAkDJYSHet5k?=
 =?us-ascii?Q?CKxs6sHd0Wp5YYICpZmbU7wnDz6pNCV9dAq1UN/o8NfCMNB8M0gPhMcURY9m?=
 =?us-ascii?Q?yImX6Zgbgjf5+VdihC+VF9qDxDmN0ztDZgC31d6fVL0t9RODz7Kz6SJUrWy/?=
 =?us-ascii?Q?9/uNXV3hthzs64OHjYNnn8Ne7dmSGr6CRyl5sQces3GfCNYc64IIQMxzyZ4V?=
 =?us-ascii?Q?d1Qbz7m6hWKhaXV2sfKb/QAETAUepGOPF8/te+8gaWrSPT1Nc3h98eRSxLs9?=
 =?us-ascii?Q?xNBCCHMNpOjrZNfi7bGJjTy4tZqo6BwN9uMClEzggQLYg8EtSjRZLEbirUb+?=
 =?us-ascii?Q?Iyge03gu4PynhitqMf7upfyJyrNOwJ2Avk+M8zgwC0yvF7cEddP9vGlVwzvz?=
 =?us-ascii?Q?KxZgelt/2VNRPXzkxjnh3YDaA+7QxSedh+xhVbJLG771fKluBu54oN+6Ft4J?=
 =?us-ascii?Q?vGq+/l7Yk4D7vcTBI5rAsfeaQ16clypzgl7qsptzilBobDM6xtc9pxrMAqvx?=
 =?us-ascii?Q?6YXP4pGkcsI+tZ2skX9dXua/pPSkuGFc+MLeokg21Y8xNcm0VTAnAi2x7MJu?=
 =?us-ascii?Q?VqahxCpFJ3r7Sh6ZNhaCnT681xqHNfypeXewoH4ElfwtOfNgFn/c8XgNUhWJ?=
 =?us-ascii?Q?qgji+73oEcAvtRdv6Nql4HitCXgRYGq+etSd25Ji2wyTX70/pYpZ1uLjOChF?=
 =?us-ascii?Q?W8ghqsQC1wbneFky050rvkvXA4xczQS41efQ8RfAV3//7KbqB56W8g7P3ITb?=
 =?us-ascii?Q?PaD23E12NcTbJi5qOZ5LC+ycsNa2zM1qqq1Q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b6+pGqTJlILFuELRNYA2qEcOMjlWC5sIr2Z10Gg9eSxN7+63jYb9VbdJeMIK?=
 =?us-ascii?Q?ZywJmltvk8eR1qAQODOZgtgFbGqp170bqoBpYAoyWGDN1lRu3W6GPkgQqV3c?=
 =?us-ascii?Q?M0JU1FlIHWzvHKLYxY+Qx3YmABBzuBfHUst4O/t4AUu1DcxMmecpl27X0nXt?=
 =?us-ascii?Q?6WWPMMxBf+4I9YPtoX4pfQwvKR/urOmtCeYLW04GsLj2Cr+vdS42SpxEVx0j?=
 =?us-ascii?Q?m9ehFDCvPx8L0hCBAqS7yauP5akgSWqBPtmr9C1bqwKPhr7q31WLrYiOaPM/?=
 =?us-ascii?Q?YHFsidHz7ch9nd6+B1nmsLPdHirJi9PdMyI7dxnUgKIvZr+ImqwGrYNJAmmf?=
 =?us-ascii?Q?057O+wqlUS1R4TfFxlWnQVrwa45fYmXBjJZWoswbrVbViNF83NVSGLNNpobC?=
 =?us-ascii?Q?Oo5NmrpJ6yW0ZTOv6WRv7HkiqPHbus84ZTvcUlloHSaUyHmsviFuJTYT0e8y?=
 =?us-ascii?Q?j0DUg45qgwzIc34JwunExxRuTbJK0ROtp7j5/USA4MJWCFlcXZvrdzgFlO6o?=
 =?us-ascii?Q?GQGwem7nlqPcTqLNgCB16QCu9E+D1l/FiLx1O/QKgMrn9bZYSL98iQTsq/yK?=
 =?us-ascii?Q?UaUO48a32F7cQuY+ZLq/VaIfD4acRt/ibYsMKQGNndl8FrVVLNmC9W8uDkpB?=
 =?us-ascii?Q?UR/ZVDY0wq+fZoSLmY/oYPAnSrj8oAI4c4gFHm1flAnD4tjio9AlH/DFeOBE?=
 =?us-ascii?Q?K+7tpTr/U91de5aN0umvu5WzQRiqrMvPeOzBwIwQ+FxdkKxS+QsBIfEYh99Z?=
 =?us-ascii?Q?Kq/sdsgB405Yct3WP9UUHCvScTHD1rjiw62zzdQRLZF3PcZOpMZLgubnHcLs?=
 =?us-ascii?Q?riq9EvcB1kVmv3NV6edwR+4zPdaNteK+WH9qVbE4s6MdB8eaHvfcdevZrcKs?=
 =?us-ascii?Q?aPkcACp4MWEI5+Y0MGFUy7pkaugnqPymLesOrJxjxmECgSZ6l2az6yIlK9ZG?=
 =?us-ascii?Q?F771P6ktnZ7id4snX5Vdd2HUV6YFCaqNd/cm0dkvpoDTF9fvNYM436pWbrOs?=
 =?us-ascii?Q?Mb87aQCWwhQrsPdqIkrsoP/cZMxX3cMS3wEme2hpXJUHZsSPHxCbajroSSKU?=
 =?us-ascii?Q?IRYGo7Kcas7plXttJBrFGD4wSGCsIOkMM3x+EZv3z+pa5wJTLINpjPPUp3OX?=
 =?us-ascii?Q?QfrpgjrDgdQZPq4qB0gjglaYitf+zP9oz+obrMM3UYI+PqRlUbZRdbpyJ6vE?=
 =?us-ascii?Q?kelqAHZ3PZdVN+Sq0svJlTEb7/RX/SvHU9+lY9cJTCJmsi7OSLiEDqsNWSj6?=
 =?us-ascii?Q?BmvjySxMyaIglVf1LFI9V79SOX+fVfwvZt7lBjHvlsYxoHHTyeDPcIGNEEyC?=
 =?us-ascii?Q?IwKKZShjtWpNWWaijlzapABxGPYZldJ2vMLmlc7Xu2X24vfHd7E3r+y7VRlZ?=
 =?us-ascii?Q?w5aj4Ers19v5C1ANZ7fru7ncUHM0vl56H4kUlzgi8U9XRtZv/ajjTZ22BvOW?=
 =?us-ascii?Q?5kr6jhwWu16RJ0N6SOAArbrxtWo2EEYi6a+yEhvKTdI4GKTLl79tBWfBWFsS?=
 =?us-ascii?Q?PqK9h3EoCUDb3jld3PMlMo3Bat2gXsdxIetTekUqOsfiYsEYgg5SWD8j9ent?=
 =?us-ascii?Q?z885tshuFQjm9O4bw5LXiB9mXcS/T3fUEsTvEK6C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b070a4f2-7327-4ec1-a986-08de2680d695
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 08:59:53.0551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G1cCQg/hqEHyqXnc+qYoVWbEqx2MnmAUXmK7OD4NyGii2jKl3TlrPboBJoIoW0VTlpm7IdW6Zi+UClKcP6uHxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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

Hi Sowmiya,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Sowmiya S
> Sent: Thursday, November 13, 2025 2:28 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v2 6/9] tests/kms_writeback: Add utility function f=
or
> shared logic
>=20
> Extracted framebuffer creation logic into a separate function to enable r=
euse
> across multiple subtests
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 46fada8b8..d031a9f54 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -508,6 +508,25 @@ static void commit_and_dump_fb(igt_display_t
> *display, igt_output_t *output, igt
>  	igt_remove_fb(display->drm_fd, &output_fb);  }
>=20
> +static void create_fbs(igt_display_t *display, igt_fb_t *input_fb, igt_f=
b_t
> *output_fb,
> +		       uint32_t format, drmModeModeInfo *mode) {
There is a compilation warning. This function is defined but not used.
Include the changes where this function is being used.

> +	int fb_id;
> +
> +	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay,
> +			      mode->vdisplay,
> +			      format,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      input_fb);
> +	igt_assert(fb_id >=3D 0);
> +
> +	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay, mode-
> >vdisplay,
> +			      format,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      output_fb);
> +	igt_assert(fb_id >=3D 0);
> +}
> +
>  static igt_output_t *list_writeback_modes(igt_display_t *display)  {
>  	for (int i =3D 0; i < display->n_outputs; i++) {
> --
> 2.43.0

