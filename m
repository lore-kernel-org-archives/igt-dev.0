Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F38C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 09:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA16910E9B1;
	Fri, 28 Mar 2025 09:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lco2o+nh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6632310E9B1
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743153810; x=1774689810;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=f2IvubcAVaHUCIJVvVUNUK5szqwXoB4Di7IYK7+KzAU=;
 b=Lco2o+nhoKoS3pu+TmKRBQP0+g+VahAKdil5Lvhoznx8PYR2yqzJmOcj
 6VxTBmjFm4ZnH+AQWiVNR3OYHhsBFGJpZUloXx9yF8rTKCp0VFCl4S7eA
 LTrLDyWiVpgASJje4YQ95hTPYrpxaEZ4L8yZYur/t7rfiExj93jQeg2wc
 gygElnAEGTmYWHs9OxVvW4lwE2zbqjXJCwE4H/AcgyjHeFvfHqB6c9AJi
 L+x9srUfKlGEfYjozjRU0ZcfRGG0hcCZg0Wu6XEYYEOqqvAPp45yV9KIZ
 N9zrsSjvtkLy9zJDZ/QFqkeYq38zeCBzevcMGSzCtAiLzB7TBJFk4hd1G A==;
X-CSE-ConnectionGUID: sgI6UmBrTEKFwWTTycGu3Q==
X-CSE-MsgGUID: 9RYij4RoQPaGNQgmYGduvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48383642"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208,217";a="48383642"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 02:23:30 -0700
X-CSE-ConnectionGUID: t/19FWvyQyK00vSeHQs2fg==
X-CSE-MsgGUID: D+1bBZDSSfm6Odfh1398Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
 d="scan'208,217";a="125380848"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 02:23:30 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 02:23:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Mar 2025 02:23:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 02:23:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6Dn71MnAsp3Cs5TOFElOg5cRbvwgeH26mXPsIn1+m4sCeytnNWphquwyScMVp7XjUiYDvb1zjNo5eVhEvuY2HWDSZ3keXETY+gEPE978ns/kvwVySyQO0EDnSdkTFix89Oo5IQd5hMIs+yz77/K/LKeEYwXEiw+GDYnRXcj4So+TPiVreSeeVeod1/tnhvh+hgjmmCfgbDLT+8JdF0BUanRQ7fuhdQg35GdctLCXNURuV1MB0GvYpSNRj2BRSbPJ/D3ZU3WLbSUChG9EXKwAFIv46a+dqI8MV9eIOFARUiVPu9ML24jS/GCFEyP1AJcCtMt0BRKsvH9qTut4GSxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2IvubcAVaHUCIJVvVUNUK5szqwXoB4Di7IYK7+KzAU=;
 b=qQIcVoKluO45jMyg6osqRivosX+Kcz+YyTnx58OU05NgBU3GqvOnwJs0GimhCSqu4FWPxolgNWCbEufrpN1ESNthwuejSnnuxthSXQUGPJRL9hLtBl/MNSxVZ+bBugl57QMMwtskUR9DabKU5a1HYApOgXeZvpfHMEX5eUkWjqQjbdHXXmjvGBEqyOqTm7CVC1Zi7Z7ZqC/YqrxEPS30Bb7J7ubSYK1OUIS3ZG5Y+S1WxV8QTBaJcVdOWLLAL57DDN/s06WzAf65XBqsjIH5N3pgcRVVtNb2VH46nwZYQz1yCD0VONgd7A6CrhTaImNVlP5SRv54NjG5GQY5Ej802A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:23:27 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 09:23:26 +0000
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
To: "Sokolowski, Jan" <jan.sokolowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Manszewski,
 Christoph" <christoph.manszewski@intel.com>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_exec_sip_eudebug: disable some
 tests on VF
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_exec_sip_eudebug: disable some
 tests on VF
