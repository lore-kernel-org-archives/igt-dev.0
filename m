Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E50EFCD61
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6E410E4AE;
	Mon,  9 Mar 2026 09:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeHzLJJp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FEC10E4AE
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773047670; x=1804583670;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7qHGAKllPK2nNVSqrD41jkkdli2iNVCtVTtsGZce8vk=;
 b=YeHzLJJpPOfbkGNRPM90V2SHyxf3ZZsL8m4svJkAMYZigokjZkQa9u8u
 gOhcwlZlEbUCi/UCSCNi+n7BMWD2RdzGvpo3qjGx9k3YlEV1rw5UKdpwz
 +oi8+L56aL67dgCpoDkgaF2Tp49mbNZDHLpsJQxScodCFlQH88OEojPrJ
 8NTcfJRljWiE26+uX2miLKeAddUUYh3gWMXyfAQgX22nvMYjfrGQBkv9G
 g77Eyk9Z4dXEQkBzT9ACwtBSYC2ONKqPZTwU2sjTjr0K+rPijJt2ptyk8
 fcL0N0Gvev+S3zUvskhDMWln2sncTkTh+tQmYzrxax36MDObNZH3dzRNU A==;
X-CSE-ConnectionGUID: 7bRlUPo3RAe+IJVO/N+51Q==
X-CSE-MsgGUID: Y4EOFla2T6iMHimKCbULGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85538308"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="85538308"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:14:26 -0700
X-CSE-ConnectionGUID: FJrIKs5hQI22LSkOZh3WzQ==
X-CSE-MsgGUID: ewbjucS6QZqklRUE7A2D3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224148364"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:14:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:14:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 02:14:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:14:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETPpwWh0+A7NrYhf2RaV0mLJzGdGhtSO/8SA+famD21Fe+6cKyDSYM7XPzqs9b1y/Usny+aWvHmvp0kj7Zeptqit8UV7jA9gzjfva9+uWX2X6GvBZJRGsaxJFbOeBq2734/VijhSsXF2dDdw97iSENy/IrtCnHfTdlKDxOVj6OXSGbf5uhEiA9qNmrrLryQaoV/h71q3MrJlwy9LX9daUxUChcDrUmlTkiDexkESK2snX+HxnEpDhO7CqJivHiMtmo8TPWVawub57nK02hE8XyCSOO9ZO1kYGVfRDaZx45jf+f3CssrPNkcTKbCK8tbR08agRbHOn9GkRfj5imt8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6pKY7Actq8ZRF1lGldHj+GbxnktSrHm1pNjmnmqe1Y=;
 b=KSRyXw/gqbXuvVql+CxArfE8pX1jt4Pokm33g9ovyl1b9yM2M0J3XUVyau65KTbomarom8E1doaqdrsmrSPoaUWaxvwOhwc1Fxargt1kOLjPSQGofyc5AFsbXhBMVd5sjG26oCQn0QiF2PeKapkU5JGOXF2XEOQjDy1DvKsN2WkhJBW5hfBtGzoJnDzVZ1hX2dBw4n3rdwkUSICTPRgOcmwCZpopKPA1Burwsgpo1hKDhKnyvVd/lJl/q4JrAuWf5Cb2C0yE/BVOG8TmMjcWbpdfDJf4uYV/wIIwlrdyy946pS4+FfNvU1wBBHsBspmW+UBmg/P4yBlOvJDJ2PcoRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 by IA0PR11MB8398.namprd11.prod.outlook.com (2603:10b6:208:487::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 09:14:22 +0000
Received: from BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4]) by BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 09:14:22 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Gil Dekel
 <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 "Project_Global_Chrome_Upstream_Group@mediatek.com"
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: RE: [PATCH i-g-t v1] Modify the vbl.sequence *2 for mtk driver
Thread-Topic: [PATCH i-g-t v1] Modify the vbl.sequence *2 for mtk driver
Thread-Index: AQHcr54ws4WsB8pnnka+jUGd1FY+2rWl4KwQ
Date: Mon, 9 Mar 2026 09:14:22 +0000
Message-ID: <BL1PR11MB60503E73ED68D87122A83C75E779A@BL1PR11MB6050.namprd11.prod.outlook.com>
References: <20260309082400.19767-1-xiandong.wang@mediatek.com>
In-Reply-To: <20260309082400.19767-1-xiandong.wang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB6050:EE_|IA0PR11MB8398:EE_
x-ms-office365-filtering-correlation-id: fd493556-1af5-4c21-e121-08de7dbc40a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: NEb7mjUlcMhwK0KWEac0kyXH321gcuiNc+R9SzrosGRSux1zdvcuVFQEQux7+cSya+9MNE2TT30+x81z9qfh1WJCefOVi20yJK2NrO3z08L9RbHLjoeXR3K9blX6nsf/+kpUmdGLza+XjwGztjPtyzdOvVE4e/RIveaSop64vmYlzFq5goX6ANBPNSY1/u+fn8JvnJVbITyF91IWF+GcJkS/pqm/AHZS5iYI5M7/GFCFGFLsafQQQcQle0X0cMA/gSSP697zKt0ul/olnV0PCoWNxeFdr/3UUCv9B82lsYYtwCHMxb9TfJTgcF5j2itlDXesB69OwjoNOahr3nRBd5sRTmNWPxDm/AhzKp5XRGM8fuFVMxeBVCjDXOU5GailMFkgXhxL9hU11nzHEfKNLjN6JCHUPW1zVgyBhqqmwxaigu0nunaWo6gnednFS+tP7kOgBQVi03ppzS95s+hM4T9PDkzuG3vKFuDF5kiPwoncXMUItpQh/teUv8q3s08bCIR+33ImVhILUNgCUNgoPzGRBT8Yq7FsvlpgQaxPxg/X77GNAv5X6jQcR293CIMXAczXboHf/pTd+jOIS1WKkVx9z2kxVH4VASm6wQ6ovfnrBwimiYHJqCHMzaB1TZl40jmR7xiYfhJPLPbNmAaMq3iAqfpmtYDVv7DQr1b7fS5f9d1tSCsshpcwEK0pNclmQkXSMTgZpYVuEkxl2XzO54vZAdVJDZyVsze1E+prQy/J5q0S4mNCAPXRxXGAIZXVbJEYxpPSC/fC71do9HMa62hssjJKNdfdTjSBOWCkGyA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB6050.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q4Awfgu+e1mAoS0jnlzjrxaoKMahMX6pkQXTZAQ2Fo3TF2yTEnS31BEMeS6/?=
 =?us-ascii?Q?/zxckCtkXPHRwG8aktwH+Xa7Egmdbgx8GPNmDE/GThWKCFgtlwqrMS4glmuO?=
 =?us-ascii?Q?tahRY10rR0eN/imrTXdow8OMJOU/fjou8A6/sisQcfxCanBceTCfgRsMN5oo?=
 =?us-ascii?Q?OY6zxTzWYIyQE+UXeSrq101psRa8zjrqsGuzD9HYYI0zNfJBLDMIIAIhQsjZ?=
 =?us-ascii?Q?KSXKocPanUmJ8Rl8bGY45rdPh9iO9/7snN3DPF6V+nS37ffjZ0NhJgov1pgu?=
 =?us-ascii?Q?kOTPM7FKxGOeoJm0+YSpFEHLq7hXJ07NLRQueltx7eWLX8JUAF+VpfW+k8QL?=
 =?us-ascii?Q?i7UUBrrmjkd/7m0BrZPPF/VWM3b+Ba3duS2VeTSvM+XBdq4jIsvqo81OYbJ8?=
 =?us-ascii?Q?JgvZv94u+APqVAkHiy8wgOkxwEc2l6HFjNpMNnspue7b5wuuDbb88vdfNSMI?=
 =?us-ascii?Q?nBZu0pbVCdsATb2nNFsz0f+aCgt4isleLB/Pig7oIaMIv+LAjao4EPLQyE8N?=
 =?us-ascii?Q?OMwdjx4KboNuXvTU8n2UsFGE+mYMbO8jAP2NrojYS3hVAk8/DlaKy6Jc+zfn?=
 =?us-ascii?Q?Bqpt6OFDOGSB8Q/rD4MKdvGcJeXuzPp/MzFnLA/EOYM1dyhdCbiPLdcoBdGk?=
 =?us-ascii?Q?KEVgHl5YXOSNIeLk+XA6k8QilXyhk9xAOPrvvIh/kjKk9cK55bgwU/xtbvDw?=
 =?us-ascii?Q?8ww6VVpEeTInjFTjR+FyMVO+V2RUpp/zDzI/XNE4Z8RB/D9GUzHVZc4xvlPf?=
 =?us-ascii?Q?cZfQQOluhZw2dI8PxF1q15HBuPQrm03qKTmO6cq8u+WMvsc5wAAoMh4vT+DL?=
 =?us-ascii?Q?cG51FmcJMldvs7ClUnOL3D4zhaNZmb/pbq2hQmYN4CyS2NLhp3HBe/47eOOh?=
 =?us-ascii?Q?3DSNQQV2o450KLF4JVV7c/ZqA1P/P4gY81YE1RLgee4mId9xkV1COV8npB3B?=
 =?us-ascii?Q?NxS+pROl5FjYPmTTCVbTyH5IfTF+NbD9URxbxJVsY8VkjdaWirdmPeegx/kj?=
 =?us-ascii?Q?egnqt+xxqupFixNXkLZCnhKanv+w8d3YB/BK4xT1uJZRxfQf3qEjlwQmXf3i?=
 =?us-ascii?Q?2icyuEJgDXZCVyO7pL/SH6WsY3kUXrQBhhz0l/GVbhRLEzldtyoTu0BifoWP?=
 =?us-ascii?Q?+5r57niw4yN/RRzEanBNp8IT0/TM7VKMkYF2Ib8bnr4KDiQ25lddW+Wsaw+3?=
 =?us-ascii?Q?tawblpsm+Enn8JfcJoz513WExPNWstvukbGKij5151ngiaPUzrmICucJ02h+?=
 =?us-ascii?Q?PqNBKucF4WA3AbMabaGODVNsHBduxDqrRzVVH5QoNZgwn8Fr16uBpwG0sM14?=
 =?us-ascii?Q?0IWpCex5WfI1g3CbG+PzyL9PZolfgzGWoUZC65EYMt8R7ADFRZ2mFBAJzlVP?=
 =?us-ascii?Q?3IsSasAh8RKpTXMvyoejNorqs6ahnYwZ/jXjIxIMUknEY6Nh5IWTxdOJZEJp?=
 =?us-ascii?Q?sF5atbN68BhpJUdSFWwT9WFP2RGFnm0TesH2k4uaWREp7QR5k98UFlhJnZhO?=
 =?us-ascii?Q?3XmKgX/1qX2YE3KGpc3TXzck523zm4so45A+DkwLtDQLDN+2KH6dG1VKqU0/?=
 =?us-ascii?Q?GXvH3ht5t6Vmja+e8K3HkDBAbia5c1HeBybrTC3P7lqM1rLbtPnXc6Buxgf7?=
 =?us-ascii?Q?t8DoDG9g1dCfrO45RL0wP7mPzYb26IwbWOPfCaq1PdMLU3hl+iDs4SPgAe2r?=
 =?us-ascii?Q?IJuDDr2RzteiyVM1OQzX8EiVyWzgLPf2iZzEQKlPSSdRjxAn6CYlK2UQElRz?=
 =?us-ascii?Q?Pa1y3RWvwQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UXTwPKGTPGK/4DQ48poCWHUxwIOluugSfJ3iurR1KL5t3YmLYxLLkriHm7fW0zWihhMa+v1Yvc1Y330uOej2bFaHeFZndMOjOz2s81HzzGmUinb+9CW1cB/vG5hehzm3SO16wmdyL7fhbXMYoM4e4m6pJpZmFeKW0t/ca+xuESZKI59Pn4UBeGdAAoxTlwLZQBkgXDpGBG3RI748Db80h9HU/XAU2sJ0tCLm71MBY4dDnjJiw1OXuOn/kM0uX7s+hEXwz4OKkAm9MTnu99SL2O6xdhTBwH5RBQ0p3UD1YJJlhxH1M9BDNiwui+nrhrvbP3pRxPyf51fbA5EPRH45bg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB6050.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd493556-1af5-4c21-e121-08de7dbc40a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 09:14:22.4850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CTHsJ8qaSrpUBpsuEVE5A+cYQlGU//rF8Qz1puDhjIhMtlxF7//Jesdb9I78pwxKqvnaroSfMIOFZyYODMnG4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8398
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


