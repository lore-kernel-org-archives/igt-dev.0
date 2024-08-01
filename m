Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C2CC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE34E10E968;
	Thu,  1 Aug 2024 12:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nID4vyOw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2A110E968
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517148; x=1754053148;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G5liR4HXi7cWZNX06xzPLmYh9mElAIvxphQ44B/4VlY=;
 b=nID4vyOwpJi3WeVo8WInshS/+uVb1ecLZjnYAAhY75lUxz6HOF40aYyO
 1uBh8ssKUv+fnvZQoeKlNAMhRRqYtIp8H2F3TkdwI81AEvHY88PTqG2ve
 m0wdEN/mEiQZ18fUjjT011aW/TT9Ui0R+ZN9tLKnXL/RpCoeuxn/VM7uo
 diiZGc+mwRubhxQbbYGQM3TOtbn7GQSrF8R3ZQYH9gAFVQx7Z3WRbrGzU
 TyS4p2ePwSc48BOWn4077Pnib+RaTUkgNHCqTWmxoC9FgYOIa3FkYnE3G
 gIpBqPBfGcrONHu/mQCgzV/I5eqo/ceP8W/4Vn94IRcvTpmQ0Mtjtz1p0 g==;
X-CSE-ConnectionGUID: XwkzXrAXQkmCg9yIT4NkFA==
X-CSE-MsgGUID: dN47CtjkSZauRgob/L3OUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20587273"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20587273"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:59:08 -0700
X-CSE-ConnectionGUID: 2ePEiGeLRAq9z2hnYbQZnQ==
X-CSE-MsgGUID: s4w+x3mUT6OTe5rOOk/BSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="92554910"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:59:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:59:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:59:06 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:59:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=On2HAM2lXckFeQssA5HuBJML/hXrOaXWP5AiH4IILVBvfcVwYg2UqWI0YnalGn6JeIh4IthrXvGIAlLqwHsi1uJuptre2QCf6E1WhjnhuorX6Di8tPlKQnbgBHtXRA/xaF3jVDtzsXSJwceY+KS7nJz9FCz0yHD13DiFndHozpkz2snsF7xFMRtBBZilS2jtbRRK78w1Fp3Erw274Dahoc3EXJpEuHSW9tkRZ3ukZoaEi2lHUaASXk9u8XxyP0lmkCqlxfyOauTjNwF4igMEWWsSvNNj9N1ZK4u6WhDmZ2noyiIbd3tKeALcvcEoszEhCXBap1ZeM1tWnv/g63AazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhEkMZXWBHq6zvbamEEyrtqlsisUmg+O3KJmZelBddo=;
 b=DIK9z1pn+HPC1/3Aof+D0XODWmXjdawQ7KMwnNwAPEtZqU4trBS7RFnHp6BRy1jLBEqPQttOyL0nQcQQU+XzWQ5GPD2k8LsyX/Mm2TTIVXJf0IlZj0TRShLagN51nXYBQJMACHxC2NY+TcUhtt3ZH2fWs8aeWfUWG1FMu9XahLpIiJP8AnINN4Dn/AQkp4WcG4hOX9GzHC9kHP/SeAsfUEIM5q2b3N8AxjGcGZWG4lcCmdX1gPddVNsU7+8HZMeOa/AwqroLKm2nMI+ND3Mvcw0lh2VJWxD2G5hyYTdY5ZoFaWa0dwDbAz/8JP1Fb/13B1ODEacy6ZUr4wOlkQTz0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.30; Thu, 1 Aug 2024 12:58:59 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:58:59 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 41/66] tests/xe_exec_sip: Add support for dynamic
 debugger sysfs toggle
Thread-Topic: [PATCH i-g-t v2 41/66] tests/xe_exec_sip: Add support for
 dynamic debugger sysfs toggle
