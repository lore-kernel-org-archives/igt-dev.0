Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78207C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 06:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1459110E0C3;
	Tue, 30 Jul 2024 06:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSk1u17B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2969410E0C3
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 06:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722322332; x=1753858332;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=H8CN/i0mG4SG5B4myeE3vBuw6Vk4J7fj8M1Actp64Ks=;
 b=iSk1u17BMauo8+t9qYbzBqNTCKWmVHx3Eymb21ZFtNfI8RTGzHhDZwu7
 DulAOAPwP5FIc4CQJUKDzujT5nnqTsjzW7AiyeiHF8Vh6o+x6sM+O2AWW
 xBJCuN5arfm4UiGFydgBs5Go9y9G9/rsA/Lgj7CKUSHUQMz3JnpRLiq68
 d8DiwlshnE1kws0mhzxUuEo+kBP+7BD8LZllQDd/4uYLkJwegbpRxFEri
 0BnlVLxWlyZ1TyjP6dL5AqAwa9SmwWZ1TTsnecTw5jDH/b/DKk2F4cGUw
 nl4B1KB9p+s1QnDo6gOHt2e+66qYjUyFH4x4Pl3Shs2PnuusiKqRDAchU A==;
X-CSE-ConnectionGUID: H7Bm33+ATla/jjsh98cDRg==
X-CSE-MsgGUID: LjiYrrD5SmmeHqom5c0ZYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19717802"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="19717802"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 23:52:12 -0700
X-CSE-ConnectionGUID: ret8aupsT2iNV7Ay+1HBzg==
X-CSE-MsgGUID: FVS2Mv41R6asPJJaRCL9rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54203712"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 23:52:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 23:52:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 23:52:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 23:52:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 23:52:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiDDgoG384Z4wPPV+Fo/DWheHPiEeuQ6xAwEH6l7lugKqNr7wG4iWKvV3oqmoAkKU+HpmV0apxYMb18FHAII+ved2s7dFKdHlfjEsYKscptKNLHkTGQ4kT9C+pr5h34Cbnt8kEn0SfYv+PFIUdtX0O9Umo6+f8pU1iI2aiMJjo9jWdN8kJygcaQHUT0uUjP2vIp2Ojll81mi8+WXCKR44E3BUppAfP6I5048uL0uT5TttCqqaNa5pYoJeJq/kK28oUoKr5rPXUhUTURdtfwx26+85LRUCPR6lJmnsASeaox5p79+voap0IG+ZbDKtcAWcZdSodYJatGV6bFOFF7xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCX3ttt5YM7FtZ/bqeWL1o7UClddBsvC2y4s9bqonVA=;
 b=O0bgQm9+M9LathMEeW9pgIgBayjPuXd8+bX85YQ0Kr9tm3lLiOl7dz0rmWeti4YvRhsP6eB4wkg3dnwfIIx8ulCQWqc9NNY/WScypB6EBNjsBop0AiqDniyD/OTOu6M7zFqgQBBGycmQ7al6O/86VoZ7rtbswkgexamWsOM4vWIaBKkU31baaT8b4y6xKA4Yz2yWL7PmlD15Gpm4qQKTrBT0orgx1omRCtFntBTrzGFCLVSCuBl8DN5W+9gZPGz6IlZo9YHHTuKUAW7f4sdYxsS+6q+m7xwg8xto2Lo8CFpPvFq4nhdHKNQXKszUPFcYIwP+ki/BEEC6BUfLz0wjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by CO1PR11MB5137.namprd11.prod.outlook.com (2603:10b6:303:92::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 06:52:07 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%7]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 06:52:07 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/2] tests/intel/xe_vm: Add bind array -ENOBUFS section
Thread-Topic: [PATCH v2 2/2] tests/intel/xe_vm: Add bind array -ENOBUFS section
Thread-Index: AQHa2hRAaUXClToWHUWgmIoqeOdxF7IO5CCg
Date: Tue, 30 Jul 2024 06:52:07 +0000
Message-ID: <MW3PR11MB47489E83482A61F8508503FDAEB02@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240719194613.1549550-1-matthew.brost@intel.com>
 <20240719194613.1549550-2-matthew.brost@intel.com>