Hi Wang,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Xiandong Wang
> Sent: Monday, March 9, 2026 1:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>; Nancy Lin
> <nancy.lin@mediatek.com>; Singo Chang <singo.chang@mediatek.com>; Gil
> Dekel <gildekel@google.com>; Yacoub <markyacoub@chromium.org>;
> Project_Global_Chrome_Upstream_Group@mediatek.com; Xiandong Wang
> <xiandong.wang@mediatek.com>
> Subject: [PATCH i-g-t v1] Modify the vbl.sequence *2 for mtk driver
>=20
> For MTK drm driver the vbl should be *2X, since the cpu frequency to 2.2G=
Hz
> reduces the number of missed frames, confirming that this problem is
> related to CPU loading.
>=20
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
> ---
>  tests/kms_cursor_legacy.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c index
> ad2a15d0f..33ae3778a 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1426,6 +1426,13 @@ static void cursor_vs_flip(igt_display_t *display,
> enum flip_test mode, int nloo
>  		if (!cursor_slowpath(display, mode))
>  			igt_assert_lte(vbl.sequence, vblank_start + 5 *
> vrefresh / 8);

This existing assert should be removed. For MTK devices, this existing=20
assertion will fail before reaching your new code below.

>=20
> +		if (!cursor_slowpath(display, mode)) {
> +			if (is_mtk_device(display->drm_fd))
> +				igt_assert_lte(vbl.sequence, (vblank_start + 5
> * vrefresh / 8) * 2);

Here this also doubles vblank_start. As per the commit message I think it s=
hould as below, isn't it?
vblank_start + (5 * vrefresh / 8) * 2.

Correct me if I am wrong.

Regards,
Pranay

> +			else
> +				igt_assert_lte(vbl.sequence, vblank_start + 5
> * vrefresh / 8);
> +		}
> +
>  		shared[0] =3D 1;
>  		igt_waitchildren();
>  		if (shared[0] <=3D vrefresh*target / 2) {
> --
> 2.45.2

