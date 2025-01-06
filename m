Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A946E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 04:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3CC10E1E1;
	Mon,  6 Jan 2025 04:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GduyuBcF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1171F10E1E1
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 04:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736136999; x=1767672999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YT995YztrbBfdJQz5Uc7x2tOpFDqU7IKhWMgCHHxQjk=;
 b=GduyuBcFq+vwZRJYd2ZCVTmM6FN5oR86LgJzf/AM+uwiR5xy7eOsWUbc
 Zp8+ddl9FxM60L4cQ9H3cguJp6mNMBf/AyXmrRaTln3WU1UtLyyzc0XmX
 6Ln1y8hbzP/ihMe16PKUAXxegBxBmStZs2EKADZmXGXR0pdrn3Gmj3OPw
 4cq0jbUKW7VlTTVUqdSkU0/hcrmY5A0+hwFQvZaIIPL+ISQU8SWsDcDkP
 MizkkTksxzeMM02wSO8sv9QoM6icCwvEA9Al7iDGP1TIY9YDM/B5yT0AZ
 7RG6At3JCmX6FEmfwsQyS3beO2046UmEK/D0XNWZvZMvfLWqLUdWpXC7r w==;
X-CSE-ConnectionGUID: SrOUWU95T6Secxvkysrzgg==
X-CSE-MsgGUID: QWJ7mJS7TjqqL04Q0gzc6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="40215386"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="40215386"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 20:16:39 -0800
X-CSE-ConnectionGUID: QII/8bMxSEyQF5x6i7feFg==
X-CSE-MsgGUID: FCITmmfeTPiZ5ehQQcbuUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="102859222"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2025 20:16:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 5 Jan 2025 20:16:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 5 Jan 2025 20:16:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 5 Jan 2025 20:16:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHpUIxWkkx/S9lYFprsb72F8vLFOSKGuHY5NK8Q0K9dvT+KDwXVUOexJDZJSAOa6YOfUpxCdGpqTanDrm7U5LZ0AAuvLbX7KmDhBWkJRN2Yhu4Cqd6ikHFI2caMrgj/7MWb/ZbJl92yKyyL9VBFNQWW4HQFpSbH9xNYGRs0wCWzwDA36lNQDNcpv61WOuhrob0vxLbEO9DPHlo065rWE/qLWFvfG0Q4GpOZzck7a6yR9IhW83Ke1GI4rn+KtZ3uJ1ZL7IUw3EMfcBJnJiumGpLiwk4jAtUrZCugWU2NLUYIOCLiVwQypjorKuLV39lg3ErOqYA17NH2YZdK/wHbhtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYddzTZQnFVmjxHwMJLxmuEvserSQUJ1DmdR6xDE/FE=;
 b=f1KgvkrHpLjYMQ+dFGao5GEAXM/cVBvHSwm17dBHVDnMgnC04Rfom6hjw3Bhu9Z4jH/wIdv+av4hlhtBJXbbIdCCq4mhMgk2oBznGOmQW5iW4djct36d1x3+ATmHzy2ofAA7YI9bDzQ96gcJ9PbXogbnQSHCCBLPqy720kVGTyACWc6ImRZ4PTr36mGpOUNAAs2SRnydqWb+kybbkzfnYcRwLGZ//RC2Vx8ahWpzBvoucBsTf6/uJAK4XLXwY9iyheG2HUmNi4qn+TUgz3WfYnQLE4aovx9jeNfwsKpEx6g+RGhFw/Pm9KtFKEFxZmCj7r6wigoQ3863h3xXwQmDMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 04:16:27 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 04:16:26 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/kms_dirtyfb: Add logs to skips
