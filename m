Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2371CCA470
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 03:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A5610E8F8;
	Thu,  9 Oct 2025 03:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWM5KJw3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE51A10E8F8
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 03:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759979858; x=1791515858;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RZnXAm5NJZjycH2tt2k0lM17sDl90aYNROllcSgT/8Q=;
 b=UWM5KJw3g/H2keqDkXSjSKLZ93X0TjMfIBS+k6+PukJXPcu8mIswXkT0
 GQXqH6THxjDlbXcA+FXleMrXKSW+Iets5B6yk4OD0dWPP7ljFg6rAQil6
 eHwiXVHgb1DNIRGPtphd3/Af1kBvnGzYn/DkEaU4WCkOzppqvTgeZdrUS
 17ufhL7enBz+m9a7gDpFjv7I72iJ7uSdegsQ3blqfXXZnXgAY4174xb18
 1ecMaGNtTIbJwiEErBMc18gvW5DA52IzlspXgAM8rA8nWsDJ2SJ5E/vOw
 KD93drXOfI1YVCJQ5zn6zf2IhZNk+UndI4+0PmniEBnwEytcq6dpeRO2q Q==;
X-CSE-ConnectionGUID: f9qdmPQ4RPWF0mNikuCpxQ==
X-CSE-MsgGUID: JBmaw+mKRwKkPHOJ4YXMBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61887803"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="61887803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 20:17:38 -0700
X-CSE-ConnectionGUID: ZtdFCIqhQ6SVEdXViqQMGg==
X-CSE-MsgGUID: ZYsF/Wh4Rc676p04TeJ8ow==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 20:17:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 20:17:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 20:17:36 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 20:17:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/+xK4Kqq1zyYcTwmxCwRoEy1tl+lNck5nfmg63ujyCs59lx2H9uW4TG3/G4qR4YYTulKmkYiWEFt2uBPoLQgvDOG2ooEmTsafgg/809gf9WMrJ2uV2DKX3elwql0B64GQ/6v1OUuHOUqbONFT88uKqeoGVrNs86no7P/KfXLenlM0EJ/Dpm6Yx2ukVPV+5n+CUw27KLJzFtuzCbWh1F3qnevHYs12phmnBD9fv3CuxtUpncueJcyIwaIyjIxFT4oe7P3FDNX1S4usrNoFH95HT1fGqtWTlPWCjUIFL8Fj+GgnLF6neULnqjlKQf4fvYIm8IIGM/V2YxuKK9+8nSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwfdlfkLZhy2gwBDI0CmRIjphMgt4y6iVhg1aYFy4vQ=;
 b=P3V3+15mBNEnDbkxNDM6Om2PNLLysNW0j+Z0s9teDLrcXh/CSmrUrlI8PHuhwRPhfSBf1KmPhAi2bRNop6e8D6e/wW0W3BXz/glmcWpVir7A/aes75xgYA137GspVL9s+Yh5GDl4XxQ6LcIXkoxM5946dO0tt/HmgS/yz58KDAIhiGcWcgCHZfSzlWGQWcww9NoL42scgzt6vaSFmORN1+mj+sve4jZR02iJ5eM2D5zp1w8nutZN0uicaf4ZIN61vZxYhPc+UI66CdNm3OBqrrlOzSzGzRNOqe0ygTJpOuaYjeTJOHq87b+Ls7vbX5JiIXtOURh8t5GyjQqhwgT+/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CY5PR11MB6116.namprd11.prod.outlook.com (2603:10b6:930:2b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Thu, 9 Oct 2025 03:17:29 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 03:17:29 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>, "Samala,
 Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] kms_flip_tiling: reduce exec time for sim env
Thread-Topic: [PATCH i-g-t] kms_flip_tiling: reduce exec time for sim env
Thread-Index: AQHcOGfdjnu/4lLjNUy+++But0auXbS4qrSAgAB5znA=
Date: Thu, 9 Oct 2025 03:17:29 +0000
Message-ID: <DM4PR11MB63123706B0520AC64636185F90EEA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251008152540.1556189-1-jeevan.b@intel.com>
 <aObCIXt0HPVWwl3n@intel.com>
