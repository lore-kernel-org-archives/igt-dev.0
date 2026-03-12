Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DA3103E2FC
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 01:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9192710E16B;
	Thu, 12 Mar 2026 01:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/BA1BFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E4810E16B
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 01:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773279579; x=1804815579;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fM7SiTgcVnO4xxeMuhjuHUGrPixIftgdiqR3jbYoZ1A=;
 b=m/BA1BFYO8BhSbiYhIcS8ePF3LNtuWeZfxxyA7v5EBsG2bteqrvcrEfM
 w1eZhTBsQdkm+pOLmmYDyfdsk4Wnya6rMZEkF0hKRH3c5jVOBpWletH3X
 7tPN/zS1Je+T12lM2Kw7AG3VzlD/RzjyS2TuWyimx+lWlbprNdD8ewt+5
 GkjeghoiqdMwwBfr50WkyYImgyQLcvPM40WUzrsKm80t1uH8a8XDELrBJ
 wuf8WuRr72LGaL2cZJV40awc0XgLkysz8ikXNrcTeHtMojgYxyhNIpVpo
 Cbvd4Lm5oLkk9Tm26TY825cM7gSf3KdUPPUmXhwdBh3y+LMLlmiwK60Q4 Q==;
X-CSE-ConnectionGUID: k4y5cqeEQzaDRZ+MD7GKLg==
X-CSE-MsgGUID: ZBtiGYuQSOa3Jg9vdUCTDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74240549"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74240549"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 18:39:38 -0700
X-CSE-ConnectionGUID: ILV0jqDQRqC6zWL9gWtq/g==
X-CSE-MsgGUID: nx3UYVt4SvWc35BLYk+7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225106292"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 18:39:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 18:39:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 18:39:36 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 18:39:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCjyabiEL/k+7CVFgbuJeW16J8wAL5O+oEU84o/cwCx0yoiRQfcFFIZO0FoYpw3iYXQ7QvlJHeOsEA+G5/p3Xb7kxxG6+AxEflvUoYwkhM5BTNq8m/BeYC0V8RDN7zxk4yuLPcPlWfZsKU3o6ZSuXcd6RonGh1ziKVCDRliJUgaxMHjvef62mLtMKskNR100qLIsQw5XJaPv/Ky76PFxoQFiMVtbl1gOZkCu5r39sG9GfTdy/U9jMIfSgzOq6DvEoDIBWDEcftEMWvcteAwA/Hhw3IrPw42Gbmpm2AmhlumYJTxaj/9FwmrHdioyJTs2qsQTmyvO7vzstSA+U5P3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0mlMZjKJjYkKTKUC9V4e38bgJuSL/tNoMMye0GfGUg=;
 b=mfueyxwDSAwP8xu7S9mLn5ZyRMbDAcYm59XrSX+piyo3kjG0Zaxgw2wGbrhDrLt4bIdRnTZywsY7XK3p9VD0wLVF3ZgxaVnpQxJK8xMcJzlr0HtVrjPk/zjA/+bMtDT40njCxmwm14Zp2Cl3p7LuufPEVCHHnSZ8OpgU2T4dGOjgnUq/RQi+Fnn8CpsObl9ty9YUESzXy4Z6ltiQhuXJESG54v9zqGdzZb2O1kpTzOiu8+kL3W9+H7FaC2K0A3rDZS4gfX2/A4o8+8QhYeEVosRFuulkC3ezTRAOJifhxz8fth8JesuO5rVveFhrweZqR4Uf9UYIZHZGrpjPXG49tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by PH7PR11MB6953.namprd11.prod.outlook.com (2603:10b6:510:204::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 01:39:25 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%2]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 01:39:25 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>, "Chauhan, Aditya"
 <aditya.chauhan@intel.com>, "Chauhan, Shekhar" <shekhar.chauhan@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] lib: Add NVL-P (Novalake-P) device IDs
Thread-Topic: [PATCH i-g-t] lib: Add NVL-P (Novalake-P) device IDs
Thread-Index: AQHcsHae/G7NrZBKhkK7CN0H3rqZF7Wp4JWAgAA6v7A=
Date: Thu, 12 Mar 2026 01:39:25 +0000
Message-ID: <CH0PR11MB556432CBB8646F6AB70A47E49844A@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20260310101335.8995-1-himanshu.girotra@intel.com>
 <20260311214811.GB4694@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260311214811.GB4694@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|PH7PR11MB6953:EE_
