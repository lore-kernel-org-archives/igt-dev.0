Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258E5C52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFDD10E05F;
	Tue, 27 Aug 2024 05:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6FdFJgK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189DD10E05F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737148; x=1756273148;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/skLsZzutNUCF6or6/QqIAbpeF3ArIMdrTPMVhyUxO4=;
 b=L6FdFJgK2NK4N4mAkspnhshoWRQtwe3hXzmp4ssf5Ia/4du8I5n53gxR
 QB3xIm3d4Qii0byXiQ3BVcXOe4dBJMm3uzgBmkfByunisu9cZIvDDiTPg
 ezNVqJJOTHd9IWlhdMFC89O2a8HZW2ABIm6DhrbYIBtElBZ+AnBX0dCNp
 Q1Xu4qLqIHnlqlHIaN6A07yYvHdT6dIhYIdeXTkA7+RPEf/pZtHxTvTzU
 wLlYx1ymQqtWCf7zPCifWoovmmyxVCqpLp13GRrlP8M3tL75br9mUpp1s
 rmpBHUZtQ5QfVWYiS0gHwbULOjagML6f22PsdYLlMa6NmXQFSA2vdvQF4 w==;
X-CSE-ConnectionGUID: 6wpGfI/eSCGvK6YvR3u5Iw==
X-CSE-MsgGUID: 4WhvTl/wT9aq1bmB2ThTNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23076067"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23076067"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:39:08 -0700
X-CSE-ConnectionGUID: oCQ8iOL9Ra+tNhmW8UWcGQ==
X-CSE-MsgGUID: QzkGUD8qRI6hhdwG8WM4Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="63466824"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 22:39:07 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 22:39:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 22:39:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 22:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5qGyI5iKLoPqoCXUoi23h+XOBMGVPxVkLONR+7OAuSRwOJzV2Cy43TJrfmVXg/Md6HAFAtUbBNarao7+glVQZu+bCaR3vZSHTTlI0+JTC/PMpjSbxM+b5pzH4lAzElFQLEQi8Wn76B5KpqpcROPhR0ZaPMO3znea/So0vlwuB0sZeYVNC3W7YUDFK+hSfkcVTn6htK3d0yi/XKbHTdPPmc92KTzFQMHGQ7QM2JUAT83Gn1CYsFaxDPgARiLjbRWckxL1edkW3NWXiAvNj8uCqmm6k8ztInnxz28vz5Q4TxGZ2IbYYrwYnAX5gny5CVXwiQRtPwbh6BTIbzhCl2AbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xb3N3YAlIIvnWf8IxqvjXAe3wcE47yHqp6vrct8hLl8=;
 b=iSGbGWXR0Etux8R0BwPutwTA0b+O6rDQrETFENPztcSm2RLhcuzL94ohsXQzdpgxKR2YRlp961eSbwu6d47HUsqJNX6aUb0d8Jukk1nc6+QF3uzfauH/ICUIwBofdIG8bIUC3dLfbjMm/36eUw9TwxcH4suMrbnEU3VVPvvFUtlXi9ITfxqPyc3bgzO/HVrUhW01m56FrMKIhY5L8ScceUag1jB/Vpd1odGQbHCqvh2I6EAmFhfNAIteLRQpWZKCIP5SbzwpNXKRsawu3w7hYq8VliyP0LdWx0gRdkjUrwoEiETkNQ+ryRNV0of1pI2Eq/anxR6bMGfZeltMTBlxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 05:38:59 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 05:38:59 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 02/14] lib/igt_kms: add helper to get current link
 rate/ lane count for connector
Thread-Topic: [PATCH i-g-t 02/14] lib/igt_kms: add helper to get current link
 rate/ lane count for connector
