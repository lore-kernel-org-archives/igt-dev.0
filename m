Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAA6CCA476
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 06:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E20710E117;
	Fri, 10 Oct 2025 06:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5lbFZxX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D03210E117
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 06:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760076029; x=1791612029;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SfiNy+ZLuxgsiE2ylfrmSzILAXI/zCdwZA3MedmRrRQ=;
 b=T5lbFZxXu1EV9mI64NcyrsbCp/B2eAt0LLQqRp0CwI75m5CGMvEWC74a
 Vc5oi7tMPajWwEdsumCUtDOUsynxCYBp2xvg+lElB3hFNm86i9tAGyrZ8
 0YeQlkGMHW5Ctsqt/xzMklEkvLYDOcuY5jEwVKcc5ZHq9VGQ46hN+2CAm
 h/6VPbEtWS3OunN0d3BcYYAnUkba/fIGZytcZ8tVU9+Woh2775VJWMpo4
 pSIngw4+fySC66//40b+P8GdykbLNt+e8SLO3ul3q9HmRRWQz0f1XP6sr
 S7DdJ8LijslLh7lKdd2ILWynZzcOBIEJBjI0p+vBTK+ptSkGNQlIUIZrS Q==;
X-CSE-ConnectionGUID: +x1Rl/KVSbeZ/IKgdXxApQ==
X-CSE-MsgGUID: bWKomJOCTwC8SQdsue8aPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62319103"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62319103"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 23:00:29 -0700
X-CSE-ConnectionGUID: QZuh+FqYRiO1z+lGBcyv1g==
X-CSE-MsgGUID: BWHBuvXETcqekUijWhji7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180146375"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 23:00:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 23:00:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 23:00:28 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 23:00:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS3erV1M/WjaMvb3uuZuJcacD52Mdx9QT1RxN8P045FYtQD3hEhNWd1xme4FyHfV6XeLCsd4F1XMQnYKsrfZTzAdz8Z3GLuwUZmNqFgY8QF1PDAz91YYysKJ4qWHvyZbDtMbYC3FHpJxYjFkl8zVzH0ypIttlb4vnxlnbvIKdSkoIaZh2KwZwq+Vbp3TLGLcvFcaFf5r7j3A8NAfOTBxddE2lhOsGcgeEDK+bF+dLoPD2dohEPCqNn82Zbie++IpFURnFdZyWm/FtP4YTg5s9JBJG1f8UfGXGK4WulPhQq2i9BPlkq3p93jmbi7UVEK1K4s16VFSI/SIVVlz67lsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gi9SJzP8yQYNUljyjUbXa+Ce+hlxKXqWLWpLq+1CG8=;
 b=E3OsxxTGAJZ6Q8fcSHlfm7DkR/A/UVxknNKGZxEEitw1CEFAkprUkBVKYVlRTED96B4hiEhgDFhAR+GQqcxhmiuOkd7sSyzcEWW7oVwvQdGRbMikbu++MekbiWYOKamTv+zCPstiwVzoCkdFeR0NbC2J72fIomD9ChAheOY9f7RVPHvvj+UbNOrsQ5uv3/188CmXQvOssHhAn5p2cdvqqFfuVGyPglHjfLOchcHxkd3lxKheh40dIYq5b5eKTfKOJ+O7YjywJ9GhAt4PnRksi3mao9S3pQWmkDV9HNwXITBt65A5HK0GRwGWGgT9uaKYEyu4qMdFs6gPIzidlV27Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 06:00:19 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 06:00:19 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_plane_multiple: Restrict pipe/output
 combos on 2x subtests for simulation
Thread-Topic: [PATCH i-g-t] tests/kms_plane_multiple: Restrict pipe/output
 combos on 2x subtests for simulation