In-Reply-To: <aObCIXt0HPVWwl3n@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CY5PR11MB6116:EE_
x-ms-office365-filtering-correlation-id: b8f29947-79e0-4a2d-a1c3-08de06e2614f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Ggj+GeHyToeW/sOEDESecEbtkK3zcnBapIYKlc0rr4YmipvQIhq+S7MW36?=
 =?iso-8859-1?Q?KxOcym0qEL2gZcFb3YVHybqUU8QsVgDHpNvtyTrO/b8SFAbWdRlsnhGo2j?=
 =?iso-8859-1?Q?O0XibCGmGzC1cWlS/P6SVZmNm1jqEnuN2W9qkwM420A8MGx+FKXRAI+mh6?=
 =?iso-8859-1?Q?KZhRw4YjqhU6jCttdLtFTwIR/S9zdWQ71eYNfI8LCIiqc9WpzCRR4SK7Hm?=
 =?iso-8859-1?Q?Rvpw27WuFwnlHxbdITWSWqpqcJHCNgbMRrcxlFAM9GqH/9BQElQbCWFOlq?=
 =?iso-8859-1?Q?UkMw10/ujVSP9ZKcD/2vHWaBr0kG67oPbnuBUHTHmUQI0NPH8SspUUpQnS?=
 =?iso-8859-1?Q?gA1ghO1JJ7ujFSqd61yIwJLKshVcDHXqn/UOF2HqU0sJh3gkUfdMjp5k+W?=
 =?iso-8859-1?Q?oPeXmyfLrQrpgeI9Hc7fB+o0rnbwhHLB3I2qCmpeVituTMQtMAsG0k+hbo?=
 =?iso-8859-1?Q?Ato/swbzGk8O/s+ZhcPSS2aSCAchxV2FKBj9JIHXi0eAPSA1BN9WLx/dhu?=
 =?iso-8859-1?Q?rvcMdnSV/dlSPVvbUwqAnlAf66Rhydz4vsmTDDBBUErcVX90Ey+0J/H2mW?=
 =?iso-8859-1?Q?P58hPhz79M/aujm0xA936hIR1J/Z5up1AnJM1Z6nVKPJbGh8yp8aVz/Bcv?=
 =?iso-8859-1?Q?IfBiEhZqcockNklnaZTVSKu/eA//qKfcmdsjTzh7K9yUgp/F9Lh25ysSaT?=
 =?iso-8859-1?Q?zFFR27BmMQC7L1UHeo6OAPLFxHmMBYkjM/g/ugHRKTGrcgwsCxE9vsPds1?=
 =?iso-8859-1?Q?n2HVi6OIY2OiyzmFDHJWvWUgvvxklLhNNANeQQX+rYHCkxurrEydqePyii?=
 =?iso-8859-1?Q?QTJVRnqVdhoh054/cbDsN9JXf7RZB9Qm+nCaFPzLDiRccuXt8+peNnGpwn?=
 =?iso-8859-1?Q?gVcqs+QZzv0xwMRyHbcNHoK+A65bOBSMhgX7faSxn2zhw5+fQkCPxB9N/+?=
 =?iso-8859-1?Q?4if/ejS1//ZojwviZcBpl8HD3/PuimkaKa/RbJfFp617QZW7fDASOJb1DU?=
 =?iso-8859-1?Q?HftZdeSiu7RNXZ7RR9E4vPT5NXAp1Px3TvzDOy3uhvjNseMS0vb6oTRGsk?=
 =?iso-8859-1?Q?bW4dV45cX71dosIT8TTmP04LDzgMyT3Q8WH/FBDRx5EXZu06w7BZq39Po8?=
 =?iso-8859-1?Q?lg5jsAfGFOW7R5vYkciZiv9EcdthP2S6H/tBM8J9J/gs9MiD7GpAUC1jfI?=
 =?iso-8859-1?Q?cQ9htH8LZC6TVwz0Ki6osVZK8RiMS5Gy9ybfliixwWdlXDopEEEbtPwBsz?=
 =?iso-8859-1?Q?aoKsznH1NShhSP/O3wPUzj5w5+YByImyABQ3ef8NlrGqhjVmNTcHyDmdK1?=
 =?iso-8859-1?Q?GNswcsZFRTrNTlR7dLV/8YODcYsAmvakaRsu0eUm5XoH4f26UQkDLJhE1w?=
 =?iso-8859-1?Q?DUuSMpXJQbEGETugIZOLKNtPSsuSu5/MBK71LD/7fHQNFpvPcfehLyd7mY?=
 =?iso-8859-1?Q?pJroBCKRi9ZhDYckuESpmZXDHQqhkuGt8/QXWDZRY3GPRuyN6w9Nhtxt7a?=
 =?iso-8859-1?Q?Z8pPu2Xqkcbmr5HiA5OtxVEXNmMMMwMUbmXxlkkUUAhQlqnRiZxdz9yB4E?=
 =?iso-8859-1?Q?hy1n7hKC9Ts5Wj1NTh7Z/9B3PMbB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?g41jRfKyW6A2f2WQncwK0KeP/JQSfzvwIc57vkbATk/t3OqpuhoN6zS/Bd?=
 =?iso-8859-1?Q?SVzfeEdPPvnhhFC+zPiA0QvW/k9fiMjLdqXLPxN2RSx0u/dvsI9M3MTn8s?=
 =?iso-8859-1?Q?/TeC/LxqqDNF4k/2jA6UXe5/Gfl5VvTVF8LrF5+dkw0wxRbPjHTimiwsEe?=
 =?iso-8859-1?Q?5EY30chjkpRQh96/MV/CJETUrXh0Mi/pwluY+fiXPnDI76s8na7Nt1+yz3?=
 =?iso-8859-1?Q?z6nt0AuVE9qZu/pvRmlJKrbV4HgGb4JnHHEJFFHmlxoKN9Wz4W5PWo+Ol8?=
 =?iso-8859-1?Q?Hl9MKjeoccJKsnrev7VRCys76BTiWs+Es9jcWD4QFOcUuHysvURLb/wjBH?=
 =?iso-8859-1?Q?IRH+DziK8V/shH3TYu0QPT7uAVusDUNNv5GLIiQWl5UoQPmyz4+sKJHpkQ?=
 =?iso-8859-1?Q?k2JIS6Y63vo/nENxJBEjwEloaoKwBk3YRv3dXx5PTLwIUWSk8ETZz+IhjX?=
 =?iso-8859-1?Q?YdJ4lNdSncN189ajyzuUf7bJUtA+MjRAihMc7StRdibkqqsNJo6SH/usjI?=
 =?iso-8859-1?Q?3T71WueLH2OajcrUotmvQWCNfJPHgplRLbEoDNlcwWJT71XCok3QCdK20V?=
 =?iso-8859-1?Q?9a6min5JOAWeKSZ4U5VohfACcdbDvVOahZ+7h8gFvJIeuLOZkbnwO6NTS3?=
 =?iso-8859-1?Q?gdSs9gpjr1GIvQm+UwLPBWZvqW/23cFcuiUVrCyi5UdkUCilmAHQitE5DJ?=
 =?iso-8859-1?Q?Cq/mq2afVxJ4DLUC5x3vTQ9Am4e0upMwSi8Yg3rc+XT+DxKJcCUMxjuJIT?=
 =?iso-8859-1?Q?VsaycpNkdzB55IN1Vt2ZNl9Ngqqxp4pCzIIZLZ2ChgvJCYwA6Ik2KBDxOc?=
 =?iso-8859-1?Q?Ej1fbRp5Z6jy41OBtmW1MQoO92o4vciwW/svtCyrvr0P5CmFAy8mSwaNZ0?=
 =?iso-8859-1?Q?KqO56atKOWpmB4xXZFxfYHq/MGIes2i/jXU0wRm1WtXH4lp0TupKrv23zM?=
 =?iso-8859-1?Q?ErljKFI0IDQA49m9R69MHGhM2sukLkqoSgymaPAn9NTc9tbYskplE0doHP?=
 =?iso-8859-1?Q?aEW6Pfer7QWo08nvZ3LWlhES9Xj4Z57YjwVob99TSAnQCZmB0T78SS/euc?=
 =?iso-8859-1?Q?28wCReUAVVKPPoJFUDJz+9OdoPFCX/OBUHoQM1ULgY9A2TEwk7eXFPaD1o?=
 =?iso-8859-1?Q?KcXXLcWoon+5nUhGIUKr3Mg/iioaIQ4ojXgba5U/1HLLwXVXAlNMgMzQln?=
 =?iso-8859-1?Q?Oco1XwSs0ML/kpxAITr7du+N7YedzI/vdMAqLjKgUiEOryQdOlUq0epeqM?=
 =?iso-8859-1?Q?bPfdHHQsuN1M1KOR1eJcCtFP1nBO0/z4QJLV2VGyIUIfAShp4GVLNZgFcl?=
 =?iso-8859-1?Q?wlhqVS9+zBqai+rdszAeVhktAaHBCWVicvi+koo1YnJCrxJWC2Iw4mb3AK?=
 =?iso-8859-1?Q?+1+Jzj2iXPN4RB8NLz/jxDjdvw7ksuluATl9bT32y+WDp619J9FSxRrhYU?=
 =?iso-8859-1?Q?8vsn0pYEo/SDSTW/I1+WqIbi5KkGvwCveNsJU/2oE7NYb13HeY/ULl9GTV?=
 =?iso-8859-1?Q?lGZ4VmzhcdorlA0ElOs4KALdXEJoozRqojb2nu9iJdZpA6w506uZywXcwn?=
 =?iso-8859-1?Q?v6li0UpDbIIiLzvjGn7OXleV/Vsy96jtqVPqdatYOeBIPsh8RMJmOIFvL+?=
 =?iso-8859-1?Q?lxmOVCWHuXZYw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f29947-79e0-4a2d-a1c3-08de06e2614f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 03:17:29.7799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6G0y1FzrxTJ21e5aYVbpSu0RxefaCGSkXpSVKgisnjsomcN7pyRQx2oD788JQ0EBM2QcxsYo2h26lyfGxTdhGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6116
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
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Thursday, October 9, 2025 1:27 AM
> To: B, Jeevan <jeevan.b@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Sharma, Swati2
> <swati2.sharma@intel.com>; Samala, Pranay <pranay.samala@intel.com>
> Subject: Re: [PATCH i-g-t] kms_flip_tiling: reduce exec time for sim env
>=20
> On Wed, Oct 08, 2025 at 08:55:40PM +0530, Jeevan B wrote:
> > For simulation environment, we can reduce execution time by running
> > test only with basic tiling combinations.
> >
> > v2: Add helper to check basic tiling support.
> >
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  tests/intel/kms_flip_tiling.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/tests/intel/kms_flip_tiling.c
> > b/tests/intel/kms_flip_tiling.c index ff9ad1229..024421b58 100644
> > --- a/tests/intel/kms_flip_tiling.c
> > +++ b/tests/intel/kms_flip_tiling.c
> > @@ -84,6 +84,13 @@ static int try_commit(igt_display_t *display)
> >  				       COMMIT_ATOMIC : COMMIT_LEGACY);  }
> >
> > +static bool is_allowed_modifier(uint64_t mod)
>=20
> That function name and implementation is extremely confusing.
> Why are these allowed and nothing else? Nothing here tells me any of that=
.
I will add in comment line, On Simulation execution takes more time when we=
 are looping through all modifiers, so we only cover basic modifiers in sim=