x-ms-office365-filtering-correlation-id: 42d92ec8-27a1-4d75-1f5b-08de7fd83168
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|7053199007|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: TUCtasguF5kAXkpflWqaLEAwHYpfE9SmbzIQzxOLnCcDZT8qAiRX/eIXbe9iVSwjT5y+j8i11q/sKhG2lPIlRyDkXShsOskfA3AS3wi4SMSvky7BmkpPBOmyz2+RYnll7Fz2VcTKxFrUjC7ox5Q94+kZW0qOkyFFhGlYiBki2akBPeRc9RTXGZonzxxxk6/RxYJ5SiylT9mqRWa4YdGU8BkKRr/Db7/MooCjsnBLzC8nCeuI8bzt13fRviPvTos3oicj68qBMt9p/D0ATvaLau1MPNXkIQOfmiZZMqDPvmq9Y18WY9dWZDOJnDr2G6QTUmq3uv86/iBBqS4lQaKH67TN/xQRdXah3Nl5kwHJdKMBEd7R5KdQj3RtsPT4udhGOE/91nItiSr5QngDMhvACRum3xp+FWKQrYLW+yEp6MxqpRLRPPogvVaQOdP6l6q9npfQ1uXnq/SoDLIf80tqvh+AIgJ66MGLoTcC+EE1Mb01VQ2Vzgz3TzeklBeNFiijQ7mQsZ/U643NUz6pWVS9PHlOO/7XrCHqprzFhrzeNURzS+I17aE8B54mbnaALL/l6P4Rt3MyoFLbj3E+nYrUGOj+KyAKt7RmvUuK1vO3uIMT8u4apIqKwX6onujTMn/dbKPJQbXn2In04eakM9dZYKoud6b0Lb4u0nEB6znDzKPE+uwJM4tjJbEKyx6DhFENQHhzzfQrDhiZ2z52zG9PPIVhBPSvGzyxsnSAx/GtV2IvN1Wy4SQoLjw2Hvauul1U
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7053199007)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v0JmLCC3m48+TeSztMPeg/ye33z4J5KwAnL3OqbPH75lMxB2DrF3169DHcmO?=
 =?us-ascii?Q?L4HP5Bu2ItWng/Qn02nXm/40anoc5g2BKLqdAUMY41Z8wz7tTzB79Kk/n1GP?=
 =?us-ascii?Q?G47lkEYhBnANzhP9qOROmIfetAewws+RpSaPNw2WV9u6rshdHPdDf4MWbJlV?=
 =?us-ascii?Q?kGxDzz9gIstqFUM0T+EbOHTFvXA9tDYF0oSJJYCKIWKShPd6tgjTINe+tfIx?=
 =?us-ascii?Q?Vz30keUD1+Vc7Y6d+BE+8dfafgOqBS2kdeMgmXJgYv6ksxQtfZVqsATwjPl6?=
 =?us-ascii?Q?yEDWL1tlb138C8vjptla/qlkO/mDO/ud+rljJlH9wdcPYYlX9A4pnxcCoh7m?=
 =?us-ascii?Q?TZ1T8J8DuZkP0rDYJkpyKruvkPyriQzrdihSbt0dNprhisqvMiiC/Fdg2YU5?=
 =?us-ascii?Q?KCaWnw8rsAHvasZGkyDan8qXruEcSaqlYPRxTMOm8E8VQWqGAgLW517NZ4oz?=
 =?us-ascii?Q?oyDuR3DqCFXQWRaVQCHzSeJcOSempCwTkHcCqV7SyZfHxJn6q67+F7RxYJ6R?=
 =?us-ascii?Q?hmq/WbGGummZdVW3+EPSpYTUno0uGNZUbixONIi6jjfbdfK22djPqVtdbsW1?=
 =?us-ascii?Q?k0BCk4d43OGNXYmE1juKaVE/MUDj5k9Dp0Wf3vwTZORkF7l5F+aRjvCmLZXt?=
 =?us-ascii?Q?l/6lSNmO6Mz7Bg5Daih5tyyDl6n9ydMUyJBM80NWpGVRS4eNY4QhM/L6w/p9?=
 =?us-ascii?Q?XyChpZN1flnu6EfSrqcY3+l758C8aZKMLW4RMkb2HntuSbmolcIlf0TOFKTD?=
 =?us-ascii?Q?w5UOAScQvwjtyoaNHh4j9uhMqDMWkh71SoNJRUoN4gefMNKM0GSUzXugnH/o?=
 =?us-ascii?Q?g+CHqVPfEO7nZE7Whp6CNTFjCMP9hjBOfNfeMLLa8WC6+h7Gs63sab/0dGRg?=
 =?us-ascii?Q?jBOlqQmCya67YYyxio/V+LL6oKfwNapUNafVQol+GRfemfqomuyo1lfAHVBH?=
 =?us-ascii?Q?XZ/yZifP0noX8nkU/9gZKdUk9VZUOp38ORIq5QE5/hEBtDR8bIzQvi0/5D+4?=
 =?us-ascii?Q?8ZYRDjKNKnOCEIosCys2HA/FeHU7oI1W+gNMsZ1Jv5n2u3Od6TxyYkZkapXZ?=
 =?us-ascii?Q?gr3WrcWy/KED0KoWURZUdzl6GJME4U5JnyQ6OIs0/ncj4jLK56AV9v7t8Vs4?=
 =?us-ascii?Q?gnnx7bdl1V+elUPUQO4bwpNWo8jzDvtyCCRMQzRAae+XqBW1/DWLgmsjLsNw?=
 =?us-ascii?Q?DFNwRyArmh87razfNnDvl/Q9KUS2+x3suoQMXl0o3qhkw3z9hLzeyjd4PeiL?=
 =?us-ascii?Q?NDG/r3qisKX96nIVT9EKKmriPmjVYWORFc/yF/Ttq5t1MwD2fXxPA9Nzg+Ci?=
 =?us-ascii?Q?qiJzSz4Rot6RSg76xh9USO6Ps3PdP+AhUxSTzSxvx2MQGbV/ONNe2MH3SuJd?=
 =?us-ascii?Q?aCSnCYNzrQ3E3bfGPz0fNx0/VRLVCmud6ioK74odtMxh28sXF3OnuY7ljwFA?=
 =?us-ascii?Q?wAuARY+VwIPTHhUSGp0xeVk3ihcSfP9luhbQW3yOrK6Hu4seCjZCaPt7I97C?=
 =?us-ascii?Q?bBv5u25uzELzbYlC2+0zI38fouZjzmRyLoCqo9x/uzwLqPo06mPfFyrJU05S?=
 =?us-ascii?Q?9HO+Fv7ppaWwWlDMYI8LS3OIg+AVwN4nEqPgAAkWMO8tNHsBOm4Yt9RPweSt?=
 =?us-ascii?Q?WEz+Hm28U1i0VEhek598APPpV1Dm2s8+9i92vsquk4+VowzfNydo2MkRb83M?=
 =?us-ascii?Q?85yozfT4ejQiV8oBU47mP7BitwZYLGe4xU2F6YhinaVHCqqgRmQKPf6aePUn?=
 =?us-ascii?Q?NjbiFOARfhnJCzMT035xBgltc8qdcWfvhRA8qmAlENRFoxCqxSzE8CDGKDcy?=