Thread-Index: AQHcORhUBQ1sq4RPIUW1jRWhkahLNrS62aqA
Date: Fri, 10 Oct 2025 06:00:19 +0000
Message-ID: <PH7PR11MB60531F078666AAB6C5237104E7EFA@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251009122514.637703-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251009122514.637703-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH7PR11MB7595:EE_
x-ms-office365-filtering-correlation-id: 916d977c-09d6-49f4-7689-08de07c24ade
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?u1wfNwaxRDa/VZvNwttp7CKqlPumdAdeobwB7koQYbS7cOfN4zZBD36VlKVl?=
 =?us-ascii?Q?9nrap1H6M60GYYK9HRxKX/4Rq/9d7mxCLSmReC02WnE3GHxrciTvjFS3q/pC?=
 =?us-ascii?Q?ShbbKPiLrzHwwo35w95UMP5bcp+GF2BOp0T4cEuRPoihi6DJP6FFYcYhKwp+?=
 =?us-ascii?Q?M36hOLCNy96bYkmSUJnz26DbLfj2Eqwz8DsNj3vv7AGisbN5/gmbVb/yxwSB?=
 =?us-ascii?Q?v/zceSFmiS2H343+0YaiVXrQ3ezchTDAEgxB/RicYkZ98bZYloQPSNr8WQKL?=
 =?us-ascii?Q?2GCow+hZkG/N1HjqB8SPZHWqZYlGX2achrBIbC6TOf/NWZCmftntD+MLoezy?=
 =?us-ascii?Q?5hvt1wT/Rb2gk5uN5lpKquIDcWVnp6AGWoEuc8kTPwy5qC25DdOg0WopSmfr?=
 =?us-ascii?Q?nJsLxPe2ChXJWCDxM/7GV9zyOqdVlTGq6VOh3wRfFxh3KuePMhM7qP7zbZUn?=
 =?us-ascii?Q?ARgETgucrfRX9M8x96Ejt4xvzJ7RMQqmDhOCWQ3VT57MPIdwE3ICAACqqa8z?=
 =?us-ascii?Q?wIdkpO0AUFMzjazWP9IWC1C7Q3nP29QsiX/F2bz4QTqUWTCOBao9qiEolswR?=
 =?us-ascii?Q?put5yDd9FjDlxpNlonG/vDQP2BFPGgZ2Xco/kR8XUgdQSMy54CJmfW2IvQ6N?=
 =?us-ascii?Q?lgMPzIovGtvL/NIiFvmf55es3hJu88YaABbve+KSGDJGoHLxvf1JSb3jlz6S?=
 =?us-ascii?Q?9NrgWNlPHPf7dMe6TfAQGOhv8Q7jzdOW3hmfDdbfsMfPt2ZKuTbdcJxWv+EZ?=
 =?us-ascii?Q?6dxuyK4UcCXOojXzHLRNLmLKLGgyqG5/KH6UBfxBqBMdNDbHvdKUz2+7vweM?=
 =?us-ascii?Q?QFHq9lDQdCDZeaqoWsMSQ7LxtXDW0hzqSyHSVjyBLKxXLhtI2Rz0vLj5PVCe?=
 =?us-ascii?Q?r+jAqEgorhVvR49Hr3Jd5sHK/ODti82sBMw7hYWgrlQtrwAMHn7y7h8Z8gY3?=
 =?us-ascii?Q?L7Wmf0dKQCO3RbngEvI3TeV7MIjQmfsoECGGv0mY3oJkHlHlXKlRsQvfb6J9?=
 =?us-ascii?Q?oPAX2xys7mmSPDnx7fnG2NxXARAZzk+BJVGwmy3m6gO+xHHUbr+AjKh10vBH?=
 =?us-ascii?Q?5MMOUiT17F7LoHsvTeiMuum/5wvn33y/xc6tUp030cdlMiDv8qGic626QMfs?=
 =?us-ascii?Q?c5BfTSsMD2D2iNZx0GTcoz/upT76Nl5kj9SsyFtW22jBoFxystV4IWNb6Kn3?=
 =?us-ascii?Q?1RNsyePzn4AObeg7YxSUYY3YODftca6U+6AYqoPRCtPqQcmGA4qWnqTG+sm5?=
 =?us-ascii?Q?XTXHvvJsKfRpib6rzEGTjo57TmNrEVF/kAQeiCF2e2vTXg3+iqdgFJVysRXq?=
 =?us-ascii?Q?ENZs6RVs6kUpVgSPMtsuhdIGtzuLMLUpi/LKewkkpfyt7wSByn9Cdzf1wyAD?=
 =?us-ascii?Q?BISwfbPAeybGwHh4xnDe2a1qiirDNevb4T8R1jED0Ki+T2ChTVtn9tAX4M5r?=
 =?us-ascii?Q?Bh6cv4u/coQ6Jrf84IEqmYI4bcdpYaddiEclxkqtGObMFlV7ox/qo3+kflvg?=
 =?us-ascii?Q?Xu638zCr1cM0SH41XkteZIcA33yBeyGwWW/F?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lD4GkO1Nn5X8fwqf7hQiGgc3s0LAg8GwH0NFXfdBagwuXVWBgNikLTZhzM86?=
 =?us-ascii?Q?nnkKAonCPwuouXZzuSj21lZCluYZHq0+Qny+llsdkqgE+F0/dj7Gow1T58IE?=
 =?us-ascii?Q?Ez3zIfldAeH7PmPLN5wd75bnCQva2RL2jeYdzeNYXjLkqWFyahW3VLdxR2f+?=
 =?us-ascii?Q?kKYbuj8DHNcqA8PX1BgHVoaDinWthC6SOnUmOxzonQjukBUPosglpNDCKiR1?=
 =?us-ascii?Q?3O4s8FO0Ss0UpaW0Q2hVcS1cN01Ave7+57IrhNDj0c+lZxLTjv91D91NyG06?=
 =?us-ascii?Q?GBG9vTFQ9exPMrcy3B6vSEVI153R1T0MTZ+qZx9bn3Eeos9mV1E69BOs5O8Z?=
 =?us-ascii?Q?NN6GtvCPgRdHJ868fjIAs2fkR4qwy1c2+R8eXnSE30OAgv4y+i8JGH6k5kA3?=
 =?us-ascii?Q?7f9cRGW5C0s96jUsGtmgerA2CpamfCC95D/dD5/ZGg/jEduV1JEbj0/DQTCK?=
 =?us-ascii?Q?UTpUDGKWF/4hclF1Expa2Ken+YEifhfzxhY35tBUm/abKQbjTMEDumr7Htxt?=
 =?us-ascii?Q?RHidFpsgDzmWqI6W/crvXPqgjh15pdmX3lnBNmgwKKPuojYOn3TeRdawcUe1?=
 =?us-ascii?Q?FAK1n3ekrOspPHF7Tfc+p6F6FAg8z8LUSXMMpUhoEIZP8ZKQ9tg39fSCI76T?=
 =?us-ascii?Q?DiNN7m/r1AgHuwY2YwQU5AaPRyIlysw5ejT6nzEsjgDjYDnSbneoZNNVZC/L?=
 =?us-ascii?Q?57y/I7ysmh8ti3AqWVcCn/oTHv/qCYKacIBZd5tfm4weyMjn5ZofG8HjKLVx?=
 =?us-ascii?Q?9TiWiX9UazOyPG//8OzMKIyIzpkbe9wlkkctfw0DpyFxndRbyCMOqBWKxDxP?=
 =?us-ascii?Q?Hx20AE/yJMcOwr5Vz4nNvZsaTz3E7DfOJv+gB6DsIOsslhSJBwmpToilV8pZ?=
 =?us-ascii?Q?pxkMGWJMUPTUDbyNk+Gkkd8+cT3LN0Fh+D/PDgPlDvjuFai134dDA1bSxAd4?=
 =?us-ascii?Q?1BjrjBJMIJcA2Hbow0+z+slZT66hx4Wu3zpiONK0rBEt+s5TbAuSrLWd6u4y?=
 =?us-ascii?Q?7pIqxD6DN0Y69pb6oiE+/gBNPwttdt9gP+Jf7mWK/u1TOEclCZTF4Cw1nyfu?=
 =?us-ascii?Q?No8VKApVMsEUTwdUUIdfxQjByvWEbOx4AgdeqDaDNx6qJ92JDhYe/+8OvMiN?=
 =?us-ascii?Q?lsUv8GQtpVi+PM5nXA0QqTZYhl8PbQIMBJ7mXL4ToMHsoO3Q8N4hMzLvyOq2?=
 =?us-ascii?Q?3TD98c3OtZPBBOxgjGiCTbtf3f7tbXiPr/XMdelk5DhkfZnWZHZEOSxgPjkx?=
 =?us-ascii?Q?jscB1AM8b5sCvYzJmpt2lu98zuPxVyOPl+v0ankN31qxfFDHmeTdyzQMP0xs?=
 =?us-ascii?Q?kbEAyTGRYdcaLKGnzFRJCboMWMTd5IQvmmGDm7iVSAKDEqIqd2wJ6ZyP6/gV?=
 =?us-ascii?Q?TT11DxefpwwEIU11NfOvqqCMD8KQlXjjsY1k/KdlWKksK4qlqC2lyQSYfmAA?=
 =?us-ascii?Q?ENoTCNIr9JIpvgl2gy2QzCGAV/gGlSIUENK+Ii1AyHXfUvLBkmk3TnFKS3cS?=
 =?us-ascii?Q?LJYDE7za6sKNFgnHQdQCJ8V8n4ROcpPA4O3l40KuGiuTGCinmyUWFirurTff?=
 =?us-ascii?Q?lcIjJmKyNE/NiMZ8B2jjyTN+dyUGh8CM8KfTXnET?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 916d977c-09d6-49f4-7689-08de07c24ade
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 06:00:19.3787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fthefetaxanVoBzYVh9sKYRIixNNvAME1ZG9BotVYCQL9IzxxeHvVVPaodnxxUM0qJ/DzizQy6obPlpqcmTCjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
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

