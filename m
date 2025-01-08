Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DCEE77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 18:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AD110EC62;
	Wed,  8 Jan 2025 18:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8nAHcxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BE710EC5F
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 18:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736360786; x=1767896786;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1xFFy9+knJRgCchNWh77iDBepC4STCSn10cCsUHlKvg=;
 b=P8nAHcxZJZfMHyr2Bf0QzKvGqd0OAAMNKoqPPRp3bZOJLCVr1L1JyxPr
 dV5clVxGWVNVS43FyasLKXSLRQdL+gdW8/piXvkLUPhTOhJIKEtKLmFU0
 IxpQ3HUTQyt0v8uH2hcTqhCx0On7uW8xVgJqYskHY65PdO/8z2pw3X0y1
 lrDpjYMQo6PXwUGXIjAiPeAoXZzCiVO9l7Vloz7l8aEEgLIbFb8HEN0pa
 +PbYkd15T6ji3n6X4CTIs3sK1UxYBYNHVa8O/iKVlKhhWYd4FRHEASmQZ
 LQs3U7PLNnhMQ/lYwuno6LZ1PIqQ6bfmyTpGJXxrdK+LM/MVcj1b4dWcy w==;
X-CSE-ConnectionGUID: b2UQHy1YRC+n3Vj6nHZOlg==
X-CSE-MsgGUID: XJNd+9m0QlCZdLQGRAG+Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="54148464"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="54148464"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 10:26:10 -0800
X-CSE-ConnectionGUID: uB/rckBBTDyf4gTtJe+2wQ==
X-CSE-MsgGUID: XkNQhj3BRqS9lrvsCqYClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126466013"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 10:26:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 10:26:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 10:26:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 10:26:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUTnQS2brq+FZ5A2nCkUBpyE/3oIhvdaag1qHXOOUM/cpDgNUmyDwr9GmzT9D95EbjNobQjLIPiFqnup4UI3Vv2mthKDUexNnJbOO/oSFtfEQrxjYJaAjuY1Q82oVqs2iFgadsKgHkFwqK69dGyPzd/IoWjdv/HRtZgLfqK8UA0s2DR1Nadg1k8xSSrVPuRkPEf1wUXwDzDSh234ZJRwJYS+E/Dz1PK1/ZVNaKzvBwoQo96Ziq6SxuQ9LOq+ffEL9fMKcjH6Y/T7RvCTSFZYiHT9fohs6E9xQsaUGNngMmQipz/OldKpvygr//MK9KJgSZ8TJKjtOygupXe1AHoDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WcLMUl3rBI8F4je7WP3teoV6bjLV9yRBGNiHbiqXpE=;
 b=iznpa4mwryrpZ36TR3Ga1rEa81FByW7e/Wq1oN0vc1fuuFacNn4CdVMPf8Rn3C4jd9fOq3IorLsBMzSLdePxULHiIWQ/V3Gg8zCktRbPiEbGQy19Md+8Xswstkhai3Lf8nDgo/ixlXmfmNnCzhbH+UOXgjWY1rcg25NE7r5mR+3onfKUL04wisMsXRJt0ka2yYgsfLYzHFecEp1LTI+U1Pde3yoVSb+rpkex5kjKmwYbRfR0huNwESyWlbcJ7dHWu3/lIwpr9SqsGRSNuLbcLfVm6/9zZ+Pdg1LI72l28G76Y7YzwKmFD0pGkY4H4As+1r8n9ZArkVeQaZjMXxKajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.10; Wed, 8 Jan 2025 18:26:04 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 18:26:04 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 2/4] lib/igt_kms: Add
 igt_is_(big|ultra)_joiner_supported_by_source()
Thread-Topic: [PATCH i-g-t 2/4] lib/igt_kms: Add
 igt_is_(big|ultra)_joiner_supported_by_source()
Thread-Index: AQHbYTVOqm4klzbpL0qifrh6L/kvR7MNMngg
Date: Wed, 8 Jan 2025 18:26:04 +0000
Message-ID: <DM4PR11MB631287C325AAFBA2075D241A90122@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250107185709.116756-1-swati2.sharma@intel.com>
 <20250107185709.116756-3-swati2.sharma@intel.com>