In-Reply-To: <20240719194613.1549550-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|CO1PR11MB5137:EE_
x-ms-office365-filtering-correlation-id: 6da68d67-6561-4530-a874-08dcb06420cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3mAnEeTW39So+2vrbOgQb4GwDlt98R2LUVP/VS74nOw/eN0yd0ZhFtmr0yqO?=
 =?us-ascii?Q?vG8NQilJKlPBXrKyF6A9ovN9Is/+4VepBrnkIiSiktuPI5ZQ2U9A8IN+Ovyn?=
 =?us-ascii?Q?lSToLuImRSTXhKneZDAxwKnokGND39WPN0FLi2KeJRBm3+3ph14uhjnl5Rkv?=
 =?us-ascii?Q?JfgZoWWKnE1pb6lSkimEm3njBUz835k74253okLMXrpZ/acjVVMVspYonj3m?=
 =?us-ascii?Q?iIUrRn6Iovfg9s2pcYOJpN5cup+H4JKnsWACgL2UWe7VK39yFQBTd5wWb/Wd?=
 =?us-ascii?Q?Pvr8TGjPEZEJ02K+9tlVjvJb9SKKd0B1hK5A1Yh3oApNu2GDFjXCkBRid15r?=
 =?us-ascii?Q?6jlq9o0Mroo28UszEojxs0QItJhPglr8eTvqS6ManUSDBTcqPTm4UlhtdhPk?=
 =?us-ascii?Q?3h0c60vUFE90HhX+AcXsShtZFe12hNHKYtuw7zwFodMtLzoEPSnwsQTz8sqi?=
 =?us-ascii?Q?lZblyTV+Yv+VU8Qn+fwRDJbIdyqy8fqVSqPVPtBncpQZqcqJIsP8B7S3USnH?=
 =?us-ascii?Q?EG5+cYJgSrTHnbG7nzuR/FGbWUcEh6jk16/Y9n62oihiSt6FWSisRz3zw+On?=
 =?us-ascii?Q?QcLqlwpdN6K+N+mYxkbCu2JgJmuzR6+S8NJzM9W1l5wBctixC8jYUzm+x4CT?=
 =?us-ascii?Q?swwUl13YHI4cXRO2WwTsHMtzXmIfKyWRsxBkaADh+2YdSQztDXeBYI7jYViN?=
 =?us-ascii?Q?5RLjYfuXlLj//6gdovZ3VIYeJiGo0WLssFhiBVHjlR9IjA5ydsXnFtDCuoqf?=
 =?us-ascii?Q?1I07MgQvBrOO0d/7ZGCH7/x1/cI/Apvawwpl3aVHpKXW7ODuBjEObS6s15nC?=
 =?us-ascii?Q?zBJqueFok8+RHv9hxjwiPoYZOXRS0Wust0likgb7FlPhbdKZSyBjexW85Smr?=
 =?us-ascii?Q?yCavgI/HnoIDGRPPPr22OlV/jGXSf8s8T9e9FPIlr6cNujuz+nDGhjY6PPnO?=
 =?us-ascii?Q?n9xsFBKfR45ZYgmx6Qy+ALxmxNK5L4zuLvbxJM2/NNwruaoxWDaT0b/RJqKy?=
 =?us-ascii?Q?88WN1mUQcVNr19XpUeBj37nEsQpW0q06jLoQMHilXkSgOM8sUlYav9it7DYz?=
 =?us-ascii?Q?HGZmkfyEf4tNxuGohyuNuxSvtKLILt0CwCQ6K2fnlJYtHCV+6Ar3XUkFmxtl?=
 =?us-ascii?Q?565tdCn8HF+k7d7EijvL4V3u6Eaqwb/rt+l84ugTHLWXpi+WnSNSYPraIT7H?=
 =?us-ascii?Q?9TxE9ckOtgEh6bur3TGBG7N9YI427uzKHCPr/QOJdDYA1plwG2ta9iG46J45?=
 =?us-ascii?Q?5x5948ySGVM+9UyJyngIqxmbLDN9MdqK1aGSzpAenW610oa0eV2cI38x541E?=
 =?us-ascii?Q?WZ/nqM+kSuJhlN92BFBEIEBf0P+37LVqRNjN3HulxaMg2RmZQ2zTVgYCJ2KQ?=
 =?us-ascii?Q?FoO3cBXsCdRkqiKfEe/4KU9/JAA5VK7bFuRQKseQt9OvAmePSw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5yc6XKbQTleMQtCkQ4UBVSCmP+cqyIsZTBzqWGCwdwmB98saSGdzeuuCw3a9?=
 =?us-ascii?Q?LWOL96hWhZnFhHGU34g+uCHfAbbXSV+SznvarbZgPqXaY3ZSU1p9uKK2qXnB?=
 =?us-ascii?Q?AOXOQ+ty/OVuH0lpxX3G7YIhPi5Dhcb672aDtiV+xypnNtoZYS454Rp7j0lF?=
 =?us-ascii?Q?RkuKiPwoAoSTALMa+xp3TPg63Z5I+/lnq9kmPF7zgtUUZPf2gmX5I0UhN1KL?=
 =?us-ascii?Q?pQrQO99FoQeSS1ucyRMnkL80o8VH4KQVNYxBeRuByCuHb+RMGKErvObeAFo0?=
 =?us-ascii?Q?KL49nM2Xs6NaITvYAEPkzf5n0Rgiw74Kz1RuVBtP5LGRj0AoyLYqV5+McYiR?=
 =?us-ascii?Q?R6LuDAZcnxB4NyXBs5CsUc0NYfPc4dHjbPQBtiwt4YCX0iM6Qz7z65eB4Jmi?=
 =?us-ascii?Q?u2E2qWTTvK0FqfyCuXRGXx9cD5Jlq+oGCsZA2NMnKY/KihkwmzPQ35IEWGfI?=
 =?us-ascii?Q?OCb33zF/N9fPSvdaO9IDHJMzCGbfnyW4dxsPECmJjZxqWKno7xBNSW22sH8P?=
 =?us-ascii?Q?woFtt2Jf84gB4J1Xg2Y9mYG7kEXvolovTprd7NCiXHDpYMX5XSnb71WI9S9A?=
 =?us-ascii?Q?hLJOi4xUpJHnJVsrGDAK5GzoM+xbykbSiEaCay2JxAHUVruK6DA+h36iV+68?=
 =?us-ascii?Q?B6nipbZAuMagG8xglQwdgsnxIxp1ibdh8vid87qKOsaIt4JpPLTZ9eWhJLjK?=
 =?us-ascii?Q?ait2P5oV7FEIaiANrBfmenLOP39IgQuK7Uk4jhK7X8V/e2uRgGnjcTvY6srM?=
 =?us-ascii?Q?3EPFy4rMBrMwrVIApydtnvAU27aJfH80dDI7gfMTncvk50Qc7ZAUb3yE/aY7?=
 =?us-ascii?Q?q7ThrjbsT3iGOBGw1/gwd5FvU60pBFURknM8xymTQaUbS0czHCuDzLarpGXW?=
 =?us-ascii?Q?xnp+tYt/XPYbTQRf6QdnHpzcc2+m5DZCaQRxPjVIbumvveK8Js6E8br/rt97?=
 =?us-ascii?Q?EhyUngjY+UPkME4sa2d8DeXP3GpBZ7gqSHY4mumOSL4XcFaxKp/hm80Y6s2j?=
 =?us-ascii?Q?CB0kUYcE1I/0HXRQ/aToXA6flfPAKG1XE41TT24q97YaCYRscb1IxZ/iGUxJ?=
 =?us-ascii?Q?LoR8RwKWQUUUmDmP7bolj8HzigPgAknVJu+V3/HuyWtlTb1pGVGR6ehYpPl0?=
 =?us-ascii?Q?rhjhynw9UArMDxxZkaxfvjrsI5JcXoa9wfN60RoBcDSOdRHPsRkpS4ifs8SL?=
 =?us-ascii?Q?m6u7b3xv0ejvGd33HcjW/hLFEAfDbG81jlZG7PPRzn+GxA356P++uI4JmMzW?=
 =?us-ascii?Q?qddrxtCUecozDYucaOHXfN6StjzpSG29pPYdICwsGGWpzRvY2COpYriVDPKK?=
 =?us-ascii?Q?KcQ8KP5ZKaE+O55yBz3FagB1jqo8ZoSNZgr4+RBeKroAj/bf6uK1/o8k7ggs?=
 =?us-ascii?Q?EFEiDdAUn1U54HVdoTerT2gjZ3Pbzc+YJ0+6kjp98sPT1yZObyOrBDuT5bqP?=
 =?us-ascii?Q?FylIRRNbY82WWvQdS8XJLnPQKwV89fK0vefVLV3NopTnIarhUAOdOAFnfU8l?=
 =?us-ascii?Q?SExRCAlSK3evlFy5JQQf9Ug/XYwOnc/Vh/Sg+5fJjgo25stB2SIdR5eiRuWL?=
 =?us-ascii?Q?6T98fgKdyG/gwry6p29YP/sI2IDh+wHFHUVmX5pDYIw2YKeKXWq/+pAoAzWv?=
 =?us-ascii?Q?+Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da68d67-6561-4530-a874-08dcb06420cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 06:52:07.3317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DYv+zW6C3tgAefye32xZFvLnL0v4NkuLzwGwPOSgebzvL/XxGSgUH0eTt5PJDVxPPQsa7WmucW+J/IYYF9e8k5GI9sHH4T3jHf1vE020PEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5137
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w
> Brost
> Sent: Saturday, July 20, 2024 1:16 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH v2 2/2] tests/intel/xe_vm: Add bind array -ENOBUFS sectio=
n
>=20
> Add section which has a large enough array of binds which triggers BB
> suballocation failure. Verify -ENOBUFS is returned in this case.
>=20
> v2:
> - Use do_ioctl_err (Matthew Auld)
> - Move xe_vm_bind_array_err to xe_vm.c
> v3:
> - Fix sign of error usage
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_vm.c | 51 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 12 deletions(-)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c index
> a5f25acc7e..cff71487e4 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -869,7 +869,7 @@ static void xe_vm_bind_array_err(int fd, uint32_t vm,
> uint32_t exec_queue,  }
>=20
>  #define BIND_ARRAY_BIND_EXEC_QUEUE_FLAG	(0x1 << 0)
> -
> +#define BIND_ARRAY_ENOBUFS_FLAG		(0x1 << 1)
>=20
>  /**
>   * SUBTEST: bind-array-twice
> @@ -882,6 +882,11 @@ static void xe_vm_bind_array_err(int fd, uint32_t vm=
,
> uint32_t exec_queue,
>   * Functionality: bind exec_queues
>   * Test category: functionality test
>   *
> + * SUBTEST: bind-array-enobufs
> + * Description: Test bind array which too large are trigger -ENOBUFs
> + error
> + * Functionality: bind exec_queues
> + * Test category: functionality test
> + *
>   * SUBTEST: bind-array-exec_queue-twice
>   * Description: Test bind array exec_queue twice
>   * Functionality: bind exec_queues
> @@ -894,10 +899,10 @@ static void xe_vm_bind_array_err(int fd, uint32_t v=
m,
> uint32_t exec_queue,
>   */
>  static void
>  test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_=
execs,
> -		unsigned int flags)
> +		uint64_t addr, size_t bo_size, unsigned int flags)
>  {
>  	uint32_t vm;
> -	uint64_t addr =3D 0x1a0000, base_addr =3D 0x1a0000;
> +	uint64_t base_addr =3D addr;
>  	struct drm_xe_sync sync[2] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, },
>  		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, }, @@ -907,9 +912,7 @@ test_bind_array(int fd,
> struct drm_xe_engine_class_instance *eci, int n_execs,
>  		.syncs =3D to_user_pointer(sync),
>  	};
>  	uint32_t exec_queue, bind_exec_queue =3D 0;
> -#define BIND_ARRAY_MAX_N_EXEC	16
> -	struct drm_xe_vm_bind_op bind_ops[BIND_ARRAY_MAX_N_EXEC] =3D { };
> -	size_t bo_size;
> +	struct drm_xe_vm_bind_op *bind_ops;
>  	uint32_t bo =3D 0;
>  	struct {
>  		uint32_t batch[16];
> @@ -918,10 +921,11 @@ test_bind_array(int fd, struct
> drm_xe_engine_class_instance *eci, int n_execs,
>  	} *data;
>  	int i, b;
>=20
> -	igt_assert(n_execs <=3D BIND_ARRAY_MAX_N_EXEC);
> +	bind_ops =3D malloc(sizeof(*bind_ops) * n_execs);
> +	igt_assert(bind_ops);
>=20
>  	vm =3D xe_vm_create(fd, 0, 0);
> -	bo_size =3D sizeof(*data) * n_execs;
> +	bo_size =3D bo_size ?: sizeof(*data) * n_execs;
>  	bo_size =3D xe_bb_size(fd, bo_size);
>=20
>  	bo =3D xe_bo_create(fd, vm, bo_size,
> @@ -949,6 +953,22 @@ test_bind_array(int fd, struct
> drm_xe_engine_class_instance *eci, int n_execs,
>  	}
>=20
>  	sync[0].handle =3D syncobj_create(fd, 0);
> +	if (flags & BIND_ARRAY_ENOBUFS_FLAG) {
> +		struct xe_cork cork;
> +
> +		xe_cork_init(fd, eci, &cork);
> +
> +		sync[1].handle =3D xe_cork_sync_handle(&cork);
> +		sync[1].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> +
> +		xe_vm_bind_array_err(fd, vm, bind_exec_queue, bind_ops,
> +				     n_execs, sync, 2, ENOBUFS);
> +		xe_cork_end(&cork);
> +		xe_cork_wait_done(&cork);
> +		xe_cork_fini(&cork);
> +		n_execs =3D n_execs / 2;
> +	}
> +
>  	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync,
> 1);
>=20
>  	addr =3D base_addr;
> @@ -1008,6 +1028,7 @@ test_bind_array(int fd, struct
> drm_xe_engine_class_instance *eci, int n_execs,
>  	munmap(data, bo_size);
>  	gem_close(fd, bo);
>  	xe_vm_destroy(fd, vm);
> +	free(bind_ops);
>  }
>=20
>  /**
> @@ -2397,20 +2418,26 @@ igt_main
>=20
>  	igt_subtest("bind-array-twice")
>  		xe_for_each_engine(fd, hwe)
> -			test_bind_array(fd, hwe, 2, 0);
> +			test_bind_array(fd, hwe, 2, 0x1a0000, 0, 0);
>=20
>  	igt_subtest("bind-array-many")
>  		xe_for_each_engine(fd, hwe)
> -			test_bind_array(fd, hwe, 16, 0);
> +			test_bind_array(fd, hwe, 16, 0x1a0000, 0, 0);
> +
> +	igt_subtest("bind-array-enobufs")
> +		xe_for_each_engine(fd, hwe)
> +			test_bind_array(fd, hwe, xe_has_vram(fd) ? 1024 : 512,
To make this test future proof, you can add requirement check -  binds*size=
 > Space available

With that added, you can add r-b
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Thanks,
Rahul
> +					0x1a0000, SZ_2M,
> +					BIND_ARRAY_ENOBUFS_FLAG);
>=20
>  	igt_subtest("bind-array-exec_queue-twice")
>  		xe_for_each_engine(fd, hwe)
> -			test_bind_array(fd, hwe, 2,
> +			test_bind_array(fd, hwe, 2, 0x1a0000, 0,
>=20
> 	BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
>=20
>  	igt_subtest("bind-array-exec_queue-many")
>  		xe_for_each_engine(fd, hwe)
> -			test_bind_array(fd, hwe, 16,
> +			test_bind_array(fd, hwe, 16, 0x1a0000, 0,
>=20
> 	BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
>=20
>  	igt_subtest("bind-array-conflict")
> --
> 2.34.1