Thread-Index: AQHbn7pE7rccSxJENEe5XP03FoNCVLOIVyMA
Date: Fri, 28 Mar 2025 09:23:26 +0000
Message-ID: <BN9PR11MB54826A76B128ABB160AB18B2EBA02@BN9PR11MB5482.namprd11.prod.outlook.com>
References: <20250328081916.251987-1-jan.sokolowski@intel.com>
In-Reply-To: <20250328081916.251987-1-jan.sokolowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: BN9PR11MB5482.namprd11.prod.outlook.com
 (15.20.8534.033)
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5482:EE_|MW3PR11MB4572:EE_
x-ms-office365-filtering-correlation-id: 374a51b7-21ef-4d3b-72df-08dd6dda3231
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|8096899003; 
x-microsoft-antispam-message-info: =?utf-8?B?RjkyZ3k1aUpVODRiWkE3TCt6dnhIRTF5Uy9yVjJEdS9XaTdVSDZnTnFvenJO?=
 =?utf-8?B?RUQ1Rjg5V1BtOHMyZ2gxUVZQV2FuQnN6OUtkMThNNHdYQ0s5TytIaUdVTHRz?=
 =?utf-8?B?eUttL0tYeXdwbnYzbWVlUldGZDRERWJSSHA3OHRSeUNoZCtPanA3cmNyd1o0?=
 =?utf-8?B?dXFhd1BaK1R3dy9WZW53YWFKT1p3cHBBQ2lCRDgwTEtNTU1mbFZrcEhIdnZS?=
 =?utf-8?B?QlBPVThsdmhya0hZOHpoSWI0bXpHZXdNVXBoSG5MSWNydDk3OHZXVTBvbTNO?=
 =?utf-8?B?S0xTVHpiMXczVVZhMkRNdnc4Q0tJWWJsWUltbHRPaWo0cUpVbllrTHNCNThJ?=
 =?utf-8?B?blMzQ2dWQnIreWVtWHNOcnhrNk9mbUQ3YkVLSHd5TmI1MlN0U1NFQWZ5Zys3?=
 =?utf-8?B?eUFYd2tVWVlkTjd6aEd2VktISDJnUXJhcU51WGJJZWQrbDBjYVRIZEZoUjdj?=
 =?utf-8?B?MXFnOUMrNEdRUjVsVUw0dDh1cHBFT1lEdlgycmlQSk4wb2hnRDBmQXozL05x?=
 =?utf-8?B?RTlLZE5GbjZCYmJtYkNEbGVhVUIxYTArRURIVU1iMDBrOG00d0xhL3hyNmxY?=
 =?utf-8?B?K2x1VnNWWHdNMkJPYWZNN3BucmF2SjZUcERxaU9RV2FqaDFIWFFoaUFmTmpm?=
 =?utf-8?B?TmhobHpFMmFmYTZ1UkNUVVJaWXlLeXNVWmVsTStYMjNwSm1CclJzVjRwakdj?=
 =?utf-8?B?Q3ZhWURoK3RwQUpvc0xWUHJQbUYyUlFRcWlTOHR3L2tsZVNIaEZGOFgrczd4?=
 =?utf-8?B?SElUeEVXWm1Da2s3OXA5R1pvbmtEc3QrMHlTWmRDNVFwU3NuN3pjeVNwTUh6?=
 =?utf-8?B?d0RZL3AvYWs1Ui9Vemw4SktpNEZrWFdTYjI1Q3ZJWk9HS2dWd2FnSmJLWWtG?=
 =?utf-8?B?KzFzLzBZM0dMamZDcmc3SFF5a2loYWpJVUVOZmZEbHFSbjV5akVzWVlQTWhm?=
 =?utf-8?B?RnpWQmdDYTI0eXdMZW5lRHJSZEZDL1lHNU92RytVUlBxdTFvc3lxeE5nWHNm?=
 =?utf-8?B?Y2ljZzVsWGFJQ3dVUTlrWWM3eWU4eDRWckRIVVRjbkZKKzNxOUxWdllObnJj?=
 =?utf-8?B?dXdTZjR5ZTJzT09CMDFmb2U2RlhqRENSSlZZcWpRNE8yR1FMemEwcVQ1NWRD?=
 =?utf-8?B?NHJrVnJqbUFhUkl6VUE0aURCRlF6cVBtd0o4R3B6STJJbm9PcnVVY2FSUXYx?=
 =?utf-8?B?cG9EbWducUYwRTJOTVhiYXMxSEljVzBMQzJtaDkwNGpVUHZzWU4yVlc4ZTla?=
 =?utf-8?B?WmszWHRlWS9yRHNGWjR6aXhFaVRCWXJLVU1rMklDZlEwOTBEOWVjQmxlSU9v?=
 =?utf-8?B?L2lyOVBpTzZaZ0pxMG1YaG05SlRtUHNiS2YxRUdSS2V2ZDNWOEdOdmd5Z295?=
 =?utf-8?B?N1dsTzl1NDYraFNXMk0rZ1hISnl6YzZodlpoa0MyZFozRDloVUovRmlhWFFX?=
 =?utf-8?B?TGNBVmFURXQ5S2h5SlNhWDBZbE5VbC8yM3RUNFRTeVhhZzgxd3pwQUs1M1ho?=
 =?utf-8?B?L2FKTGhrenIvanhBMmZqNmVWemRGdWdOMHFld1NNc2FBYXZ1T3k4QVpKRXcz?=
 =?utf-8?B?QkdRNEl1TEx1aEIvTTBPMHdSZUFicTh6QklsR3E4eFl6RjduODY2OHF0clVQ?=
 =?utf-8?B?VnIyQm9jT21oNWtOOEJOK1F1aVR1SmpmYnFpRTlvMllyeENFQ245eEd5bXRJ?=
 =?utf-8?B?SUpneXpjYVdhYm85ak00NTcxUEYvaStyOWdlMFJpOUQvZWgvUk5pZjlQUFpI?=
 =?utf-8?B?ZU9RSFI0ZFJwQ2ozcFlrY0xQK3FISGwzWVRzRHVYMmdIeGF4L25tekw1QU9n?=
 =?utf-8?B?aTBsNXFENFQ0R25jTTc2TExlVjdiOEZBaWhnTU4rMkRXaHhsUVA4SENsdWRj?=
 =?utf-8?B?SGZZN2VHbE9ERGZxdmgrQ0J2OURtcXpSeFFXN1dzbWdwdDQ4Tm9SaDVzYUFp?=
 =?utf-8?Q?rlvMe92Jkg9Soc1yQ1zCBnKho+Nktq4T?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(8096899003); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkxRaUg5RFRFUXVjbDViZnd2YTJKUGdIOG9Nakk0RUhwS056eXFtOUE2dXB0?=
 =?utf-8?B?NGRxZm1UUVVQeGlyb1RLM1hMY2pjZnNTanRlOTBHcTNyVEhDeEJnZC9qUFdh?=
 =?utf-8?B?Y0VJTlJnSWJqQUYwM09WWTJDMVBQR1FPRS9FM1JSZk9EbHNYUk1HU2tmRWtU?=
 =?utf-8?B?VTdTRVl0U2Mzcm42L1M0Z1AxY0pqOXovVGJ4b0NyeW9pY01SaGhCQTFmYUJi?=
 =?utf-8?B?cEZLYjBjOUZYaENuY3NvMisrcjZUVm9qNnRpNzRDS0lZYTZzdFA4bmdHa203?=
 =?utf-8?B?VEtnRC9WbG80cm1CSkVuclJVYmd0QjR5T25zcTc5bjhwWWNSOXlTd3FESzV6?=
 =?utf-8?B?TjlZU2xRcGFNMDFsRnNNTjI4NzVuUks4NzlWLzJLTFFvUnJGSElBZ2pPZ2Fu?=
 =?utf-8?B?bXJiS09RZUNLeWFDRVJJQkROenlSS2o1NXNjUW9sSko1ZElIdXpTTjloVGdh?=
 =?utf-8?B?WFNjOG0xemJyMU9EQlpPb2xnbFNQeGd6NVR4M0ZTc2hYeTJYR0VDOUVhMnRR?=
 =?utf-8?B?VEpnVGJ0TGpkdGpqSWlSTzRGMTA0aUlQc1JLd1NXK2VBRDNQWE1qaEhqTFhl?=
 =?utf-8?B?ZlNyazFnS2c4cld3ME9wRWh2WjM3T2luQ01TTWx2M3hWQ2xiNWxnMTJPTlht?=
 =?utf-8?B?TE1iZWFsYUtPNjNNNlRzT0R4VThkS1dkZGEvL3ltOVNjbE9jRkRZeWVoYWk1?=
 =?utf-8?B?bVoyNDMrT2dVaU1vU3Z6aHVIOTVzc1ZPMFJMR25GUU94RWdTa051dytsZGdy?=
 =?utf-8?B?azV0aERVbkFFM0pvUE5UcmtKMGNLeEZtSDRYUjZSYUFoV3k0RVR2SFZZenN6?=
 =?utf-8?B?TWZObHJGQXRIN3Z0c2dyVElhTUcxOXJsZXFXTXJaZUlHem9qTW9pL1RINWVm?=
 =?utf-8?B?NEJ2UGsyekZlNzhLN1JxM3BodnNpd3hscDNmU1p4UnFMMjI1TjBNeG9YbElI?=
 =?utf-8?B?RERlVTI2cXBtZFhaRjZFN2VTT29ZNE1vSFNRdDd4U2VLTUs5ZFE5S2ZBTmpP?=
 =?utf-8?B?Wk1kTDZQaVpZYkM0cE5BN3B0YmhSSCtOUzV5bjRHR2hwaTRHOHp3ZGh0UlB1?=
 =?utf-8?B?SFdYdUJGS1ZESTdaQllGZVREUHpiUVNuRldIS1hBeGRySDRuL2RUUk1KYUkr?=
 =?utf-8?B?RnkxVjc2Wkd3Ty83R3NEenVVdkJGUUQwdDZ5UzdOeU9RNWtUUTJaaW9ReHRO?=
 =?utf-8?B?dW9kYURBOFpySnk1RzRkbVU0eXFBallKM1Z5VmhKSnE4U1pZSDc3TGdXbzdh?=
 =?utf-8?B?d1BlWXBXVTJZc0ZPejRRU3pxNlNvTzQvSXZ6YWlrcUEzM2dJRWNRWkxxbCtE?=
 =?utf-8?B?VW1hUk5PWnRUR0dxcUJzV1RzclZxV1BlbWJhYnYrVGFja2NhS21PdFp4anND?=
 =?utf-8?B?M1htbWxxVWcrWVNGWnlTbFU3R3RVWlEvYmViNnlPUml2bGRjb1VKbk5YTnl0?=
 =?utf-8?B?dHpJYk1mZnZybEYyQkV0a3duQUYraFFsSkdKWFoxTUFBblJndWU1VGFEMGRv?=
 =?utf-8?B?QyszWnNYcG5nd2EzV05hTnRJc2VNY0FMS3JVTVpEait3dEZBOFI0cit2Mlp6?=
 =?utf-8?B?NG5EdUY0UmlpMlV1ZGZrcWQ0eWoxTm0rMWZRd3FxbFN6cmNHUWtJeGxIc2hT?=
 =?utf-8?B?TXpJekhYelp6Tjc4eUo2eXVEWlVXNU43RXpSZFZFSjA5VFV2aGNJeHRKV2Vo?=
 =?utf-8?B?Qi9zRHFUZ0t2WTVvREF4VmxCK1RvYVc0VUhCMTNoYjFEajVVTXB0ZGNiVVhF?=
 =?utf-8?B?VHNKWVduME0zTTE1cldEN0dxeGxVQk9Ya293cGVjeXUrbWM4ZXdDaHF0cFd2?=
 =?utf-8?B?VjhCaFdQQ2F5TG9OS2xlSU9nQW00Uml0eVRBNi9DZ1J2bXdBNUErbnhnd3BX?=
 =?utf-8?B?TmwxVVovRzhBRjVha1JYRzk2MXpNZGZaNHgvNHd5bFl6RTltbFE4WmJySDlH?=
 =?utf-8?B?Vkh2SHVtb2VoamZZa2FaTVRSSnJkZDdnNWNDUnE2OW1BMExkbGNTSzBsMWU1?=
 =?utf-8?B?Wk1McjlvcmJUamJSVjVkb2ZPSVRKQ1ZnKzRwS0lEclpmS2VtWHRRQzhJUkxa?=
 =?utf-8?B?UzFUcDVNQklTbzhxdEhjQTBaeEpDbmk1YkhiUWlqcXNDQkc3b3djZjU3MGZV?=
 =?utf-8?Q?sGy92FPgE1URKeWWGJpasVJqb?=
