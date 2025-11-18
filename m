Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A853CEE343
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 17:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1968310E511;
	Tue, 18 Nov 2025 17:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKtaZvr9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF8910E4F7
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763488474; x=1795024474;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=adJILT4o2rgsByCNfeAf1IKCsVOU/RdRCWftWUqXcKo=;
 b=CKtaZvr9QvwzkI2EHgkkvXEImfsFLK2oHjSALIyJXquUipdA1xIjw+F0
 FboO6+aTOKw19YRRFZ3oHxJ58NVl2HXDl1rZadUuK22CdiHY0zN7K6Qvv
 t7JCIQts20l6lAg3p2n/KJF5zoDIniNGKMwlHhebQ8k4VgLFaxLvvOaQS
 +jjByS24wP6wUqJnobEv0Y4nev6SmhVsZ9Waq4gUmiDvVcYeUyGicG3+G
 CeBziOMXmh2ur8Da3b/W4mR7Q8azNSMHlPAmBYJa2LMveolCRtmX562rE
 5unHaNGuPsRMTRrXd88Z4Tlu0BWXvXyINnf5nO7GXjoPuJ/bfuLiWpE0+ g==;
X-CSE-ConnectionGUID: tP5blVl4Qm6xsyRxGeHslw==
X-CSE-MsgGUID: i6YcdphTQ7mQ0RCbbD2HQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65678891"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65678891"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:54:34 -0800
X-CSE-ConnectionGUID: /O9adVcRRgOAg081ywGeag==
X-CSE-MsgGUID: DF9XpdX9SkOqoOCJ3Q9NHw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:54:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:54:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 09:54:33 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:54:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MggV6HMlcfHCd58XmVfogrYfhNQyB0JBDl5js3bfW1hII3/cSNO1po57emRrZlMWx8mckTbkAYr/kDSBwZb69BSWa2R9blVjq3dNVVT7G+IjkJFnASY5a8HscaHjh7ARc1cZZE63diMNE/ltanmCW+vG/c7eRPv4fN7wzwlcxBgCETy4ne4xFVo9GVLYd+WgaeBrzc1rMGb8acVMpHh1FbI0nIoncts0H7GUmU0N4E0QPMhNd30vkXKT28yyalK0F18g9LBa5coqnIcnieKRSmDNJOirQaKaQ3rKYwlvZcGKEJFaFBsf8Hyyt9GiPR1gdxtfm99mzl9edyv91zjcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxgOM+SoPA4Fe0IlqY6eBn5/mvF0nRLDHS+Dp4CE4aw=;
 b=VkeOIT0MApZhKiAtY0U1iIhcle/o6JK3VibWoOQWW3Mod5P646nTSv78d7KkbHP9W2ZHiIayokhquH0TyHgXOCRRxYFoTa6HQNd2y/ynUGx2hZ+KB2vkUOdAvMernt8G3lisxxhNTMLktFgQJaowsRcvTFv0PRuvjpm8WkDXGH27YnNJ93EbvzYLOHcjHGYegjkKJCvTrTQNwzDjDjb8WHu4No7ywCRrdveOpX19eS2XTr6htuTfWR4oNV/gN6DrMT0G/M5D0/3mHyK6dx+ph+w5lMmpOCQ+nhmFsf6SpWSMq6A3kWqhVFnFtLGLhBwRpSgClmnWXo9llEznEmYWjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SN7PR11MB6849.namprd11.prod.outlook.com (2603:10b6:806:2a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 17:54:30 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.019; Tue, 18 Nov 2025
 17:54:30 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>, "Vivekanandan, Balasubramani"
 <balasubramani.vivekanandan@intel.com>
Subject: RE: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for Xe2
 platforms
Thread-Topic: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for
 Xe2 platforms
Thread-Index: AQHcWJchwMEdGjLqbkigFiOSoquCWbT4r4kQ
Date: Tue, 18 Nov 2025 17:54:30 +0000
Message-ID: <SA3PR11MB8046AA5502D6CCE3930773A986D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
 <20251118142522.3957318-6-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20251118142522.3957318-6-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|SN7PR11MB6849:EE_
x-ms-office365-filtering-correlation-id: e2819e98-30f9-4c80-4406-08de26cb8639
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zqRx66PVwoPkg0UBwWiLQGgSC36onAr67ovee2Hsn2rDsfpdUueqpdGqwxeN?=
 =?us-ascii?Q?SyHN/KzqPtGbUEBHOqt3U0HiOnSMPg1qQ/QR8npTGTjL2OxidqDeQjiQeGl4?=
 =?us-ascii?Q?qSPKLQY4KmFqfzWdXVbgzaOSa0zW/h86L5+/ce/Yi6XMl8shSf340LPJtLAc?=
 =?us-ascii?Q?8IVEpk59Diq8rTtzUhwnw11M+k8FDFbTfjyBKp/YS6TfxTfEiJkP4b/h7P6+?=
 =?us-ascii?Q?vXkA8x66FeyUNjazEeU5qaMJ61TVZ5IvBrZnX3Dy7Izr1bPm/VjV6MJPW1aR?=
 =?us-ascii?Q?hp4WQ9Qm+BzxXlHofySnLaE8yQ3YPMDY9NYORec5PPO5JUVPl2PJ4Mf6SwXa?=
 =?us-ascii?Q?DWOZaX+XE7OA7lgTpZI2GKN0NMyo2rKJbqXBcCzffgwFCpEkhiQ3U4bNidTM?=
 =?us-ascii?Q?02kY+dhhlZHBBj5CZF//C4FYOXgegjL8IDbzzVjWih5FP7bv2vCgn4NfITVK?=
 =?us-ascii?Q?4qetBYXxbeOBvbW60HuUIR54AesxQjscFRnYM3mEnAhd8YH0eoIvZbgMLiQk?=
 =?us-ascii?Q?TeMY7plMH5RV09SajgjDUnwRWOn9GLuLr/Wirypp0O/FBE5O6YByr1SlFHfk?=
 =?us-ascii?Q?juThrnoHNwDi2AK8S0b0wh08wjxr7CDjMkKi8MaXGqd6PwpAWOsAlngAgptU?=
 =?us-ascii?Q?bDdCYO8olh11vi+pKIUEff9tt0CvSJRjjLPZlGpLSvmYx0j0Edqyos8nKajK?=
 =?us-ascii?Q?sSdcRkkPpwCmspS/e4uIyi2jN00TYrmN24RsIp9zED/AXRqysy0ueccWHE3s?=
 =?us-ascii?Q?PCdelWJVpnjWLYugF/x8GdEJE5FBTZs608VuhZE5GdSoBCkpsCqceC9Oyz63?=
 =?us-ascii?Q?zrTvrDDWGOkUdEKcXBmyCYgEJAimS16C82yyNlVSqUP8HiFGfFqzXxOd+lQL?=
 =?us-ascii?Q?rGhDoe6DCmnsIivMpWab/tAFIIR06wcwsbqS7mRF7380Q/MmvtrTGQqv/qlf?=
 =?us-ascii?Q?vN9HTAxlFyeMfjCw4aw0LbtTO6fM2ll8dpM+TAjCC+j7JCYtCVD9rSoVPWav?=
 =?us-ascii?Q?edfSUrWeGeQahSlf1t08f/uL7oL529HlKo0trUfYZ//K2ObDjz5yfNGhKeEQ?=
 =?us-ascii?Q?cdLDH55cITdGiMAMyut7GqcmHivUCQh7Y+hgUx8IF5MNmW68SA6ATvdrLyh8?=
 =?us-ascii?Q?zRvn8j7its0cfaTpsvdXZQAwawR+71UV+/9hbFWngnM+TWvPVNLuVf8uG3KZ?=
 =?us-ascii?Q?/Bgu/rkqDhqLM0Aob1TXFRe+UiAoteS3tVSoZSZQ/zVpSpzYMyC0RLoyCbf8?=
 =?us-ascii?Q?0l3Msz89AAoZID5T4UnLYmEMLHb5rL9tMsgie2UGe3skjlFuXwBQkvWEtmqg?=
 =?us-ascii?Q?sO6vcK2PcU3/Svouyp1IM4o8vod0+f3UP+oNI77jevVXjzHPn4F++vC391hT?=
 =?us-ascii?Q?A6ZH+WWGzk21yeHlOubl3wc5aEMVQwf6SYKGndy4aXpvpLbJSUVoN4XHMGIB?=
 =?us-ascii?Q?5RYs9GpP6/Q5DTcUElDAF/nvDYyj9cueZcxukpbfWxoKM9vTqvRFbcXUr58l?=
 =?us-ascii?Q?f+gu+nS499KgQfcekm/xtJddoHkc4wi81lw7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c0ncu+olZXOUy10YW3V8RQjC88O7pCLOrsZlK3OTJ3zuZd4MmGnULOXpzjpV?=
 =?us-ascii?Q?1M2DKJhb1MoXg+/mf8Dn37DrDO5ZP6aV7d2UsdgAyJhOXILHmLZ7AoNyKsdU?=
 =?us-ascii?Q?aWaczBnVbvyxLD8QiBINfOGfG/gQUyUuDbygBvxX54B4W0AfeNu0/lBkRNIv?=
 =?us-ascii?Q?CDwiKHi4IPz/x/RdiOSbWz9gynO08Z4iKwTAI1L/H3Ga6Q8EpZ+zg7pU/FBl?=
 =?us-ascii?Q?+pPT35MhwGD90S/uVuC47490NT/zSSaXH5FStQGif8VUXbt4roFQ3B2yw4ad?=
 =?us-ascii?Q?1eC1BHNhzh2JHgTBcdBIcBciDFVPd+7JXcMVmHadMQywAjd5WRgG0Bp8/oZD?=
 =?us-ascii?Q?48eEDJYmcthASXhISMz1U5l1W1j3W6TgP/T3VVnDXZDHUhAC9pHvsk1jh63l?=
 =?us-ascii?Q?mvm2/NRDTR2+W75t2azfn8R56g6RDe0HLBnz0TUDh0Tz7s59YiExsPlZzyRt?=
 =?us-ascii?Q?EknjLuguMiqhc0/L5KFs2EFmtyoi3+PjxF8qeF66U7vZl77cnQwmpf9/HBch?=
 =?us-ascii?Q?KU1lJ72hF91EjkE40HDGkbC0A3QgXCpgptfwSglXgNinS0oMFYO4YoxG4zVA?=
 =?us-ascii?Q?lyNyq2MSA+osvlbnHa4S0SWdkpCPoSH6bi68IoobNiqftf2GOLJ1kd2mmFmL?=
 =?us-ascii?Q?zHSrYIsKglLlhn9Ul9Ss8UfqTkk3D7L9Nc/mBxoXE8w5VB+iQ0jPp42ppbaZ?=
 =?us-ascii?Q?mTnDheKZtJF8mB99lZforaCM2LmMhctIXS5CNFqO5sQDbIQAg5yIT4X8gan4?=
 =?us-ascii?Q?hf8TrD0blko6px837+tdwEjqhmN4raqLem5eSxgFfHwauklOVUlMA8la5HFP?=
 =?us-ascii?Q?xra90es4sa+9yy8eGpWbRfbDVJS4Wreid+c9NEtXSMPTg/XQB2BNxAwMgzGp?=
 =?us-ascii?Q?0HqQ2jdOcX8E7EgtCtDNGUPdK/uXR+/zuEfwuETaf1wFIw6Jo0cJuBHwOWlf?=
 =?us-ascii?Q?mY4/gfF62YeifHnY0HYVkv6bKAI/UOS6uOy723P+RkC/DdIQycYSO9w3WGWs?=
 =?us-ascii?Q?FjM2ydYM4OolmvI/uJYCSa9QVbMDYvnoEovoZuy+l+rz0zZKYeCPth9gyJg2?=
 =?us-ascii?Q?NbWlRPnMAsvRj+o1XZV+pY6A3xoER3ynJWVj1iiTpktM5YFmDAD/ApfjpZWb?=
 =?us-ascii?Q?TqTgR0nEoW5cYqZL4Nueo8jj/mlZWzYpKLcUGUftuSEZ1hPTGZUmRXK6tE9U?=
 =?us-ascii?Q?dYCydUGyLS5y+uuXU2vFYnzYeuLu4D/TLYOYlep0lnvI8f3fQT9bd4JtcA7S?=
 =?us-ascii?Q?FKXBbpmFv8Fidxa0g3ZWWYvz0ZXxYUGznVsUGQIORenNoh+Ie8cqC3YGP5GL?=
 =?us-ascii?Q?lUtgpBLxTdWe+R+HygWQQAohsAJc5GtsxWadEKE0Z8ydVN621exfZ3s6ZDuk?=
 =?us-ascii?Q?EF6DMhzD/X4cjX7/KaqaTL5t5FKZOHMPwkrPZvLjL02J/Qo5cXA46DCDWHAQ?=
 =?us-ascii?Q?C6NI/buCXQOAu98JnyEG7Mn2szde3DRfAMPPfUZpUXmnYhVz7t37qJ8lMj5d?=
 =?us-ascii?Q?RDpHe6AIXPT7EL9QvWKeOmwdpkF55RRo4rVdL00ebLZI9RjTjyk2i14fLk2z?=
 =?us-ascii?Q?IsSRtq+w0+ms36vuSXs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2819e98-30f9-4c80-4406-08de26cb8639
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 17:54:30.4792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xfpLtja/bOQrV2+xY4pqpLIkZen2+jhdaYBu3DPr36IwWb/HJvUTieIIeBhGFG4KJ4EFJ3HEdOwUO+Gp/unYJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6849
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
> Balasubramani Vivekanandan
> Sent: Tuesday, November 18, 2025 06:25
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Dugast,
> Francois <francois.dugast@intel.com>; Vivekanandan, Balasubramani
> <balasubramani.vivekanandan@intel.com>
> Subject: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for Xe=
2
> platforms
>=20
> The source and destination mocs index fields has changed in the MEM_COPY
> instruction in platforms after Xe2. So we need to check for the IP versio=
n
> before placing the mocs index in the instruction.
>=20
> Signed-off-by: Balasubramani Vivekanandan
> <balasubramani.vivekanandan@intel.com>
> ---
>  lib/intel_blt.h  |  4 +++-
>  lib/xe/xe_spin.c | 11 +++++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h index 54a096c03..2fae045bc
> 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -53,7 +53,9 @@
>  #include "intel_cmds_info.h"
>=20
>  #define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >=3D 20 ? 512 =
:
> 256)
> -#define XE2_MEM_COPY_MOCS_SHIFT                     25
> +#define GEN12_MEM_COPY_MOCS_SHIFT		25
> +#define XE2_MEM_COPY_SRC_MOCS_SHIFT		28
> +#define XE2_MEM_COPY_DST_MOCS_SHIFT		3
>=20
>  enum blt_color_depth {
>  	CD_8bit,
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c index 72b13ef42..1b12ce9=
91
> 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -54,6 +54,7 @@ void xe_spin_init(struct xe_spin *spin, struct
> xe_spin_opts *opts)
>  	uint64_t pad_addr =3D opts->addr + offsetof(struct xe_spin, pad);
>  	uint64_t timestamp_addr =3D opts->addr + offsetof(struct xe_spin,
> timestamp);
>  	int b =3D 0;
> +	uint32_t devid;
>=20
>  	spin->start =3D 0;
>  	spin->end =3D 0xffffffff;
> @@ -163,8 +164,14 @@ void xe_spin_init(struct xe_spin *spin, struct
> xe_spin_opts *opts)
>  		spin->batch[b++] =3D opts->mem_copy->src_offset << 32;
>  		spin->batch[b++] =3D opts->mem_copy->dst_offset;
>  		spin->batch[b++] =3D opts->mem_copy->dst_offset << 32;
> -		spin->batch[b++] =3D opts->mem_copy->src->mocs_index <<
> XE2_MEM_COPY_MOCS_SHIFT |
> -				   opts->mem_copy->dst->mocs_index;
> +
> +		devid =3D intel_get_drm_devid(opts->mem_copy->fd);
> +		if (intel_graphics_ver(devid) >=3D IP_VER(20, 0))

NIT: could we use the existing helper intel_gen() ?=20
 if (intel_gen(intel_get_drm_devid(opts->mem_copy->fd)) >=3D 20)

- Xin

> +			spin->batch[b++] =3D opts->mem_copy->src-
> >mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT |
> +					   opts->mem_copy->dst->mocs_index
> << XE2_MEM_COPY_DST_MOCS_SHIFT;
> +		else
> +			spin->batch[b++] =3D opts->mem_copy->src-
> >mocs_index << GEN12_MEM_COPY_MOCS_SHIFT |
> +					   opts->mem_copy->dst-
> >mocs_index;
>  	}
>=20
>  	spin->batch[b++] =3D MI_COND_BATCH_BUFFER_END |
> MI_DO_COMPARE | 2;
> --
> 2.43.0