Thread-Index: AQHa4nZ17BFjrP8clkq8Hp2/a5aPMbISYCGw
Date: Thu, 1 Aug 2024 12:58:59 +0000
Message-ID: <DS0PR11MB72649731308A516886A61AF8D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-42-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-42-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|MW3PR11MB4553:EE_
x-ms-office365-filtering-correlation-id: 7aad695a-a0da-4832-26fa-08dcb229b5ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?4mfZxvzaGKqtqYS86g8tEPGpwyuG2CaQUU/B7gHuEf5SBBoDhIndl8Rcql?=
 =?iso-8859-2?Q?b9x9TqEMZaxUt4KiUP0AVpDDTewF/0eg+HpT5dQwgMzgji+3nGTEimQlGj?=
 =?iso-8859-2?Q?qDvtacMHqmRDDAL9JQ0yfKhcRKq5YUUKU/CSpu5xA78BJR59KfY2JcLgaS?=
 =?iso-8859-2?Q?PsH/47+gCWdqnMeIA5+P+3ltspI/atqvYX5iXje4IJoiYXQ62YzadVXqcC?=
 =?iso-8859-2?Q?8QFQe9tEwfUlXWpq1wJNFURzbulVJ5TFYWmz2PuY/fhgazd0yPBD41IGrW?=
 =?iso-8859-2?Q?ruUhKy/5ySerOlX00bTQKbWD9C4LRsM6FmSHloqh9r2CKr9szaNghNRI5P?=
 =?iso-8859-2?Q?aEsHdURUXXGYCA95hN3fjHI7MY99ZPBmFt3lARWVr/BrrPVGNYFYQtyKQa?=
 =?iso-8859-2?Q?hpiclRYK2VxXC+Oqnb1hZbiSB0d42+ZIFLivXEwTEN499mDsD4+0X9x3yx?=
 =?iso-8859-2?Q?juuNazXGJplSGoTc912DHDDVAlczzwjErROuYCNvDXKyeCvoidwafA0R0g?=
 =?iso-8859-2?Q?cDx+NrD73Ct72msGGlSLrPAD5ZxMkKTSuagyxinFQihfKCUa3iyphx8Dgg?=
 =?iso-8859-2?Q?r4yyJBNDHg3CwvPnhZuu8JjTQHpLIICKUNG0Khz2NZfdhEy16KyuzRr9fr?=
 =?iso-8859-2?Q?x9re1ZKAmQaAnlUZiSeVGGh8yuBIr+HzyDaSrp4QsP2XqLNnvIJV0k4OZp?=
 =?iso-8859-2?Q?VNtN8icZHyidRP223gTkR50cjiZE16NePmstDmRVo4vKHwMVxJl2gndwov?=
 =?iso-8859-2?Q?D+hcvY7VKorUIytlM2WOpV0zdPuYdloTOHwNubRiF/MEahzjNfDdAzQ4m6?=
 =?iso-8859-2?Q?NlT4NOoal8OpO2VMNngFTyKnGlQnc+2dYpcMhLv1hVI4HM9RKsOxf5t8CB?=
 =?iso-8859-2?Q?pnqoOuz/xOMWYWodw8keaN61MWsTAGGngiVm2mVQO2/msZcVs1/WccWHHM?=
 =?iso-8859-2?Q?37F6+dR/YJ1g+J1pydyOssroUb+e2QgdJm4fqP2ZR923yHWjzuTHGMHwjW?=
 =?iso-8859-2?Q?vN99Vt7MXyGslSNpmgWFqw5aiPmOfpuIbKJXfA0tsB7ynimbqTWuh4fq65?=
 =?iso-8859-2?Q?VzXWY6Mz0Rj3vtgpiS/BL6Cfu/r7pQFsvTjrV7aDdcBvDyOpcd8R6eXziC?=
 =?iso-8859-2?Q?fwtv88lPn8JtA/XG8I09dosJ93VGJhdJmaI+bKXdvEGKnKZ8qtQceabl24?=
 =?iso-8859-2?Q?0ru7x75euDPkg5qgj1K7IvqmSOVqfHa2J2Zu6OQhsAtQ23YUXFWOGLWYRA?=
 =?iso-8859-2?Q?0MPNc7By7kV+6id82zrC8qwru61mVSW9i4SOh08DooBlP9DJG6wEjMNHVz?=
 =?iso-8859-2?Q?DvRSoFJ8b8+hLsZuO9JNdZ1hjHfvKT6g68wz6eYJOpr/LhjtKnx4z/jsBN?=
 =?iso-8859-2?Q?JeiucMSYXmdAp0k/6pMwPAHYplQ9rKBZeTUgNQ8BxvQFMC4wrHYoqaGrSn?=
 =?iso-8859-2?Q?aBOf4u6MTFkHHVldfLXV3hBXm1fhoxs7lHZv2Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?T4dS2tBDUY9bMzH3Ww5PdFFAnDg2aaudPB0Zvs6EjXG4ijIeFQnYMZlaon?=
 =?iso-8859-2?Q?LM8XjvjjgwrhIibef20RZ+iNdMKDzIxz7QfFyF0+nf1/mjoGC9WBwOpyGE?=
 =?iso-8859-2?Q?UxYVida+X2UwSLBPWTZuzsgb0yqmJsjXDTeFqSCBh8MqWCwSJUwqPrM5Eg?=
 =?iso-8859-2?Q?Jmt9OGrY+wUAnUyWPYeiO10Vd/rrr5bVzO2eKs403DZx4aYgWDpjiz7ckf?=
 =?iso-8859-2?Q?90YF4nlMWXJiea+ZSWek9Yh4BPYeTPXOLhCtr2Z4MBXzB7MupnZKKHam29?=
 =?iso-8859-2?Q?Kd+F1TcCt7Y4zk1DVVCfaoPWDEZtypEvZROXwZQQR+bcsXyVPqfQFZP9EO?=
 =?iso-8859-2?Q?95Z6z8TovDxWGm0nNfEp0oc2iX+pnXf2WjJX5P0BvvBJfhw0dKmoJhUqUv?=
 =?iso-8859-2?Q?htCGCzY4kXjhkdORq3r+7CQFZoU9YRwZjvJjT9mTsZeqqVvZMTHy7QOBla?=
 =?iso-8859-2?Q?rbgFsNHmGTNAc3xgJlNE7ZUpEgWhn/satf0vXxauzCdBVrkf0V3ay/B/vF?=
 =?iso-8859-2?Q?9E2TOKMbvcQvxsNfnFSxnICLsOAQ7fekReEKD86RMaKjfE31m0oX+AGBoj?=
 =?iso-8859-2?Q?P4U6p8dHkMHBTlLGBQugNU6qoBxAIBqjZeWgGFxCojLKRCsIWW7kIaTzuN?=
 =?iso-8859-2?Q?WalDl/3V1IwaCjTfW+lrRZ4OzWydztQ6zPgYNw++dABX2BpleJsPzRC4uV?=
 =?iso-8859-2?Q?1epcQfBGdUyuv+K8/2hDGg/fQT7H7iXzJmwFl1btGxyBBfj3fbWMHCjTds?=
 =?iso-8859-2?Q?Qat+Uhl65WWZAvF1jgDS2lZaTXeKsj9RDkWTVNAD6vkZ1yADcJJE9OTGIA?=
 =?iso-8859-2?Q?AJJWk3w0pUuKJh7D4I9d8+nYHcn5BXEsTwQRaoo3RL3c/DFZKEdRaYraOk?=
 =?iso-8859-2?Q?eNDpSUgN9sa0eMZBz5Zj8zFF9Mffjeg8QfSQqTNkL1mDEW/W51/mKmnMlL?=
 =?iso-8859-2?Q?xVFCzKKV4N5jO7vXe5PpgrcplGg+wvNuKkp0uHfYKP68qlFIFFWPoVFwRq?=
 =?iso-8859-2?Q?1c6UPxy9JKL3bOoS48o4JibvPIRHuDfloCh16nPejCvEZFTSqovjP4fIYO?=
 =?iso-8859-2?Q?pLpr+tE1yilhr8c9YAc7brOq1qx3Muk8QB58oS2zyAu6ft4O7pEVqflGfi?=
 =?iso-8859-2?Q?JRRk7UUS9DowCf/2Gk4UH+BFU3ztwNGCM4oi2WtwBXM5QyNCBgvNOOVIaT?=
 =?iso-8859-2?Q?/Ag4B/rbX0sKx8WxLAKsGYRtjSl9IUsqrPjo/4XMWqs3rfuxlae1e4D742?=
 =?iso-8859-2?Q?1MoZBX6PrH32iZhDmmhbS2T/zJub1+t46WZhc5p7YjOkJdpIYg1cf4hPrO?=
 =?iso-8859-2?Q?CqtPZLmHZEFgm+msOgNe+1N/VVXSuju+Jmdpd4zOrEzUnnrOUT1Wei1Ttz?=
 =?iso-8859-2?Q?QgkhQZbJnkXjsZXxIVS0veNbiLdumPn3bdf39Hh5z72agCWBjqtdKQTDBl?=
 =?iso-8859-2?Q?sGIR1PgQY5FE0MzHF0ab1vKhh2YU4VjqvDxWwVPNbLsjC0Bt+QjaVG3DIm?=
 =?iso-8859-2?Q?mD8aor9DmLt7nqGhU+/579cgpn+j4PU5a/SVoAun9QJIHlcEcf0jfY++2h?=
 =?iso-8859-2?Q?hPlLpwx69wj36Enk+cREyqOCeco2ocoNTNqvassAlBhy40LcPHcx+37Mv6?=
 =?iso-8859-2?Q?HuV6Say/527Pm+w8QpGvy6dPi9EpKOxb0VrFyuUXreTSPAtUQXltIh490t?=
 =?iso-8859-2?Q?jYNZNqfVF9KnP3mgQYo=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aad695a-a0da-4832-26fa-08dcb229b5ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:58:59.1931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VcOWIkswYZeTawF8NB6X+L1+I8UTnExfjzC161v9o8NcnPsQXCRfJX99Dg8TtIvEf/kyqwE1SWUUrIJTQOg+95ma8H7qBa9p/fcxfEpXMtYkzUEY6B2Zbbuj+vFvvlDF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 41/66] tests/xe_exec_sip: Add support for dynami=