In-Reply-To: <20250107185709.116756-3-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CY8PR11MB6915:EE_
x-ms-office365-filtering-correlation-id: 80bb2b49-56ec-4a1c-5af5-08dd3011e98e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/VEt0OJM100RDcdzDTXAlwHlXDcnCSmi9FZuP/olN+AcmOS66r6xtLgm+O99?=
 =?us-ascii?Q?FQLcCDj66yZ83jhvNqxEWkuEErX6JFqj+AWc3BDGTWFIJ+tEbwuxGvgdcR/m?=
 =?us-ascii?Q?MUzhowi5K9cFhDSQP93ffMkfcAPrm/lAEKToH2A19BVOmTgjFNVSJ3DeBIxF?=
 =?us-ascii?Q?JZgqDzAkxcwyfYuICgkELKBm4H0Pouy9kmmiy+bUobfEpWw3A2QHaPMOYlXk?=
 =?us-ascii?Q?RmRMz/JEoiH3l5o1LXGyuXWDMPcSeKUlHRrT0UIcQMTKUGDBz5tAFLGkJ5Ra?=
 =?us-ascii?Q?mGvFO7xZv90WqSCVWOFYfk1WtiWB0Ops4rEDgaxNfLPZYYjrMY0CQvrj3V9+?=
 =?us-ascii?Q?CHQ5hqtETwcG7C+4kyEuMhh5+v9BzAaNcmTiC8UlawLkrrW+nJwskqOQHarb?=
 =?us-ascii?Q?rNHI07WdYqIiaiN1SJVlR/gFf/BIdEe8EGxG95vw4FxNgDdwvSrvLTACDUxA?=
 =?us-ascii?Q?ND9RroQUwDmHLLnBNglbZAh3txsxjRmtzrNew02NpgHt35X0a+hx0hlMBC7r?=
 =?us-ascii?Q?V1HfPooSVwbZ8sMTmQHUbaqYZquc2z6pMvbnzvZhjjj6S3vrTq5NLiwUCiR6?=
 =?us-ascii?Q?NWD6K+mVHGBm3RKN1VvG+a7PQ56B5UWZcBgC8O+gBlnfX0ujhqGpoWXWFSqP?=
 =?us-ascii?Q?2lrRdHqbHA1Vuv/2JjHSt8kyV4kyY+symkmQ2+k/3U+BXlQY+i1ZUBjiAUYs?=
 =?us-ascii?Q?GrWiJfPVzq/OiImp0JsuT+O96hQbp0opmltMn8B36bIkPWy4S6jlaWrRFTml?=
 =?us-ascii?Q?03JBEDybO0aJf2FqYvh39ulhDBcOrT1Q0A3AF0VP36AEeUahE9P0KyGeqMC1?=
 =?us-ascii?Q?LOkGzOyVr49q8P7OLahdnfca8iIK1sNoj4/e4VJM6MTUgs30HYXHxAopkOs8?=
 =?us-ascii?Q?ed95xhupYMf5SgaizHpQDvtbkXN2kjtgjPw5CWFm6rrIaLN2+IWXI3cnNsI0?=
 =?us-ascii?Q?2o7K+q6LwvAJhlZH2G8L6J1vceoF/P4ojKELHHFVrnuJEwRRXwyqUEA4j/NW?=
 =?us-ascii?Q?t1L9PW7O22HUuHKB61GbYEQ+JtYgaf8KZm5jZIGi685IKb1Vk0u3kjaH7uhB?=
 =?us-ascii?Q?Hj7f1t4twVKsw63hlgaU5K1D336cSTUKvHaftQSKNk+GeY0JVBO3wh63z6AJ?=
 =?us-ascii?Q?/RVu7wW7jalxH3riPHUsOjvLdT+SM1csHQb/t7yBsF+CZb0tj0JwWGVE2Abg?=
 =?us-ascii?Q?sOlftiu3N3NXNStCPcSos8OlsPcncPKMYmY/07jmCNkjpfCjg9JUCxTHMvpP?=
 =?us-ascii?Q?qLEXv+rrnt8EOStM9mW369SifpdCEQZPfdIqhEZx4TW1OgDjLzDDWHJCn0Ef?=
 =?us-ascii?Q?9syz51kul8PvpmcoBL3G7i1dxWOu+1GSuypovC59B3h/O04hjnkOfqeh8cUN?=
 =?us-ascii?Q?RZJFCNs0jJSqM5tNr9ihuvbMTceX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RZdO4EdsyeMK8SvYl85RWidQz22/do8TnCaR+GFPNk667IMQOpFK8vgjjyx5?=
 =?us-ascii?Q?HI6RCF8vXm7uILatmDUt1LdKknaFwEUejlBW91Go2KKceMdvAuziTf2hUei1?=
 =?us-ascii?Q?B2pmpn5H37uyqJGMx9pIAGQyXtHJYDlbtRMaAXzUdT/jbZMo73Zps8PldHgJ?=
 =?us-ascii?Q?esmpzbzx2k+vyvOnJnJ7XP9Mpjovl7QOxSR9ISc/97AXrtHKn0DVrv9W9d3u?=
 =?us-ascii?Q?ITJLDvFL2r+h3jN1CarNQiZ3KIfnoEW+wbicATjfAI13eHU0anm91r/ei9nT?=
 =?us-ascii?Q?PvqUvVm94hSF+d4d1bQKUJzw0Cn/UloHQIphJRjjc+T6KM1wHJHUfAFqp1mL?=
 =?us-ascii?Q?4PHA+GdSFxDU6zXv4wM8W2+Xfa4+GjUjTkeDeJ9s7hL5cI0ELyQmYfjJfoTQ?=
 =?us-ascii?Q?WxVrM8uUoj8ghEf2BsP/A7MeS8wADaaLU8VfGTSW/I28a+miGPNa3n4qTgin?=
 =?us-ascii?Q?N2FFEAXxTb+eucL8X9OaCq4Eeg5QketNkVX9PldOEUcDB+qx7Scug+FLfmKG?=
 =?us-ascii?Q?7KeNOs/jZzu0MbKuAbbBspx/eqARTkHnS3t1/342hM3ALFQIMAQS8SFmE8YM?=
 =?us-ascii?Q?6CXNJSZJqpDDsqngcZh44eHTzIOp3DtD8AoFL1Cfery8w7D3fwpu6HsH3WJL?=
 =?us-ascii?Q?D+t52MVdojstY1+X2igRMzgceVHLfVR6mIDZrIALQ5vNdyIXzdkUAXpicFTM?=
 =?us-ascii?Q?qJhlPEZ8N+Te51UZe65NXKxtoXX+GOS7jNZ2+74UHZOc5DAepQccgPEvLKnC?=
 =?us-ascii?Q?FXx432hmIrh95t2nsoZ6OgOejr6qesGLiSHxzGvoLTsXoiMdF7iIHweUui0u?=
 =?us-ascii?Q?6re+IkoVylvEVbu81yyceabWaPu+sd8Ticv1VgIw2QSq36T6xgpUAve4VNdf?=
 =?us-ascii?Q?luMveDUQ2A9k4ZRs4sh5cShF4nAyIi7AUREx2r7ZUUtfBT1qfC0NPO2Mfkpg?=
 =?us-ascii?Q?rYzXR1EzMHK9MCQSCNxXU1Nm6yM/WMipXu1szu+Xe89sYJ04biQ2b+wvbOSG?=
 =?us-ascii?Q?+eceipqXf+WGqnFrhbYsRX27yoon/2BERhXnBcw9Ysc72afs+YhgU1xBZoQb?=
 =?us-ascii?Q?tHvXWYYkwm+F3zc7gVb2q214RlB2l474iEiYElwwiMTMko0UR2GnCzDII+MW?=
 =?us-ascii?Q?nyefx/x/Brte2jBFzrxyA+A3/5ArbVGYcdJKtR28hQiOouzy+rwwvVrInIJq?=
 =?us-ascii?Q?u8oFKYofBHcGwRG6GhuMxjjq+7Ga2wRBxgEXyko14L4wmWj4r5ixSmYHuonm?=
 =?us-ascii?Q?ogX62y/1eAyrZeNkYrBZZM+b2GdpEAG1xTL4gTh0mixNLmVit0tQhk6wmv98?=
 =?us-ascii?Q?L72Ig3CocwJlWpQtliqo+ALMTkwbOfssv3a7sjrrvFHrunt8jtcXUfQo0cNt?=
 =?us-ascii?Q?of7ZcPo1fX3OwD9rmIj8y3KikjU945hW+/saQ0YOW55m9+zoCX/kAIMYFqxK?=
 =?us-ascii?Q?S0pwl2mTdNm3OEgs4RmikP7LG4zDaSl88kh+hgWWs+p5lkRCPfcY9UAdSLVq?=
 =?us-ascii?Q?2CMZpTiBRlkqvTxFoqUhela1b1gplRj38kWG5X0b0lWmJlorCCbQSCE/Fycu?=
 =?us-ascii?Q?DMGnQ+pviQKY6O0Mmr4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bb2b49-56ec-4a1c-5af5-08dd3011e98e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 18:26:04.6924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRJGwT21Z4r1ZfvOtlTHXHDwaqvU2lXmT9EjzgH+8Al+8FcyvyzebpG3Ohjhks8c4AXtO8UAmpWIjD7EhZtHkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Wednesday, January 8, 2025 12:27 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 2/4] lib/igt_kms: Add