Thread-Index: AQHa9yiu8fGoXMjF7EmGu9N5P4BCvbI6lmNQ
Date: Tue, 27 Aug 2024 05:38:59 +0000
Message-ID: <DM4PR11MB6312884ECB5EB5FC5791279890942@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-3-kunal1.joshi@intel.com>
In-Reply-To: <20240825200612.4036178-3-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH8PR11MB6928:EE_
x-ms-office365-filtering-correlation-id: ed611e29-2eaf-46c6-27ba-08dcc65a8d22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?L3tHwvSLPK0TorZ6uD7JZr9g3iN5P3+CEp5s8NRTNLZRYcsSqQOEbxvhdLZX?=
 =?us-ascii?Q?i0YVTBCcf3QnAQ0qPtOe6VwqYDEtzCKUzymLwpIRz036kmULHalcumUmWZFs?=
 =?us-ascii?Q?av6XHEi4dRG18SrPQKfVAUMRpu5YdJyQHoMcW3LTCiT/XAHTBi/FuiiPDtoY?=
 =?us-ascii?Q?beq3t5pHm9A6xg6bM0fLVrOOcNJZDHqNdi5bD4RA+6QfVnHMD2IWdg7Fitoh?=
 =?us-ascii?Q?z15TLLPgFpLBEenQgKNOHATnbn5xE1L24NB3JRSt7sXjY01mtVAcZq5+tAlT?=
 =?us-ascii?Q?zWtmFq8k+gkss61Td+ikFmicto4AnRyDSk9CllKm+l1pZ93Ogd70b+i8Z1a0?=
 =?us-ascii?Q?ONzNaX2mufGv5P4x+Ev/ZZBb4KyavQBLuKHMFJTlNtXc+FG1TZLGs5jZCXUq?=
 =?us-ascii?Q?Iq9tyTKywA1Aw8VZnOshLG+cKIKE5xYFAUNA9+F7bfRETj6QQAbGPngEB+3f?=
 =?us-ascii?Q?iR/yOjvearTNwCaz9uvVXmjIzXZVs+3CIjIPIlET8HWamU2Y7m06QgIAEM1V?=
 =?us-ascii?Q?JpNisbDuhD5y6Nv5No/Gu8/OCqmU0KoGGZ/oIAWw7E0tUx8thbtj6RFxdHtK?=
 =?us-ascii?Q?zhRuXK+B1paYMBQACibA1oQhAgo0yt6E6ts1aP6Ex9T6g8DFEERmDMqYmfKf?=
 =?us-ascii?Q?xvTkVkN9HPOlO4iru3um2zLjKFT59PdcPthJPHNNPkvYRn8kTqNfUBgIZo6o?=
 =?us-ascii?Q?zNYEUUvd5TxiWBpn0Tx8+Az17Kkk4IID8TbGWLzC6W2SZ+Qcn+QnKi9qsbkC?=
 =?us-ascii?Q?r9AKhFLHIxXz1Sce93TLSv6MIaJR1PDEDaFc33oBzjY8oF3FGC4dvr8/CHEY?=
 =?us-ascii?Q?XymExJGgio2f3gklhbXD43B9XbN0Az46LihXTwCupPeCjBzvhZTEJ5n+56O1?=
 =?us-ascii?Q?aB3blvlw58GFdImOYXv0uywgDhiWuO8n1Qn7XlhB9PTEvJnfiw4Tkof9HSIP?=
 =?us-ascii?Q?cGBpOWEQitULnvqh2+ZPTC7QUPP/ah13jqk6sFRCl6GnXcPd0NCFqZ5tWryU?=
 =?us-ascii?Q?NckllTxuwW+2nOYSOxZqZ6qXvOLDgDjLon30Z7xHX9Jpsl+76B54dNV5Mnbr?=
 =?us-ascii?Q?bl/AUUC/SQyvE6UN2/u1F8aNTEe5SzDmn0v7cGavwQZ2kWRo1wlmLU1NBmBf?=
 =?us-ascii?Q?q6ffz6eKzN6M3ThA+SPD8aoW4GWNW7mGJcA05I+UXK5QuHFdJ8IYYcjiHJVP?=
 =?us-ascii?Q?157+weCqkx8nAD8r7DRXC9aA7mzAnOiDVZz1PNRFQ3pHvXfjIxxz8ITIgU4V?=
 =?us-ascii?Q?35BoVfDp82dydLqGTG2B+UBJB7wSnk6M5C6FL1XQ6vFJoyW2MPKSlj0CWa/4?=
 =?us-ascii?Q?4hmaOBzG6EIQTIgyGNySt1LDbX9C5soSmhVVx6NI4YO3GJxlkl/siao6I4Mj?=
 =?us-ascii?Q?nc24Bbl3IaCfU4HJnVjBaC6mybBoYa90wt4n9n6R2QSP0zM/xA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RuuhOpkQv7PDG3uJVhm8IXBMpNc3MzlbeOv2LbfaNpISviScQZMsNiavht9F?=
 =?us-ascii?Q?wAjPx7eyglJFQno/o2hQPapqL6V76w/h7QCCuT0Hat/I2tQfsZTqHtrovDGV?=
 =?us-ascii?Q?NvtxqfEJTvOuh/pECiLK9XvijnXxZWqxMH47IVW4zmXLRZH0IuwMMYwcVATk?=
 =?us-ascii?Q?JBPyy432rBzPsBvgud0VuBUahRtdsftKUCiW5knsul0mR139l3uql+KpoDdB?=
 =?us-ascii?Q?Cwnf+B8973J/S+SZwXrPS7di1Y2LB96agNLmtgPyGB3n0qsHCPHM6vXeBNrf?=
 =?us-ascii?Q?FU3qO/pgnaOBqxUIylceeoySnRlatP1WYw4/5HZGx3vSFw7kvnWeBXD4qkIi?=
 =?us-ascii?Q?vqZpJ5rYsPOw1unr51bKRr0ZeKJ4CTKy6Wj7NNV9OHcBJOB1sstrfe2eazXp?=
 =?us-ascii?Q?/J/EFsMeMshW+SNPghImb7idzrizr+9QMYMNGcvLpp7I/0WfyX1ZTe0Yx2ym?=
 =?us-ascii?Q?nMvWBb5I6RMFi6r7fvY4ACLopTyaVdHpr3LwMmcOhZoLAcvA6AzWW0y7T7zy?=
 =?us-ascii?Q?TmrH+K//Mo+XvbqU957ItDclPt+nDXq7tUZCZ/4HBDY8gWA70Mf1ByPNDQ5B?=
 =?us-ascii?Q?YtIS/XboAcK7JnIfOeJxrskpp+tzxEOyXjH5RDWemjzCLdAlrskxxhNtGc2r?=
 =?us-ascii?Q?UhmwyD3yGx/Z7MZOskot60ZGnYE4ftolqCis2GeRJumlY90OUTkDPULVM4eZ?=
 =?us-ascii?Q?sxyYRMPaGvOCiTDdtj8rF/ujdhV9CQZ67CJDrTeDhlBszS7fcMvo86mLoBOj?=
 =?us-ascii?Q?ZbNJuOnhSmRtgsAyUyzZ+yl4VNaTICuAacRwZMfu7N3+b5wakhlnbnnulYEt?=
 =?us-ascii?Q?v/qwGwsN5k/QouTZURVpUhmrpGZ6n27mckZku7omEiCrL3mkgqKiTgVKQzxu?=
 =?us-ascii?Q?ceD0lV94yTmz9Ekt5dwu9h/BONmG4utAzeMogQRdMnGIuK+djDbA6Tqiy2L2?=
 =?us-ascii?Q?+r/vTJXL4LtnREINTSiEtUu7iIJaFvHm+dyoDmjFwdARrHrfTguWlQu0q2d8?=
 =?us-ascii?Q?GD4sufKZMVFBlArtw2aBoXiPTnEm869GVWj6Zexdq2ec/nIJ3e+2rx7+KlHV?=
 =?us-ascii?Q?Yczc7RoS450wFlyySmFcdlNowtZwWN/pnNm5Ds8Omfy3DmOiDnIKkB3LrUez?=
 =?us-ascii?Q?WXORz1Epz41TMVtDq243nhIaW9moCCicUBUTtdNpjVI0+2CnVs4+tE/+qiz0?=
 =?us-ascii?Q?HdP4UE/x/6pLrs9BH1C/u994SaDqqgyQIUcEZYUwsHaVlPrbHYP36sTjLMLJ?=
 =?us-ascii?Q?+m6MWU+fq/1w/aIBHeBAmrw4FzlPyD0+9JdWw/Y7HrwGqXzz9BWxV7EZ6Qa6?=
 =?us-ascii?Q?2M2Ca25eq1qcAm4fYMaPQ2ihT8RijSIBc9EQqK1o2EYydQ9jYVJsEsXfJfLO?=
 =?us-ascii?Q?QQfFvbWa58m14DudJx8yUSi+JTbDO/BOkJnqqCms3G7xTVHgFXDHjd4fjI9h?=
 =?us-ascii?Q?/uq5L1gxWk9nADYZErr0kQm2+RaFpEiosKXUeiRLIxfsGTrJFEAGZdaUI9uL?=
 =?us-ascii?Q?0DCkPIEyS/B0Foai8vt9Iepv3VXnPqfexZ8wmHxcoLWs3C/oHWLv/ubwVBJm?=
 =?us-ascii?Q?r3bMFWxHijO7pFNIdsk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed611e29-2eaf-46c6-27ba-08dcc65a8d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 05:38:59.6488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PRSmgZMtq8IakHC7fU1g8QLR/VqsRy840hGU1/YO7xI+tYeo7Qt6SFFpuMA0bAKKqYs99bfnoCicKFxCj8jSMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Monday, August 26, 2024 1:36 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 02/14] lib/igt_kms: add helper to get current link =