Thread-Topic: [PATCH i-g-t v2] tests/intel/kms_dirtyfb: Add logs to skips
Thread-Index: AQHbX+6cpHVL0hSuGEGzq1nStjDcVLMJIxDQ
Date: Mon, 6 Jan 2025 04:16:26 +0000
Message-ID: <DM4PR11MB631214C2C60F240EC6DCEA8190102@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250106035903.22776-1-pranay.samala@intel.com>
In-Reply-To: <20250106035903.22776-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SN7PR11MB6701:EE_
x-ms-office365-filtering-correlation-id: 4ea8be90-0ed9-4fed-bad8-08dd2e08e368
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|7055299003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hhxSeafq+FQKmVfJigt9EZmyBIl3EpUHdXjs5+lN5Ew1wrsR0Dj7RyuKGC/n?=
 =?us-ascii?Q?b3MHL/nZeBmfCVqlma4CF9MQeBazUMQ8XFqITvMLWS9uILdX96RG8tNYpCWr?=
 =?us-ascii?Q?KUuE2keQdxUC6iyNlpXl7QVcW7+/Xcw3ICZQQIfdIOqnCJVxwj1Hu14LN0kZ?=
 =?us-ascii?Q?AXOCeuCzUM8sy0vVVjJM+4iJJ8bdqcXhbP48fiNT0yGbr12B5l2RUMAHJUzF?=
 =?us-ascii?Q?Vt+yKLPLmqwV3ObCFmpvpv2rkFrvy7hOmXldqCrsy9qLa3Zwf93hDm0xWRKe?=
 =?us-ascii?Q?P1MStbNT6KaLu/GNZYtNAqj4OyGZ0MTMquTw6xK5mawl/dqkFzcxEIYgDBA3?=
 =?us-ascii?Q?snkepDhe6K47VExdnE2CuPDg/NI4uuu88H9bLUkf96EEanJIRYUwsow69CAo?=
 =?us-ascii?Q?Xbt+5igjI4LVEH/EnIGybUgO2eCM7IcezwhohpS3qaERLT1brIw12Foo6FHv?=
 =?us-ascii?Q?0J6d3XUEsETZPqyCu0Y25en2O+RrlHP66RYI9+UT/S/SZ6GOejcSizJTMh8F?=
 =?us-ascii?Q?EfH/OWoYcv0/vylho6IL/qji21NYGFe1gKmwpOzjioE+jVC9CtGzVpqZz1p1?=
 =?us-ascii?Q?ScAhQNQ0J5ODhWiCpDBPZZcepRDZ1RhEiGKL7NotbNaps4TZ64vIOc/oMAsn?=
 =?us-ascii?Q?hDlGdxr6oHk13mqre2EuIxqiP/SMlK/hziON6QxfASOVy/V1M6hNbcAAcTpS?=
 =?us-ascii?Q?F2lu92WTvb0/P9xzWXNdNBJ+Pf3gYSkAX+4J0ZZ6GhxF9lYpo6ba4sry705e?=
 =?us-ascii?Q?y+waNjUIw+IV40HOCM9M6n8SijA3ZzyrN63GFbv6rN+kmfxVajpuDCVv1lk/?=
 =?us-ascii?Q?MRXhJ5wHvqD37M+wOrfJyJ2xLdoUnGQigtCQLIDOic37APfsE36kkXP+u6q5?=
 =?us-ascii?Q?H3YQzpqjPZbw/TJqWBPjCu0RmTrXH49iC0ucdgP+suolR/lWvA+IIQ2Kng4m?=
 =?us-ascii?Q?neoQdv9LsZXHP5IlYdhejVihtGAdARh7i1kqwcDUqlS3un9gXI2KFdxEVAkp?=
 =?us-ascii?Q?jTEf6J3aQZwE2Iwpsrb1A/nWuKLjECn2ocEz5LrXuRXmBZ898yzWNALq/8Lj?=
 =?us-ascii?Q?3NomTUM984OH9Oh6mOvGVNYkuyZlVyvYCV8nAJ5cSt34nL2REY8C8RuwXi62?=
 =?us-ascii?Q?GwOpV9aBeR3F/gpEjZHK8PsoOVmSOepLZd93G+aP5JdVOzDg5lk/hhVLOd0C?=
 =?us-ascii?Q?L9SlkCOOzTDKfVz9a7mAZtLyyjudp5WZvWYBaoYlI8Cvwa2hY5jRoyuj5nxV?=
 =?us-ascii?Q?k2UebUdknYupPl2rI8e6ou37qsUKCB4T+YABdFq0HoPBjVib1Nc4EBNIPDyi?=
 =?us-ascii?Q?+SmNerJWCPz0k9UKsBOrmyZHw/Be55+wH+Gwt7VswoU/lQFnPyFg0NVtnqMA?=
 =?us-ascii?Q?F+H71ixmw0H/OxW27dqbx94Xl6dHO/ebXtm8ScQFrUbw3W28cl3UdcI2TDnR?=
 =?us-ascii?Q?cyV2BHV5+qkGkLF25YS3Auvd+tpdNNoTnwPm7aNjyKDf+NEk1ybENw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(7055299003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sA7LLxfRS+PzhcOFvvFO6iFi5v0uYlArrslTXFNcv2txPAlqAo0+OIiJscat?=
 =?us-ascii?Q?Lrhh7NQj5WSudc0CN+7j+rHl4BS1Z2llcrSume1/lnn8HZH9+q07idRPltQ6?=
 =?us-ascii?Q?Vst/5K5LDzN6P5m9Xgpx7RQhZCkWAkpeXj4YnFqTd4qPV+5nyoEcT90qJe0p?=
 =?us-ascii?Q?sW3hX5NxJ3DMb2zDiFTZyOkSQqfs/1Q4lGyxITgd9dUsa/MIOTq7z31WmHal?=
 =?us-ascii?Q?L2kkWO9XjlZHq/F3RP2lWePxj0RiOfQys6AmuhqQWzHc2sXtmDNxgcCDaP0J?=
 =?us-ascii?Q?T4c5dYY1f5ss6069zP5cDdfa2zIDgCsg2X1CM6dGkW0cUuaEdobWKjuX15r1?=
 =?us-ascii?Q?YTI3gbZqp0ZE+D3oY3wZ4OzimuymzASQZ6KoAVOfl8Xfy5021wVCaoqzZ4sd?=
 =?us-ascii?Q?qvuZsfVY3+EoX5w6CweL0jxCoK7A7/fj21vnSkSmUNzbLlHIP2+fg7DAnLp3?=
 =?us-ascii?Q?qfJtoKXrAXkYAZJiPxSirMza/BIbdFHqVLFYolBLjdhsmO4YAf70XrEL2oqo?=
 =?us-ascii?Q?aDy9a3g+0qzPCa4UMlEnCzNyGPjkwUd4fbsgDA0hqhfUbRu8tp6mp9LGKxFC?=
 =?us-ascii?Q?0+4JT8bY2VIy48NRnfCLWs+GcaMmFtyqzPkoj8a/RBtWyIufafAS/qgZPe8W?=
 =?us-ascii?Q?Q3T8d3nuCUH/V/EmVYOl71jrxHeQot7OOma7PxuLEzko6GA58j5ZDlW3v4X0?=
 =?us-ascii?Q?G4ICiG4NpQHhBCmQuEnE3VtyQG139RApBjU1PTu5BaRHEUl6ZPBkSBeAdqYu?=
 =?us-ascii?Q?CWGzeL7WejhDAgTOMO4rQfgTigSq+y9uQSgsUr5falUkVyiC0aQtRftuCzCV?=
 =?us-ascii?Q?DdKbc1fhIQ+PZRisnKDO0N/i8UOSWSmowLQZll/2AoieObAtBnB4o8l1t8wq?=
 =?us-ascii?Q?RqzzmOuCd+0kuH+c8SCGUDK4WUhVe4QO/ENcSh/iPI78yN+Wccy8GIRMFGN3?=
 =?us-ascii?Q?yyvMw7bEmzrNssmh5AlIiQ3ZLUYlodKrs3855z1NYdS1TSu6TtLxYmzmM+Mm?=
 =?us-ascii?Q?5Ddm0w4MmmGxvHZVx4Zt3eOsftVMzkork/AMVyVp3aR+RfRfRSt9o3GE7Uek?=
 =?us-ascii?Q?D99KYYYDLA8I1P9Ks/gSm6wKFw3YbO+rpDVoTjexDeGP6X9cZShAJMIQJ65D?=
 =?us-ascii?Q?TEDvLGSmh096BihJ75sztopwvQ/VOysd2zORzv8VNGS7fhhEWLeGj2pkw0Cz?=
 =?us-ascii?Q?kM6mcxWAU84q+juXRBUxCSwT0UKXMyNoPyUozd3CNUGYo3aRIVQwpMLldq3d?=
 =?us-ascii?Q?5MGQElHHU+4seSpX+nssL+aDPoG2YflNyeAU9NDPk2cB+RCTp1OJVZhOM9wx?=
 =?us-ascii?Q?R02aIChUjb8Wa9/OA0wn80vS/K5lKuW+XKmU0RhoUJboXKnMRFAAbQ8JzW62?=
 =?us-ascii?Q?i7mrQ5PiO13aD0h2Xf4KDCs8rqskGbx/l7R3ErHLC9hL7J0YDsp/cjMTnECe?=
 =?us-ascii?Q?dWOhepfGUezXa4kY129fv9U0jdl5OkPIxwIhMSCXXrjKCk9s+wajFWa6x9Vp?=
 =?us-ascii?Q?LvfNJuEICUilmVPIfYlHDMEbsGoxv7kCOlcH2xJnrerjM/WF5VFOpn3TYmTG?=
 =?us-ascii?Q?3+rLrL9BpAirA7+DPbk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea8be90-0ed9-4fed-bad8-08dd2e08e368
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 04:16:26.6328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wm/lB9Cj3wNNpkcpzVFM1RBVQfIuyYzoHSQgNLggq3OUHDCejKWSYGl4voljSdmYJkM/Cwjs5WYmw94D9X2PoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6701
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Monday, January 6, 2025 9:29 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v2] tests/intel/kms_dirtyfb: Add logs to skips
>=20
> Having some logs for test failures & skips would make debugging much easi=
er.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_dirtyfb.c | 37 ++++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c index
> 35df9be3b..4cbd1a2f9 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -102,21 +102,40 @@ static bool check_support(data_t *data)
>  	case FEATURE_NONE:
>  		return true;
>  	case FEATURE_FBC:
> -		if (!intel_fbc_supported_on_chipset(data->drm_fd, data-
> >pipe))
> +		if (!intel_fbc_supported_on_chipset(data->drm_fd, data-
> >pipe)) {
> +			igt_info("FBC is not supported on this chipset\n");
>  			return false;
> +		}
> +
> +		if (!intel_fbc_plane_size_supported(data->drm_fd,
> +						    data->mode->hdisplay,
> +						    data->mode->vdisplay)) {
> +			igt_info("Plane size not supported as per FBC size
> restrictions\n");
> +			return false;
> +		}
> +		return true;
>=20
> -		return intel_fbc_plane_size_supported(data->drm_fd,
> -						      data->mode->hdisplay,
> -						      data->mode->vdisplay);
>  	case FEATURE_PSR:
>  		if (data->output->config.connector->connector_type !=3D
> -		    DRM_MODE_CONNECTOR_eDP)
> +		    DRM_MODE_CONNECTOR_eDP) {
> +			igt_info("Output is not an eDP\n");
> +			return false;
> +		}
> +		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
> +				      PSR_MODE_1, NULL)) {
> +			igt_info("Output doesn't support PSR\n");
>  			return false;
> -		return psr_sink_support(data->drm_fd, data->debugfs_fd,
> -					PSR_MODE_1, NULL);
> +		}
> +		return true;
> +
>  	case FEATURE_DRRS:
> -		return intel_is_drrs_supported(data->drm_fd, data->pipe) &&
> -			intel_output_has_drrs(data->drm_fd, data->output);
> +		if (!(intel_is_drrs_supported(data->drm_fd, data->pipe) &&
> +		      intel_output_has_drrs(data->drm_fd, data->output))) {
> +			igt_info("Output doesn't support DRRS\n");
> +			return false;
> +		}
> +		return true;
> +
>  	case FEATURE_DEFAULT:
>  		return true;
>  	default:
> --
> 2.34.1