ulation. =20

>=20
> > +{
> > +	return mod =3D=3D DRM_FORMAT_MOD_LINEAR ||
> > +	       mod =3D=3D I915_FORMAT_MOD_4_TILED ||
> > +	       mod =3D=3D I915_FORMAT_MOD_X_TILED; }
> > +
> >  static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)  {
> >  	uint64_t timeout_ns;
> > @@ -216,6 +223,7 @@ igt_main
> >  	igt_describe("Check pageflip between modifiers");
> >  	igt_subtest_with_dynamic("flip-change-tiling") {
> >  		enum pipe pipe;
> > +		bool run_in_simulation =3D igt_run_in_simulation();
> >
> >  		for_each_pipe_with_valid_output(&data.display, pipe,
> output) {
> >  			igt_plane_t *plane;
> > @@ -242,6 +250,11 @@ igt_main
> >  					if (plane->formats[j] !=3D
> data.testformat)
> >  						continue;
> >
> > +					if (run_in_simulation &&
> > +					    (!is_allowed_modifier(plane-
> >modifiers[i]) ||
> > +					     !is_allowed_modifier(plane-
> >modifiers[j])))
> > +						continue;
> > +
> >  					igt_dynamic_f("pipe-%s-%s-%s-to-
> %s",
> >  						      kmstest_pipe_name(pipe),
> >  						      igt_output_name(output),
> > --
> > 2.43.0
>=20
> --
> Ville Syrj=E4l=E4
> Intel