Content-Type: multipart/alternative;
 boundary="_000_BN9PR11MB54826A76B128ABB160AB18B2EBA02BN9PR11MB5482namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374a51b7-21ef-4d3b-72df-08dd6dda3231
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 09:23:26.8459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFoA+Y+2uGDvHjynv56ig6NstPU+HUTNYnDddzaS+dcLs+Dacal2X5VzQN/phyRCMqVx/Ct07EOP7qvNlw3pHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
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

--_000_BN9PR11MB54826A76B128ABB160AB18B2EBA02BN9PR11MB5482namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMy8yOC8yMDI1IDA5OjE5LCBKYW4gU29rb2xvd3NraSB3cm90ZToNCg0KVGVzdHMgd2FpdC13
cml0ZXNpcC1ub2RlYnVnIGFuZCBicmVha3BvaW50LXdyaXRlc2lwLW5vZGVidWcNCg0Kd2VyZSBm
b3VuZCB0byBiZSBpbmNvbXBhdGlibGUgd2l0aCBTUi1JT1YgZnVuY3Rpb25hbGl0eSwgYW5kDQoN
CnNob3VsZCBvbmx5IGJlIGF2YWlsYWJsZSB0byBydW4gaWYgb24gUEYuDQoNCg0KDQpEaXNhYmxl
IHRoZXNlIHRlc3RzIGlmIHJhbiBvbiBWRi4NCg0KDQoNClNpZ25lZC1vZmYtYnk6IEphbiBTb2tv
bG93c2tpIDxqYW4uc29rb2xvd3NraUBpbnRlbC5jb20+PG1haWx0bzpqYW4uc29rb2xvd3NraUBp
bnRlbC5jb20+DQoNCkNjOiBLYXRhcnp5bmEgUGllY2llbHNrYSA8a2F0YXJ6eW5hLnBpZWNpZWxz
a2FAaW50ZWwuY29tPjxtYWlsdG86a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tPg0KDQpD
YzogTHVrYXN6IExhZ3VuYSA8bHVrYXN6LmxhZ3VuYUBpbnRlbC5jb20+PG1haWx0bzpsdWthc3ou
bGFndW5hQGludGVsLmNvbT4NCg0KQ2M6IENocmlzdG9waCBNYW5zemV3c2tpIDxjaHJpc3RvcGgu
bWFuc3pld3NraUBpbnRlbC5jb20+PG1haWx0bzpjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5j
b20+DQoNCi0tLQ0KDQogdGVzdHMvaW50ZWwveGVfZXhlY19zaXBfZXVkZWJ1Zy5jIHwgMiArKw0K
DQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KDQoNCg0KZGlmZiAtLWdpdCBhL3Rl
c3RzL2ludGVsL3hlX2V4ZWNfc2lwX2V1ZGVidWcuYyBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc2lw
X2V1ZGVidWcuYw0KDQppbmRleCBjMzE3MTEyYjQuLjI2YjNmOTE3NiAxMDA2NDQNCg0KLS0tIGEv
dGVzdHMvaW50ZWwveGVfZXhlY19zaXBfZXVkZWJ1Zy5jDQoNCisrKyBiL3Rlc3RzL2ludGVsL3hl
X2V4ZWNfc2lwX2V1ZGVidWcuYw0KDQpAQCAtMjIsNiArMjIsNyBAQA0KDQogI2luY2x1ZGUgInhl
L3hlX2V1ZGVidWcuaCINCg0KICNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KDQogI2luY2x1ZGUg
InhlL3hlX3F1ZXJ5LmgiDQoNCisjaW5jbHVkZSAibGliL2lndF9zcmlvdl9kZXZpY2UuaCINCg0K
DQoNCiAjZGVmaW5lIFdJRFRIIDY0DQoNCiAjZGVmaW5lIEhFSUdIVCA2NA0KDQpAQCAtMzE2LDYg
KzMxNyw3IEBAIGlndF9tYWluDQoNCiAgICAgICAgIGlndF9maXh0dXJlIHsNCg0KICAgICAgICAg
ICAgICAgICB3YXNfZW5hYmxlZCA9IHhlX2V1ZGVidWdfZW5hYmxlKGZkLCBmYWxzZSk7DQoNCiAg
ICAgICAgICAgICAgICAgaWd0X3JlcXVpcmUoIXhlX2V1ZGVidWdfZGVidWdnZXJfYXZhaWxhYmxl
KGZkKSk7DQoNCisgICAgICAgICAgICAgICAgaWd0X3NraXBfb24oaW50ZWxfaXNfdmZfZGV2aWNl
KGZkKSk7DQoNClNob3VsZG4ndCBldWRlYnVnIHRvZ2dsZSBiZSB1bmF2YWlsYWJsZSBmb3IgVkZz
PyBJZiB5ZXMgdGhlbiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBza2lwIGlmIGl0J3Mg
bm90IHByZXNlbnQuDQotDQpMdWthc3oNCg0KDQoNCg0KDQogICAgICAgICB9DQoNCg0KDQogICAg
ICAgICB0ZXN0X3JlbmRlcl9hbmRfY29tcHV0ZSgid2FpdC13cml0ZXNpcC1ub2RlYnVnIiwgZmQs
IGVjaSkNCg==