rate/
> lane count for connector
>=20
> i915_dp_force_(lane_count/link_rate) debugfs files expoose current link
Fix typo /expoose /Expose =20
> rate/lane count for connector.add helper to get current link rate/ lane c=
ount
> for connector
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 58
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 60 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index dd530dbab..4ef7f4d7f
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6705,3 +6705,61 @@ int get_num_scalers(igt_display_t *display,
> enum pipe pipe)
>=20
>  	return num_scalers;
>  }
> +
> +/**
> + * igt_get_dp_link_rate_set_for_output:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: Link rate set for the output.
> + */
> +enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd,
> +igt_output_t *output) {
> +	char buf[512];
> +	int dir, res;
> +	int link_rate;
> +
> +	igt_require_f(output->name, "Invalid output");
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name,
> O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector
> %s\n",
> +				 igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir, "i915_dp_force_link_rate", buf,
> sizeof(buf));
> +	close(dir);
> +	igt_require(res > 0);
> +
> +	if (strstr(buf, "[auto]"))
> +		igt_assert(sscanf(strstr(buf, "*") - 6, "%d", &link_rate) =3D=3D 1);
> +	else
> +		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &link_rate) =3D=3D 1);
> +
> +	return link_rate;
> +}
> +
> +/**
> + * igt_get_dp_lane_count_set_for_output:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: Lane count set for the output.
> + */
> +enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd,
> +igt_output_t *output) {
> +	char buf[512];
> +	int dir, res;
> +	int lane_count;
> +
> +	igt_require_f(output->name, "Invalid output");
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name,
> O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector
> %s\n",
> +				 igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir, "i915_dp_force_lane_count", buf,
> sizeof(buf));
> +	close(dir);
> +	igt_require(res > 0);
> +
> +	if (strstr(buf, "[auto]"))
> +		igt_assert(sscanf(strstr(buf, "*") - 2, "%d", &lane_count) =3D=3D
> 1);
> +	else
> +		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &lane_count) =3D=3D
> 1);
> +
> +	return lane_count;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 999921f9f..9d42a2b35
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1247,5 +1247,7 @@ bool
> intel_pipe_output_combo_valid(igt_display_t *display);  bool
> igt_check_output_is_dp_mst(igt_output_t *output);  int
> igt_get_dp_mst_connector_id(igt_output_t *output);  int
> get_num_scalers(igt_display_t *display, enum pipe pipe);
> +enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd,
> +igt_output_t *output); enum dp_lane_count
> +igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.34.1

