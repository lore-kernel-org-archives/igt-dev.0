Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A70C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 06:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA6F10E186;
	Thu, 27 Jun 2024 06:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cwlkm0fS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE9A10E186
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719471057; x=1751007057;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oGl3Fy7/Fmu4ZzV8TfgczOK4HFJnvt/wJ+z3pYuHneQ=;
 b=Cwlkm0fS5cKEDhFjCeTdJHfogUI46sme5TDaWDF5NTf9B7UREWciyR44
 j4v450fGFwR2rjAbqq/BYEbRJiCc0tiv6hp0pZ2UUbW1DYHfMHpq8UchG
 /xRxywk/uMpZwdVbH4XBpoC742AcjwHUe/hB1olw6OwxO5Ga/3dQWkwIZ
 u1uFdiThOKzoye8GOTk5lgz5A5u8YBEzF7A3O2LgMnyA5v82tTkRXWbFd
 a2pC1soBwbLI5/4L2X3XvV6w48jY9GX4kazGm3X6Fk7h391EPvZlv6a//
 Uwa+b2dpD59Qh0cVZzEz0C4ie4CTV88CgTNXuqi1X7cf1zGvwMYKVWMmY w==;
X-CSE-ConnectionGUID: MrhuYz0zTzOri8Yg5N13mw==
X-CSE-MsgGUID: RXbBJj0FRxCufeWezJMFqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16461991"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16461991"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 23:50:56 -0700
X-CSE-ConnectionGUID: +39nOyjMSHCs5RKXoj3q+w==
X-CSE-MsgGUID: xXuzOJOyQyalm3s5GBQ1OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="49448378"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 23:50:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:50:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:50:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 23:50:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 23:50:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfDdMrvGj1URwQ/ePp5/SwGST3aqAABTy652SeBNTTOlwwf4MIkrqHbXFnRQLwKK0Z/TVRlYmMpl/MCJV7+P1svnsOrHJ5IRjyzhAiIqp1WsGLCvxojrSZbPA2omuGplS5Wq02TKDAQZtVVUO3PzPLsxQHphkSUKBjNjFDlFt6Ujki8iXsz0Wd6Osur9djyJ7B+lfSlas7pwWvadK/CODqbckaxvpByotwcgXAW7RjD7/7gy55KXd0PKKXMW892HgNvWQGObcKVLNKq/0W1iunxDs33B4hEV9uZFeJOjEbVaaAfAed1Xn8mvSWTvHclT5PQYOc2h6EZDpUIZhMfBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K814Gs2mJKyQdl20tjGacmjBwOCUrARtduarluoivco=;
 b=Iu7QR8zGNT8wJ4tz8tiNcHu9wAPfeSrwjMfwdj7LoTvo7C7IadVPxJy2eC3gZ0CMFEPtfivi2rMoYJ9mKXTt/82mhd9kp8VLbjAMjHO+TEgl9GkzWWCiFTmgBkaZ80N5+Oq9WGqMXAl4dEYGDyDmkR6ibVLDyuWZGFfhg7bXxro3lWeGx+YvKAdmYhydusFSW90pC0JdWsBwJNfx8oG4YmF/3mgsWkC3gs0PegwwqTNJ8IMFPFaeOUsaj2/kLn9o9rhVMrU+rK5mFLWMa0LkBiKUaP90VHXCM62xYiSmcK4sqmO2aUAmr09yQE8ERv0Qv/2Ill+WDlk7PZsmSMlPBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA1PR11MB7272.namprd11.prod.outlook.com (2603:10b6:208:428::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Thu, 27 Jun 2024 06:50:53 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:50:53 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [i-g-t V6 3/8] lib/igt_kms: New helper to check force joiner
 status
Thread-Topic: [i-g-t V6 3/8] lib/igt_kms: New helper to check force joiner
 status
Thread-Index: AQHawVnvfcV95UPJe0qw7GK3kYi+3bHbOeKg
Date: Thu, 27 Jun 2024 06:50:53 +0000
Message-ID: <DM4PR11MB6312AB62A73B056FE634D98B90D72@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
 <20240618082248.4070611-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20240618082248.4070611-4-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA1PR11MB7272:EE_
x-ms-office365-filtering-correlation-id: 1655c406-76fe-4b5e-bb64-08dc96757d1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?wr9imuvIsr7vuHW9a85CgT0RW8IH2rRc77NK6W24EKxHqk0cH2Am5Io8+mo8?=
 =?us-ascii?Q?oNeJnUbjlDwDefsADMCD8ji8q5VoKaQ/lilm9LkQiFH1JUgrgH5d4L7QqFn4?=
 =?us-ascii?Q?Uz66xyx0yyi2XGufrNc3WDbi+2r//us5j6ht3mHjOJQpnTKkM1mGVmcpwbz9?=
 =?us-ascii?Q?0ZwMHL0jlMq9pOCGktUKv9PimFJzvFTRssLKWsG/2ToouIMfI/H9kh3uNqTg?=
 =?us-ascii?Q?I6JntB6JVUydNDDODo7Sr2CFv0thq4r9WKIn+Q7ndkdlarhKizRz3UjFSrJf?=
 =?us-ascii?Q?lez+V806OXNQnaQG52gi0J5imjq1sE935mSPVBQj222N90kzWO913dafKHgo?=
 =?us-ascii?Q?f4D3U4J+9Iyshh+e9jwK/tb8vQ8Vs5KM3EUFmqVK7CiVa4RX9eM4jh1CCzl2?=
 =?us-ascii?Q?+uJAe+IdNeetNU6km+vMrpK7NshlCGMEqkkSM5mEK7GlW5ROy1NLY4grgaQ3?=
 =?us-ascii?Q?9WTfW9uMdQoOPtYJI5K8yNqVJVOlheQEasv9iQY5Omr5CJlEwps202qnpjpz?=
 =?us-ascii?Q?QtjwrpmuraM60i+9gLI/CdyV4TZ7fVutWb96RYqQgR2WkG6dTauY1MVYsvkh?=
 =?us-ascii?Q?07Am1BaEXhscW3lwuoVv1b2DkVSWbAGomlzi9LYwCaWywxzRjK6JNbIXn2vp?=
 =?us-ascii?Q?x4fq4FvQbrGWQLgpgmW20eCVCU6nPyU9EZg1J6m12X8IJsx1m6hBKoDQJpIM?=
 =?us-ascii?Q?az3bfrKxusHpzS7kFHEsHIkllMAuE9FSNfjuLYTLcnnLzlya334kS23NAVER?=
 =?us-ascii?Q?dJmtVkKkQCIn+syvQW4pOk2FY1PwGnlKTq23df4r2ElqiliQI/nC/1/oHgAV?=
 =?us-ascii?Q?41+hLKc05dYdXxboRvO+mtn6N1KkM9koK/a3VCAqfsedC03TbA8gJWC4NVsN?=
 =?us-ascii?Q?YmQN0TlXrFD7QFdpIYbHTePn7eG3VLdcZeJWsZkXOCbM1d9/9j1A/HVCldnP?=
 =?us-ascii?Q?A687E8giin66hz2mXigzkeGffvGrS7/vcw8agBpzWp0qMUmo8We2abpDPAjS?=
 =?us-ascii?Q?nZZNzU2wIY3zVGVUy2S1jErftN11SUX5+oiNJjb3MaiZdBlDaGQ/9aeoJcIY?=
 =?us-ascii?Q?I4bzWwFhtJHmSzBeNX6+cpJNt7tbYHnGeHp1UD28CQvpThBpaVRlaQxkbkTU?=
 =?us-ascii?Q?By2zNhsAdEtnyE/Cqa2wcwsrrKnE/zgdIelKHPaVBlzwHeHMUW/jL5qxI8wY?=
 =?us-ascii?Q?goxub8eSzKTycuU2OGUgXEb+L0D6FiSX5pQ2tjRmzCzoG/oDxSYUlZCqKl7i?=
 =?us-ascii?Q?FjttZAN/QeEPAY9HiDrRWZz0Z7tbL9PNXgr+QdcYqWYXztJpLvdCBuUIiYi0?=
 =?us-ascii?Q?H1IV1DpFvc/+vVMs0acr2GAE63imPxyVE9FMVgoUgNePl806ECf4gnhVMG0b?=
 =?us-ascii?Q?HToZ8ONogrd1ZySVfELSWOo9mS4e66fMMuPJXOq9MogZWfccFQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WoVEgSJgrvXQW1uTk0Gi9Tmv1/hAWCVSZavO4mKG/XvgjyDZpZVR5Ma7mQL7?=
 =?us-ascii?Q?OyRfOQfzbgSqIoEbSnRDYStLw3cYjZc1281tW/IdNLq9A+Sjs8Gp/+uIvaIS?=
 =?us-ascii?Q?wuDlw98qUooY2Q9UOB0aLaU7S0ypLZQcFo8jEs8aP/xT5hUu/vFVGNV9od7V?=
 =?us-ascii?Q?O2UTIruImkeDJaTFxNl4fQ0pEdyTMFoWr5ZTDhutqelk93OnGlPtflPfAV1r?=
 =?us-ascii?Q?FcID163h5oLW9VrliHONGoqIHjWtxmDtLRTfoVA13A9OdDHGYgp4tnYjivP4?=
 =?us-ascii?Q?+dw7j92IeCLekMFQqSdNzPdhPX1u57n/0giZ0zby8feFcspg51/p2DBt/Abs?=
 =?us-ascii?Q?Y0k2AVK/odYMsdhk8NM0Cv5yzXabgabFXd7uePTh39xLa8McZucfSoPJBPJ0?=
 =?us-ascii?Q?SckSQxQNj2tJd8VuyPdDbC+TJxBK5ZmPDHvOs9U6XfUIy6xhMAxA0gd7KQcV?=
 =?us-ascii?Q?ZC3EGUJUYHllgGtpEfgqFGUh3tQ5Muk8ZW6dLI85xiGB3MQM0CoH+q+wJePK?=
 =?us-ascii?Q?RMyr3laws/irbwjt0s4lI86Ncmfxq9A2yinJcr+RfKxB+0VSCSxvq6xq9sGR?=
 =?us-ascii?Q?ZgYtsKZ6NjI+ANtNl7psFatjv2rZ18PLokZtrgnSN5/X9d/l//8y+ok6YW+z?=
 =?us-ascii?Q?oRKkDCWx8BUsGtAo2NzmCSO9IuZNAl/mCZOyQYMAgRHzFzcoaRlLW+ulOWX2?=
 =?us-ascii?Q?AUyYW4P4/VZld0b8/DnsEqNhBhj2PA0nF9ZRx5xoHb0PNQj3eUNvoNzZolB9?=
 =?us-ascii?Q?p7UCIrG2tPB/PLtJXnwRMy87uTpD/GWzlB/i3Gwj6kwe/pPzqHOFDSwk5E0h?=
 =?us-ascii?Q?zSHArQKRbxaGfjdBBhXrL/uFbaX82Pv4hqM30dyFRnW8zyXy+gfyaH6n6yIe?=
 =?us-ascii?Q?Tm2DzRsBcskn89rUeo6ifNU0ai34UgNm5/hpW8DaI5WreTOil+DejVBePpxF?=
 =?us-ascii?Q?AhvdxMNGBu553C4U0OgAPkTdHSfdYL7oVak9qi49cIW9uI/Y/wM9deYXa+6o?=
 =?us-ascii?Q?8fRbpLWnm7sfbSaSOuNabdYwELD3PmKXO8XA16jNC5BRREzr/Iu33IslhPH1?=
 =?us-ascii?Q?PGHzWy/PJMxGud6g+w/Zq6R/GUWPdGvWPxRA8UPprQ0ZcOtHDBWtzSzDU668?=
 =?us-ascii?Q?B6TlGxG1HhWcIEbK5LNprTqHCL8+5E1spnDjk/Waftu/FZ23wazGro6a7fEg?=
 =?us-ascii?Q?ZmLE+rFnu2Rpv6U45Y6I/l58t7xHQCJ0kb0ymbzSdLidNOhHRLAW8Ms1Q62G?=
 =?us-ascii?Q?mVgQPMXv4eG3B7VMWm2nCeMhROPgpJiIs0YNluSoo5gn5g33TMeAD1B+ZAUt?=
 =?us-ascii?Q?ph66bPxXm7JYKlwC+iGNiXFMMcUA9begm8l8R+TTu1tYMoQNvXizOPo5a8d4?=
 =?us-ascii?Q?rndtHGCkVzmShX+jBRNizcE/5Krrne5IQXLBqE4/rZ4I21xI+EcIxntoNZHT?=
 =?us-ascii?Q?Vl6Q/2xyaFKVfWtu4CnXDfp6ynoj05iDftDM0SOMK88h5QdocZ0DLR0XDH+k?=
 =?us-ascii?Q?vbSZaWBKrrNlgJt8TpCPuk078PuRdKABtIwKzcgllm4PMDbp3s4QUPzVccps?=
 =?us-ascii?Q?Vxvz6P3pqtbREwfHS54=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1655c406-76fe-4b5e-bb64-08dc96757d1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 06:50:53.3801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zp45Qp4F3lnsf4Wsjp7O6+GIBg7uMSjmUZBIvq03VwMfq1x/zgnXWhPydRUEKDbTAdXzAkfKLZ8iv7eNsLp2Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7272
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

LGTM=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 18, 2024 1:53 PM
> To: igt-dev@lists.freedesktop.org; B, Jeevan <jeevan.b@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>
> Subject: [i-g-t V6 3/8] lib/igt_kms: New helper to check force joiner sta=
tus
>=20
> Add a new function to check the force joiner status on selected connecter=
, so
> that it would be helpful to check the force joiner status from other plac=
es too.
>=20
> V2: - Add few debug prints
> V3: - Rebase
>=20
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 34 ++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index c0aa92eb5..9fdfadde1 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6359,6 +6359,40 @@ bool igt_has_force_joiner_debugfs(int drmfd, char
> *conn_name)
>  	return ret >=3D 0;
>  }
>=20
> +/**
> + * igt_check_force_joiner_status
> + * @drmfd: file descriptor of the DRM device.
> + * @connector_name: connector to check.
> + *
> + * Checks if the force big joiner is enabled.
> + *
> + * Returns: True if the force big joiner is enabled, False otherwise.
> + */
> +bool igt_check_force_joiner_status(int drmfd, char *connector_name) {
> +	char buf[512];
> +	int debugfs_fd, ret;
> +
> +	if (!connector_name)
> +		return false;
> +
> +	debugfs_fd =3D igt_debugfs_connector_dir(drmfd, connector_name,
> O_RDONLY);
> +	if (debugfs_fd < 0) {
> +		igt_debug("Could not open debugfs for connector: %s\n",
> connector_name);
> +		return false;
> +	}
> +
> +	ret =3D igt_debugfs_simple_read(debugfs_fd,
> "i915_bigjoiner_force_enable", buf, sizeof(buf));
> +	close(debugfs_fd);
> +
> +	if (ret < 0) {
> +		igt_debug("Could not read i915_bigjoiner_force_enable for
> connector: %s\n", connector_name);
> +		return false;
> +	}
> +
> +	return strstr(buf, "Y");
> +}
> +
>  /**
>   * igt_check_bigjoiner_support:
>   * @display: a pointer to an #igt_display_t structure diff --git a/lib/i=
gt_kms.h
> b/lib/igt_kms.h index 979cf1300..501d48763 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1216,6 +1216,7 @@ bool igt_bigjoiner_possible(drmModeModeInfo
> *mode, int max_dotclock);  bool bigjoiner_mode_found(int drm_fd,
> drmModeConnector *connector,
>  			  int max_dotclock, drmModeModeInfo *mode);  bool
> igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
> +bool igt_check_force_joiner_status(int drmfd, char *connector_name);
>  bool igt_check_bigjoiner_support(igt_display_t *display);  bool
> igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
> bool intel_pipe_output_combo_valid(igt_display_t *display);
> --
> 2.43.2