--_000_BN9PR11MB54826A76B128ABB160AB18B2EBA02BN9PR11MB5482namp_
Content-Type: text/html; charset="utf-8"
Content-ID: <BB4C56D654E9AF439CD8313A4A72C7E6@intel.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkFwdG9zO30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q29u
c29sYXM7DQoJcGFub3NlLTE6MiAxMSA2IDkgMiAyIDQgMyAyIDQ7fQ0KLyogU3R5bGUgRGVmaW5p
dGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFy
Z2luOjBpbjsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJBcHRvcyIsc2Fucy1z
ZXJpZjt9DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5
OTsNCgljb2xvcjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcHJlDQoJe21z
by1zdHlsZS1wcmlvcml0eTo5OTsNCgltc28tc3R5bGUtbGluazoiSFRNTCBQcmVmb3JtYXR0ZWQg
Q2hhciI7DQoJbWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXpl
OjEwLjBwdDsNCglmb250LWZhbWlseToiQ291cmllciBOZXciO30NCnNwYW4uSFRNTFByZWZvcm1h
dHRlZENoYXINCgl7bXNvLXN0eWxlLW5hbWU6IkhUTUwgUHJlZm9ybWF0dGVkIENoYXIiOw0KCW1z
by1zdHlsZS1wcmlvcml0eTo5OTsNCgltc28tc3R5bGUtbGluazoiSFRNTCBQcmVmb3JtYXR0ZWQi
Ow0KCWZvbnQtZmFtaWx5OkNvbnNvbGFzO30NCnNwYW4uRW1haWxTdHlsZTIwDQoJe21zby1zdHls
ZS10eXBlOnBlcnNvbmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IlRpbWVzIE5ldyBSb21hbiIs
c2VyaWY7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJ
Zm9udC1zaXplOjEwLjBwdDsNCgltc28tbGlnYXR1cmVzOm5vbmU7fQ0KQHBhZ2UgV29yZFNlY3Rp
b24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBp
bjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+
PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0IiBz
cGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4
bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRpdCIg
ZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVhZD4N
Cjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIiBzdHlsZT0id29y
ZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxkaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj5PbiAzLzI4LzIwMjUgMDk6MTksIEphbiBTb2tvbG93c2tpIHdy
b3RlOjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8YmxvY2txdW90ZSBzdHlsZT0ibWFyZ2luLXRv
cDo1LjBwdDttYXJnaW4tYm90dG9tOjUuMHB0Ij4NCjxwcmU+VGVzdHMgd2FpdC13cml0ZXNpcC1u
b2RlYnVnIGFuZCBicmVha3BvaW50LXdyaXRlc2lwLW5vZGVidWc8bzpwPjwvbzpwPjwvcHJlPg0K
PHByZT53ZXJlIGZvdW5kIHRvIGJlIGluY29tcGF0aWJsZSB3aXRoIFNSLUlPViBmdW5jdGlvbmFs
aXR5LCBhbmQ8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT5zaG91bGQgb25seSBiZSBhdmFpbGFibGUg
dG8gcnVuIGlmIG9uIFBGLjxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wcmU+DQo8cHJlPkRpc2FibGUgdGhlc2UgdGVzdHMgaWYgcmFuIG9uIFZGLjxvOnA+PC9vOnA+
PC9wcmU+DQo8cHJlPjxvOnA+Jm5ic3A7PC9vOnA+PC9wcmU+DQo8cHJlPlNpZ25lZC1vZmYtYnk6
IEphbiBTb2tvbG93c2tpIDxhIGhyZWY9Im1haWx0bzpqYW4uc29rb2xvd3NraUBpbnRlbC5jb20i
PiZsdDtqYW4uc29rb2xvd3NraUBpbnRlbC5jb20mZ3Q7PC9hPjxvOnA+PC9vOnA+PC9wcmU+DQo8
cHJlPkNjOiBLYXRhcnp5bmEgUGllY2llbHNrYSA8YSBocmVmPSJtYWlsdG86a2F0YXJ6eW5hLnBp
ZWNpZWxza2FAaW50ZWwuY29tIj4mbHQ7a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tJmd0
OzwvYT48bzpwPjwvbzpwPjwvcHJlPg0KPHByZT5DYzogTHVrYXN6IExhZ3VuYSA8YSBocmVmPSJt
YWlsdG86bHVrYXN6LmxhZ3VuYUBpbnRlbC5jb20iPiZsdDtsdWthc3oubGFndW5hQGludGVsLmNv
bSZndDs8L2E+PG86cD48L286cD48L3ByZT4NCjxwcmU+Q2M6IENocmlzdG9waCBNYW5zemV3c2tp
IDxhIGhyZWY9Im1haWx0bzpjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20iPiZsdDtjaHJp
c3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20mZ3Q7PC9hPjxvOnA+PC9vOnA+PC9wcmU+DQo8cHJl
Pi0tLTxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiB0ZXN0cy9pbnRlbC94ZV9leGVjX3NpcF9ldWRl
YnVnLmMgfCAyICsrPG86cD48L286cD48L3ByZT4NCjxwcmU+IDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyk8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT48bzpwPiZuYnNwOzwvbzpwPjwvcHJl
Pg0KPHByZT5kaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19zaXBfZXVkZWJ1Zy5jIGIv
dGVzdHMvaW50ZWwveGVfZXhlY19zaXBfZXVkZWJ1Zy5jPG86cD48L286cD48L3ByZT4NCjxwcmU+
aW5kZXggYzMxNzExMmI0Li4yNmIzZjkxNzYgMTAwNjQ0PG86cD48L286cD48L3ByZT4NCjxwcmU+
LS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY19zaXBfZXVkZWJ1Zy5jPG86cD48L286cD48L3ByZT4N
CjxwcmU+KysrIGIvdGVzdHMvaW50ZWwveGVfZXhlY19zaXBfZXVkZWJ1Zy5jPG86cD48L286cD48
L3ByZT4NCjxwcmU+QEAgLTIyLDYgKzIyLDcgQEA8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4gI2lu
Y2x1ZGUgJnF1b3Q7eGUveGVfZXVkZWJ1Zy5oJnF1b3Q7PG86cD48L286cD48L3ByZT4NCjxwcmU+
ICNpbmNsdWRlICZxdW90O3hlL3hlX2lvY3RsLmgmcXVvdDs8bzpwPjwvbzpwPjwvcHJlPg0KPHBy
ZT4gI2luY2x1ZGUgJnF1b3Q7eGUveGVfcXVlcnkuaCZxdW90OzxvOnA+PC9vOnA+PC9wcmU+DQo8
cHJlPisjaW5jbHVkZSAmcXVvdDtsaWIvaWd0X3NyaW92X2RldmljZS5oJnF1b3Q7PG86cD48L286
cD48L3ByZT4NCjxwcmU+IDxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZuYnNwOyNkZWZpbmUgV0lE
VEggNjQ8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4gI2RlZmluZSBIRUlHSFQgNjQ8bzpwPjwvbzpw
PjwvcHJlPg0KPHByZT5AQCAtMzE2LDYgKzMxNyw3IEBAIGlndF9tYWluPG86cD48L286cD48L3By
ZT4NCjxwcmU+ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBpZ3Rf
Zml4dHVyZSB7PG86cD48L286cD48L3ByZT4NCjxwcmU+ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyB3YXNfZW5hYmxlZCA9IHhlX2V1ZGVidWdfZW5hYmxlKGZkLCBmYWxzZSk7PG86
cD48L286cD48L3ByZT4NCjxwcmU+ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBp
Z3RfcmVxdWlyZSgheGVfZXVkZWJ1Z19kZWJ1Z2dlcl9hdmFpbGFibGUoZmQpKTs8bzpwPjwvbzpw
PjwvcHJlPg0KPHByZT4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlndF9za2lw
X29uKGludGVsX2lzX3ZmX2RldmljZShmZCkpOzxvOnA+PC9vOnA+PC9wcmU+DQo8L2Jsb2NrcXVv
dGU+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48YnI+DQpTaG91bGRuJ3QgZXVkZWJ1ZyB0b2dnbGUg
YmUgdW5hdmFpbGFibGUgZm9yIFZGcz8gSWYgeWVzIHRoZW4gSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8gc2tpcCBpZiBpdCdzIG5vdCBwcmVzZW50Ljxicj4NCi08YnI+DQpMdWthc3o8YnI+
DQo8YnI+DQo8YnI+DQo8bzpwPjwvbzpwPjwvcD4NCjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW4t
dG9wOjUuMHB0O21hcmdpbi1ib3R0b206NS4wcHQiPg0KPHByZT48bzpwPiZuYnNwOzwvbzpwPjwv
cHJlPg0KPHByZT4gJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08
bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4gPG86cD48L286cD48L3ByZT4NCjxwcmU+Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHRlc3RfcmVuZGVyX2FuZF9j
b21wdXRlKCZxdW90O3dhaXQtd3JpdGVzaXAtbm9kZWJ1ZyZxdW90OywgZmQsIGVjaSk8bzpwPjwv
bzpwPjwvcHJlPg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_BN9PR11MB54826A76B128ABB160AB18B2EBA02BN9PR11MB5482namp_--