x-ms-exchange-antispam-messagedata-1: 9jfA+RDizFKONg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GEZ50QqlH1rDMnopKCudnK1xMsF8DPDCK548uxOFRoMifUO5tTJY0Yg8TuQ3CjCRtkd3WAk5MrceKkTxHZZaCDRK1Hwf42vkqmRLirgzCY2vaXAUK0cOcL4iPMdGqhfj1w7yywOY9vdnfra46sP/Y1I14z5KSIdCqZoX/uU2UAB3wYl1j5MiWHrkEj4tpG5F888g4NxwTW0EkN1jv6uGB2PZ/l4DJus3hcyrdLq2QnJSexY2XDRvkjOAB+JFv/Q3XqI69X5Aw9335cal2XMcY/amzx/6OIRrAilbHrv7teHFzQkQwhjxkhCvjGHhL5reV0M0KsLYSajLCni8fopNeQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d92ec8-27a1-4d75-1f5b-08de7fd83168
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 01:39:25.1477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lTZf/3Twksor9/5iIxRVnTZLdlu1ONtNCtJUqaqbd/CXY8xbCUSQC2ODk4s6o1S9phYOu6I6OM5QJGyj6lCTp0owFrHPLY8gOXUOF2iJgUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6953
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

Hi Matt ,

> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: 12 March 2026 03:18
> To: Girotra, Himanshu <himanshu.girotra@intel.com>
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Chauhan, Aditya
> <aditya.chauhan@intel.com>; Chauhan, Shekhar
> <shekhar.chauhan@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>; igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t] lib: Add NVL-P (Novalake-P) device IDs
>=20
> On Tue, Mar 10, 2026 at 03:43:35PM +0530, himanshu.girotra@intel.com
> wrote:
> > From: Himanshu Girotra <himanshu.girotra@intel.com>
> >
> > Add NVL-P device info and PCI IDs, syncing pciids.h with kernel commit
> > be07d8f707e4 ("drm/xe/nvlp: Add NVL-P platform definition").
> >
> > Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> > ---
> >  lib/intel_chipset.h     |  2 ++
> >  lib/intel_device_info.c | 14 ++++++++++++++
> >  lib/pciids.h            | 12 ++++++++++++
> >  3 files changed, 28 insertions(+)
> >
> > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h index
> > cc2225110..5df7349df 100644
> > --- a/lib/intel_chipset.h
> > +++ b/lib/intel_chipset.h
> > @@ -94,6 +94,7 @@ struct intel_device_info {
> >  	bool is_battlemage : 1;
> >  	bool is_pantherlake : 1;
> >  	bool is_novalake_s: 1;
> > +	bool is_novalake_p : 1;
> >  	bool is_crescentisland: 1;
> >
> >  	const struct intel_cmds_info *cmds_info; @@ -213,6 +214,7 @@ void
> > intel_check_pch(void);
> >  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)-
> >is_battlemage)
> >  #define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)-
> >is_pantherlake)
> >  #define IS_NOVALAKE_S(devid)	(intel_get_device_info(devid)-
> >is_novalake_s)
> > +#define IS_NOVALAKE_P(devid)	(intel_get_device_info(devid)-
> >is_novalake_p)
> >  #define IS_CRESCENTISLAND(devid)	(intel_get_device_info(devid)-
> >is_crescentisland)
> >
> >  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver
> =3D=3D x)
> > diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c index
> > 89fa6788f..b44b24223 100644
> > --- a/lib/intel_device_info.c
> > +++ b/lib/intel_device_info.c
> > @@ -551,6 +551,18 @@ static const struct intel_device_info
> intel_novalake_s_info =3D {
> >  	.cmds_info =3D &xe2_cmds_info,
> >  };
> >
> > +static const struct intel_device_info intel_novalake_p_info =3D {
> > +	.graphics_ver =3D 35,
> > +	.graphics_rel =3D 10,
> > +	.display_ver =3D 35,
> > +	.has_4tile =3D true,
> > +	.has_oam =3D true,
> > +	.has_flatccs =3D true,
> > +	.is_novalake_p =3D true,
> > +	.codename =3D "novalake_p",
> > +	.cmds_info =3D &xe2_cmds_info,
> > +};
> > +
> >  static const struct intel_device_info intel_crescentisland_info =3D {
> >  	.graphics_ver =3D 35,
> >  	.graphics_rel =3D 11,
> > @@ -681,6 +693,8 @@ static const struct pci_id_match
> > intel_device_match[] =3D {
> >
> >  	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_s_info),
> >
> > +	INTEL_NVLP_IDS(INTEL_PCI_ID_INIT, &intel_novalake_p_info),
> > +
> >  	INTEL_CRI_IDS(INTEL_PCI_ID_INIT, &intel_crescentisland_info),
> >
> >  	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info), diff --git
> > a/lib/pciids.h b/lib/pciids.h index 6e53fb4cd..d4a09ca12 100644
> > --- a/lib/pciids.h
> > +++ b/lib/pciids.h
>=20
> The commit message says that this synced against commit be07d8f707e4
> ("drm/xe/nvlp: Add NVL-P platform definition"), but that doesn't seem to
> be the case.  When properly synchronized, a diff between the kernel
> version of the file and the IGT version of the file should be empty.
> But in this case I see deltas related to BMG and WCL, and even the NVL-P
> definition isn't in the same spot.
>=20
>=20
> Matt

This was an outdated patch , the actual patch to track is https://patchwork=
.freedesktop.org/patch/710859/

Regards
Himanshu
>=20
> > @@ -893,6 +893,18 @@
> >  	MACRO__(0xD744, ## __VA_ARGS__), \
> >  	MACRO__(0xD745, ## __VA_ARGS__)
> >
> > +/* NVL-P */
> > +#define INTEL_NVLP_IDS(MACRO__, ...) \
> > +	MACRO__(0xD750, ## __VA_ARGS__), \
> > +	MACRO__(0xD751, ## __VA_ARGS__), \
> > +	MACRO__(0xD752, ## __VA_ARGS__), \
> > +	MACRO__(0xD753, ## __VA_ARGS__), \
> > +	MACRO__(0xD754, ## __VA_ARGS__), \
> > +	MACRO__(0xD755, ## __VA_ARGS__), \
> > +	MACRO__(0xD756, ## __VA_ARGS__), \
> > +	MACRO__(0xD757, ## __VA_ARGS__), \
> > +	MACRO__(0xD75F, ## __VA_ARGS__)
> > +
> >  /* CRI */
> >  #define INTEL_CRI_IDS(MACRO__, ...) \
> >  	MACRO__(0x674C, ## __VA_ARGS__)
> > --
> > 2.50.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