Hi Santhosh,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Santho=
sh
> Reddy Guddati
> Sent: Thursday, October 9, 2025 5:55 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t] tests/kms_plane_multiple: Restrict pipe/output com=
bos
> on 2x subtests for simulation
>=20
> In simulation platforms, limit the execution to fewer pipe output
Message says fewer combinations, but code does only one pipe/output=20
combination. Please change it accordingly.
Imho, better to write simulation environment.

> combinations for 2x subtests. This avoids timeouts by reducing overall te=
st
> execution time out.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_plane_multiple.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c inde=
x
> 4e6ca780a..28969fab1 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -509,6 +509,7 @@ static void run_2_display_test(data_t *data, uint64_t
> modifier, const char *name
>  	enum pipe pipe1, pipe2;
>  	igt_output_t *output1, *output2;
>  	igt_display_t *display =3D &data->display;
> +	bool is_sim =3D igt_run_in_simulation();
>=20
>  	igt_skip_on_f(!igt_display_has_format_mod(display,
> DRM_FORMAT_XRGB8888, modifier),
>  		      "%s modifier is not supported\n", name); @@ -543,7
> +544,15 @@ static void run_2_display_test(data_t *data, uint64_t modifier=
,
> const char *name
>  					test_fini_2_display(data);
>  				}
>  			}
If 3 or 4 outputs are connected, the loops will also run for the second pip=
e/output pair.=20
Based on your changes, it seems the intention is to run only a single pipe/=
output pair,=20
which isn't being met.

Could you please confirm the intended behavior on simulation?=20

Regards,
Pranay
> +			/*
> +			 * In simulation env, only run the test once with a
> +			 * single valid pipe/output pair instead of all combos.
> +			 */
> +			if (is_sim)
> +				break;
>  		}
> +		if (is_sim)
> +			break;
>  	}
>  }
>=20
> --
> 2.34.1