> igt_is_(big|ultra)_joiner_supported_by_source()
>=20
> Add func() returning true/false if platform supports big/ultra joiner and=
 use
> corresponding func() in related binaries.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_kms.c            | 41 ++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h            |  2 ++
>  tests/intel/kms_joiner.c |  8 +++-----
>  3 files changed, 46 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 8ee8741d9..6640a6a58
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7301,3 +7301,44 @@ int igt_backlight_write(int value, const char
> *fname, igt_backlight_context_t *c
>=20
>  	return 0;
>  }
> +
> +/**
> + * igt_is_bigjoiner_supported_by_source:
> + * @drm_fd: drm file descriptor
> + *
> + * Returns: True if bigjoiner is supported by platform, false otherwise
> +*/ bool igt_is_bigjoiner_supported_by_source(int drm_fd) {
> +	int disp_ver;
> +	disp_ver =3D intel_display_ver(intel_get_drm_devid(drm_fd));
> +
> +	if (disp_ver < 12) {
> +		igt_info("Bigjoiner is not supported on D11 and older
> platforms\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/**
> + * igt_is_ultrajoiner_supported_by_source:
> + * @drm_fd: drm file descriptor
> + *
> + * Returns: True if ultrajoiner is supported by platform, false
> +otherwise  */ bool igt_is_ultrajoiner_supported_by_source(int drm_fd) {
> +	bool is_dgfx;
> +	int disp_ver;
> +
> +	is_dgfx =3D is_xe_device(drm_fd) ? xe_has_vram(drm_fd) :
> gem_has_lmem(drm_fd);
> +	disp_ver =3D intel_display_ver(intel_get_drm_devid(drm_fd));
> +
> +	if ((is_dgfx && disp_ver =3D=3D 14) || (disp_ver > 14)) {
> +		igt_info("Ultrajoiner is supported on igfx with D14+ and on
> dgfx with D14\n");
> +		return true;
> +	}
> +
> +	return false;
> +}

This should be moved inside joiner_helper.c which is been added in this pat=
ch.=20
https://patchwork.freedesktop.org/series/143039/=20

> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index c4d76bdcb..e8a296c18
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1257,6 +1257,8 @@ bool igt_has_force_joiner_debugfs(int drmfd, char
> *conn_name);  bool is_joiner_mode(int drm_fd, igt_output_t *output);  boo=
l
> igt_check_force_joiner_status(int drmfd, char *connector_name);  bool
> igt_check_bigjoiner_support(igt_display_t *display);
> +bool igt_is_bigjoiner_supported_by_source(int drm_fd); bool
> +igt_is_ultrajoiner_supported_by_source(int drm_fd);
>  bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo
> *mode);  bool intel_pipe_output_combo_valid(igt_display_t *display);  boo=
l
> igt_check_output_is_dp_mst(igt_output_t *output); diff --git
> a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c index
> 418ff26a6..2b72aa786 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -411,8 +411,8 @@ static void test_ultra_joiner(data_t *data, bool
> invalid_pipe, bool two_display,
>=20
>  igt_main
>  {
> -	bool ultra_joiner_supported, is_dgfx;
> -	int i, j, display_ver;
> +	bool ultra_joiner_supported;
> +	int i, j;
>  	igt_output_t *output;
>  	drmModeModeInfo mode;
>  	data_t data;
> @@ -434,9 +434,7 @@ igt_main
>  		igt_require(data.display.is_atomic);
>  		max_dotclock =3D igt_get_max_dotclock(data.drm_fd);
>=20
> -		is_dgfx =3D is_xe_device(data.drm_fd) ?
> xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
> -		display_ver =3D
> intel_display_ver(intel_get_drm_devid(data.drm_fd));
> -		if ((is_dgfx && display_ver =3D=3D 14) || (display_ver > 14))
> +		if (igt_is_ultrajoiner_supported_by_source(data.drm_fd))
>  			ultra_joiner_supported =3D true;
>=20
>  		for_each_connected_output(&data.display, output) {
> --
> 2.25.1