c
> debugger sysfs toggle
>=20
> From now on the debugger is disabled by default so it is required to enab=
le the
> debugger before using it. This change addresses that fact by calling nece=
ssary
> library functions within test fixtures.
>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_exec_sip.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c index
> a315bd3a9..832c26bac 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -123,18 +123,6 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb
> *ibb, const int shadertype,
>  	return buf->handle;
>  }
>=20
> -static bool has_debugger(int fd)
> -{
> -	struct drm_xe_eudebug_connect param =3D { .pid =3D getpid() };
> -	int debugfd;
> -
> -	debugfd =3D igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT,
> &param);
> -	if (debugfd >=3D 0)
> -		close(debugfd);
> -
> -	return debugfd >=3D 0;
> -}
> -
>  static void check_fill_buf(uint8_t *ptr, const int width, const int x,
>  			   const int y, const uint8_t color)  { @@ -180,7 +168,7
> @@ static int check_buf(int fd, uint32_t handle, int width, int height,
>  	}
>=20
>  	igt_assert(thread_count);
> -	if (siptype !=3D SIP_NULL && has_debugger(fd))
> +	if (siptype !=3D SIP_NULL && xe_eudebug_debugger_available(fd))
>  		igt_assert_f(thread_count =3D=3D sip_count,
>  			     "Thread and SIP count mismatch, %d !=3D %d\n",
>  			     thread_count, sip_count);
> @@ -305,7 +293,7 @@ static void test_sip(int shader, int sip, struct
> drm_xe_engine_class_instance *e
>  	timeout *=3D igt_run_in_simulation() ? 10 : 1;
>=20
>  	exec_queue_id =3D xe_exec_queue_create(fd, vm_id, eci,
> -					     has_debugger(fd) ?
> +
> xe_eudebug_debugger_available(fd) ?
>  					     to_user_pointer(&ext) : 0);
>  	ibb =3D intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL,
> 4096);
>=20
> @@ -338,6 +326,7 @@ static void test_sip(int shader, int sip, struct
> drm_xe_engine_class_instance *e  igt_main  {
>  	struct drm_xe_engine_class_instance *eci;
> +	bool was_enabled;
>  	int fd;
>=20
>  	igt_fixture
> @@ -349,17 +338,21 @@ igt_main
>  	/* Debugger disabled (TD_CTL not set) */
>  	igt_subtest_group {
>  		igt_fixture {
> -			igt_require(!has_debugger(fd));
> +			was_enabled =3D xe_eudebug_enable(fd, false);
> +			igt_require(!xe_eudebug_debugger_available(fd));
>  		}
>=20
>  		test_render_and_compute("wait-writesip-nodebug", fd, eci)
>  			test_sip(SHADER_WAIT, SIP_WRITE, eci);
> +
> +		igt_fixture
> +			xe_eudebug_enable(fd, was_enabled);
>  	}
>=20
>  	/* Debugger enabled (TD_CTL set) */
>  	igt_subtest_group {
>  		igt_fixture {
> -			igt_require(has_debugger(fd));
> +			was_enabled =3D xe_eudebug_enable(fd, true);
>  		}
>=20
>  		test_render_and_compute("breakpoint-writesip", fd, eci) @@
> -367,6 +360,9 @@ igt_main
>=20
>  		test_render_and_compute("breakpoint-waitsip", fd, eci)
>  			test_sip(SHADER_BREAKPOINT, SIP_WAIT, eci);
> +
> +		igt_fixture
> +			xe_eudebug_enable(fd, was_enabled);
>  	}
>=20
>  	igt_fixture
> --
> 2.34.1

