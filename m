Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91972FD2D73
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 12:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4321D10E297;
	Tue, 10 Mar 2026 12:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHidjgdz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8F010E297
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773147487; x=1804683487;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6Mnf9IoUzifI3JS83b3wjLioR86ndxSp60s/RbmgodI=;
 b=CHidjgdzuxAYGQCk/g2ebZpPaQ+RHHfokr43fW1gPCINsb70jbxoiHdQ
 cLFVOynTCuTI3XFnDjWqYwZUDDxsrlKUKxqm9PtB3rZfNYDVkUW5bfwHa
 p7nmv/Xjhv7muY8mVNy8G1yQbR0f7VHFi/7uUy/XIx3JyjJFD58wrO2Yb
 YiP3Eb3fFdqokd+DLMKnmlH6hKs330W70Ar1izybD/YTAcOMoBt12Vj86
 Y7iHEc7X8zLJ17DzPVjKR4VKAFakJegZYCT8rwGVdPcPBNrhNBkHVX8EJ
 ubUck9hPav6TIDAl9/4jW+pCfOgWmVUtSmYUokizRk1wt7IJr5mrQmbiP w==;
X-CSE-ConnectionGUID: fUnJlCquRVyHWLr/CajwCQ==
X-CSE-MsgGUID: X1qtIznzTJm0f3N+FzgA/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85668385"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85668385"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 05:58:07 -0700
X-CSE-ConnectionGUID: oSrQKs67QR2mbtehAnX4AQ==
X-CSE-MsgGUID: +NTj26gYSo+N77HnQdN39g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224560167"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 05:58:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 05:58:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 05:58:06 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 05:58:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQ3gleMbVASaohafniEmEJ13cA//jGN+pPwFi/gnThQ3JVfGXxW9tLOI9NHBS4fDGBPk3/K5FxLRwjYWTW82gFnku/kGl8pa8F6wZYPvzI/Q9GoM+IUK/Cvtoc2rQbRz0QVdC5m15Kj8zucdogetu8UNZBp7RCSYlmHv8AXZrDjGlwg1SvBwMG1hQlwbEs04iRIF6+AMaXcJAwf6LXB058CEv2J5Rocr77FgXIf9bOan/X6uazHH8Gjib0fIbnMggebZPY0pe2jzKk+gHO1PsXR/eGRbngmBUv1t3ZOvKJfYS6NuY76d6ea6G37FSBSRcfDWuGXJUcOxsdRSaSFtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Mnf9IoUzifI3JS83b3wjLioR86ndxSp60s/RbmgodI=;
 b=wNwR66Ccd71QhRbFQ0Mys0k9GBbIZnYefLHIpzOGFQVkco6uW1kba1g1osbdUNLXZw30Qd3GrWmkZ0dAiQIu0iTJYx2KztR6+Wb57ycMqDvPZO087X6E3tJcG3WOA/PQR2pid/zS0pqN6jsXos/xGWH2FetIOaMyMlz0MwjZv9HJXgZ18lkGUEEDHycefZXtoiIWurJj8bDOslb+QCrqAscaegDDurKY/pbeo/fnWhyOHWPT7GD/4LjFhE5G7+n634raiYdZs61Ea6dvUz+lH/RQE5sTaOOb1lE60uARlGxZI9KcIEPvbe0SIef0BldQ3sCy5EZTA/TJfazu+aaSCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH8PR11MB7117.namprd11.prod.outlook.com (2603:10b6:510:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 12:57:58 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 12:57:57 +0000
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t v4 2/5] lib/xe/xe_eudebug: Modify toggle error
 handling
Thread-Topic: [PATCH i-g-t v4 2/5] lib/xe/xe_eudebug: Modify toggle error
 handling
Thread-Index: AQHcon75q6uKDi2wCU65z36wU1A76rWn1fWw
Date: Tue, 10 Mar 2026 12:57:56 +0000
Message-ID: <DM4PR11MB817952C005C7398ECF3AB6C89446A@DM4PR11MB8179.namprd11.prod.outlook.com>
References: <20260220153748.210381-7-christoph.manszewski@intel.com>
 <20260220153748.210381-9-christoph.manszewski@intel.com>
In-Reply-To: <20260220153748.210381-9-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH8PR11MB7117:EE_
x-ms-office365-filtering-correlation-id: 5be9e4d6-e8c5-4d02-5795-08de7ea4a698
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|22082099002|7053199007; 
x-microsoft-antispam-message-info: x6uwANfOIY8CTsOdmFdFF8ZdG3kzsfRbAy6I6P+k0EE76SydCLZAUlfClZmYArNfJ0VdJ9Nn2BVqcxevDYutzzwPOB6fG/2ZQs0Le4pBLcn6WubB+u/UqVQ4em4D6Pga9Chx4o3YIXFj6GRWUoY/B5bNLzSboc5U9ZT79ZHGRXftpna5UZ6ZyyMyZAPWXJyu5P+lDTP3FexgwsxoRxJh5kTu/fT6AxkIwzoxk7biGFEmq3oiIHRWfK3poYemEsBreaILtaOXM5wrUFHfen0kdTiEKqPmtzuwW3SpasM8Vrpal2JbPDPBmGon9v5aoAV8I5OE5WFqiE2UIBAcQb1Z6W8P/j2JKf7Nz+fVIflNa2NTN47p0OmlW4NOlcn9Vi8wNWEUjzOAnL0XTAVB7D/3/whS9SiM7mJMlS+5k9mdKv5EgD2f4XH/nUhpPdRqGq7J0+qLBWZVEwDatQUa29yo7x2DMlAa3sJgdPvuv0YMivxvnIwNkGwT/ub2/a+K7LSuaO4QsVXMKZ63ZZK3zobeaPM1OTlrcdhvgX8l2JTAYtF1/mourtsywg76WVXSwoccwxmYQalYVbhfcExNPbooTyimajqsP+WoE0uXG7EwnFkfwrTDlo8LDghDfLkmpPmaSGrrO2h1gV/UEuBmZ1cHyL50YM60v2TVAqVk9FRv9RJKkX0uelL3MXZL1XRCKFR40lP2WP1ByY4R1/2OLEAvTeq8O1B0o84SzJZUcnzDUKmXxhLFo/g2Vb8QrneaxXlQwhOIkELEmXvwBaDsOtv/BdqEFJi1sFpK2G/gmQ0090o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099002)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmJRZTcrSy90aEtraU1ITDlBQXhGazhQQ1daQWpjYVZLamZpNUdIZVhOZU5i?=
 =?utf-8?B?TDd2VkVmTHNiMFQwcXJtNFh5RFNON1pmYnkyRW1xTkIwL1FKay9iNlZjYy93?=
 =?utf-8?B?dWhZUk0zRWtrZWpkNDhLdHNkU1dCZEpmdmtTd0dIQU9UWU1oOVo3WnV0VjM0?=
 =?utf-8?B?Zm9Od2pSbUx1OTlxL0dJcU5Yd1JYYjhLQi9kMVhWY2pUS0JZL3hWTVBnVFp3?=
 =?utf-8?B?bXhzeFRETWFLNlp4dnpWUENBdTFTT1lvcXhpWjJabjFlN0NWampvTVBGYU1K?=
 =?utf-8?B?eHczZjNZR3lGeituaXV4RXFSVmtuYVNnQXd0TGR4YWdJMmh2bUVGN3h2ZGMy?=
 =?utf-8?B?cUlJeEVWd29aTWplZSt3eHFsNzJSZ3c0dytycUJaQmwrTmNXSjRtam13SHdJ?=
 =?utf-8?B?OEdEMjBVUWN6ZURSdnFqYUxpejl5Y00vT1M2bmd0bFdsK05MSTVDdWErdW83?=
 =?utf-8?B?dnl0c251WlZ6ZlNTNm9vUmFkYzZiUVBrR0VmZWZYaDRJdlNEb2xOVFd4Z0ZG?=
 =?utf-8?B?ZFloaW45dDBHRUdXVTZKNFN2eDh5Qnc4aHpOUTVMOTRZek9DMVF5djNaTmQ4?=
 =?utf-8?B?SmtuMzJhc094RWRwK0tqM09Da1B0UURLb0ZNRGZFMHNZYytNTmxHV3BZcHBk?=
 =?utf-8?B?czlSWUN5WTFlOWhVSHpndWtlaTFOM3ZydzVVSUFlZG1mZE5hcWpEbHRqR2di?=
 =?utf-8?B?cUhnWUdNR0VGU004c1dTaVZFS0UxNGs1alR6ZUxCRmVaMXppcEdwdUZJeDFr?=
 =?utf-8?B?VDNYY0d6b25WSWdjSWZsMStieVk1L3lWWTRKQUN3SnFma1ZXYm1VT0lQclFI?=
 =?utf-8?B?ZlJjeXlJeGFQQXArSE03S252UjlEY3FyTmppRTdsZTVsRGpwRGtSWWY4dWNW?=
 =?utf-8?B?bnNqM3ROM1BqckUwcTJ1SGp0aUlGZzU0UGduRGtLYWI4dCtUWmJERnBZNW1u?=
 =?utf-8?B?eWszSFlSaGlWRkxBUFV6OU53MXp2RjdDMUFSSWlzaEIvbnVCTU9CZGR5MlVM?=
 =?utf-8?B?Y2VKS0FOaEdML0RJdzZmSldleHRBNTdrWmFqRkZwOVVlNFpjaW9wdnNVS0Rn?=
 =?utf-8?B?eFQvclZkV0xtRlUyaklITnJaS052NFRKK1VRSEhzYU9YSUtkbG1mK3I3SGR2?=
 =?utf-8?B?TGt3Tng1N2h4S1plVlJJenllN09XQ2VSMGtTeTB5M1ZqN0JqMHlXQi92d0tL?=
 =?utf-8?B?TGZuYkZYNTdqZm5iSlJCdkV2YVVmQkhEcTNXZ3VnMU5CenVCQlh2bzhMQ2Q3?=
 =?utf-8?B?azRtakdxcHVIQkNkdVRTWWowWjN6U0dJWXY0U0U4V3U5Zkprc2FZejluLy9W?=
 =?utf-8?B?SWhTWWtGdFFYazdrZXJIaW1yOXdhREcySmpiTzhGZ2lpbDV2dUc5WmIwL3o1?=
 =?utf-8?B?VHJEdTl5TEw0dHdQdDVsUC9PUzhSd2g4U2JVRS9US2ZHWVJiYmZmenppMk94?=
 =?utf-8?B?OEUzZDkyNTErZHNxYVEzcUFxS1FMb3h5ajFsRWJyRG1Zc0dvMEEyM2Jxd2dt?=
 =?utf-8?B?UVhKVjZud1pwS2lqbytqMjI2MVRhZEdvWjRzb1oyNldVbk82anMxUDcxZENt?=
 =?utf-8?B?WHBqTDBYYlNWSno0WkNoMzJITlVrYktHQmxhYlpOVGszUmZwMGhOOUdJOGtE?=
 =?utf-8?B?S1FCMi9WRG15UHZOVk5RVk1oSnBEYytoem1JRE45QkpsdTdoYzFuZUtCdjFZ?=
 =?utf-8?B?cVJRR0doVmZJYzQxRTlCRTE3VitZWS83bUQwOEhuYnRoZjhnVDFzWjhESThO?=
 =?utf-8?B?b1kvWjFOZXFqRkRTZ3FOT1J1TzZlYW12TVNiQkkwVlYzOTRlckhUZTl2MTli?=
 =?utf-8?B?Z2lSZVVHTnMrOVZPUHJ6V0NvQWVBUlA3VDM4eVpoeHlEOFZYVjlZbDEzOHdn?=
 =?utf-8?B?dWlZWmRFeWJOajlEMEQ3Rlg4cEo4Y3cxQm56aTQ1bkNjRmsrNW1aT0hWN1M4?=
 =?utf-8?B?SFhpckEzU0tXQ3lEcnhEdnJoKzh6NUY4WkZzK2RPY01UL1pnZVFxK0F4WUNh?=
 =?utf-8?B?bHQ2SHNOanlzcEVsMnZPUTdnNlVCRGlwOXM4aFlremJEVXlheUtWYU9NK0dO?=
 =?utf-8?B?VVNWN2MvY2RIanYvN3B4U0RXOHlFVWR3Qm01ZXZtV3UrcktHQVB3OEF1MFdQ?=
 =?utf-8?B?UXNlZCtPcWppTWxGTnUvdTFwOHNRbThLYjl3ekRvZWtsSnhOeUl5TVNmTC9Y?=
 =?utf-8?B?djRUa3JmVHNaY0RRVTljWmh2Smdxc2hQUlZsQUpRYVhJNVQrSStvSng5RWhi?=
 =?utf-8?B?aU9mbW5lVDBXSHNLcFZGVkVOSG81V1VrSVA5T3pIbjBTQm53RjNlSGJtV0tD?=
 =?utf-8?B?UXFFOWpKejd6a1dOaHNzRElpOGRyNmUreGZwVHFxa3hPUzNtdHZWQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Hhrp3svwaw1MSa5MSZWLcb/g91e7iT+xxAyM8fjKQpsn1wuFz2DadukbAORwKQXsw6IEM02kWLl/rR1vStPhvJJ+HZmUQRylNb+zkX7Zaxrm9uIRx1FcOWLrzRBegCYhzQB5jS7X3dUv/5N6/0BHEA51R6h5Qf97WpPT0YOxm+eVNbDfq99H4a+99OU/6rLhujNOEKlwI/jP7TCnBHBMTu89fWOH2hW4VnjQgoNXp4sDDzUKhZ2bLP61hFKfX6Qca6XIiGigsrBsDr9RKuFlTknWUPX4YvwtwGyqvmjTVy1cwtyIFVPBizVXol5ehfLcEU/CnS1OVIGcuwFUMnLQuQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be9e4d6-e8c5-4d02-5795-08de7ea4a698
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 12:57:56.7662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqUrJ7XNhcisAqpikaa81AipUut1cArqbpqctvTj+dIq3vB2iQk4tvF9flj0hbRIc8KUbQcnSf0AW7WjE2JvKOLfpjAec51CQChbLTUd1O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7117
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

TEdUTSwNClJldmlld2VkLWJ5OiBQaW90ciBSdWRuaWNraSA8cGlvdHIucnVkbmlja2lAaW50ZWwu
Y29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hbnN6ZXdza2ks
IENocmlzdG9waCA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlk
YXksIEZlYnJ1YXJ5IDIwLCAyMDI2IDQ6MzggUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IENjOiBSdWRuaWNraTsgUnVkbmlja2ksIFBpb3RyIDxwaW90ci5ydWRuaWNr
aUBpbnRlbC5jb20+OyBQaWF0a293c2tpOyBQaWF0a293c2tpLA0KPiBEb21pbmlrIEthcm9sIDxk
b21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPjsgU29rb2xvd3NraSwgSmFuDQo+IDxq
YW4uc29rb2xvd3NraUBpbnRlbC5jb20+OyBNYW5zemV3c2tpLCBDaHJpc3RvcGgNCj4gPGNocmlz
dG9waC5tYW5zemV3c2tpQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHY0IDIv
NV0gbGliL3hlL3hlX2V1ZGVidWc6IE1vZGlmeSB0b2dnbGUgZXJyb3IgaGFuZGxpbmcNCj4gDQo+
IEZyb206IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlhdGtvd3Nr
aUBpbnRlbC5jb20+DQo+IA0KPiBDb252ZXJ0IF9feGVfZXVkZWJ1Z19lbmFibGVfZ2V0c2V0IHRv
IHVzZSBlcnJuby4gQWJvcnQgaW4NCj4geGVfZXVkZWJ1Z19lbmFibGUgb24gZXJyb3IgKG90aGVy
IHRoYW4gLUVOT0VOVCkgdG8gbm90IGxlYXZlIHRoZQ0KPiBlbnZpcm9ubWVudCBpbiBwb3RlbnRp
YWxseSBkaXJ0eSBzdGF0ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERvbWluaWsgS2Fyb2wgUGnE
hXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBNYW5zemV3c2tpIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgbGliL3hlL3hlX2V1ZGVidWcuYyB8IDM1ICsrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwg
MTYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2V1ZGVidWcuYyBi
L2xpYi94ZS94ZV9ldWRlYnVnLmMgaW5kZXgNCj4gMjM4N2I3NGY4Li40MWVlZDc2MTQgMTAwNjQ0
DQo+IC0tLSBhL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gKysrIGIvbGliL3hlL3hlX2V1ZGVidWcu
Yw0KPiBAQCAtMTgyOSw2ICsxODI5LDcgQEAgc3RhdGljIHZvaWQgbWV0YWRhdGFfZXZlbnQoc3Ry
dWN0IHhlX2V1ZGVidWdfY2xpZW50DQo+ICpjLCB1aW50MzJfdCBmbGFncywNCj4gIAl4ZV9ldWRl
YnVnX2V2ZW50X2xvZ193cml0ZShjLT5sb2csICh2b2lkICopJmVtKTsgIH0NCj4gDQo+ICsjZGVm
aW5lIEVVX0RFQlVHX1RPR0dMRSAiZGV2aWNlL2VuYWJsZV9ldWRlYnVnIg0KPiAgLyoqDQo+ICAg
KiBfX3hlX2V1ZGVidWdfZW5hYmxlX2dldHNldA0KPiAgICogQGZkOiB4ZSBjbGllbnQNCj4gQEAg
LTE4MzgsMTMgKzE4MzksMTIgQEAgc3RhdGljIHZvaWQgbWV0YWRhdGFfZXZlbnQoc3RydWN0DQo+
IHhlX2V1ZGVidWdfY2xpZW50ICpjLCB1aW50MzJfdCBmbGFncywNCj4gICAqIFN0b3JlcyBjdXJy
ZW50IGV1ZGVidWcgZmVhdHVyZSBzdGF0ZSBpbiBAb2xkIGlmIG5vdCBOVUxMLiBTZXRzIG5ldyBl
dWRlYnVnDQo+ICAgKiBmZWF0dXJlIHN0YXRlIHRvIEBuZXcgaWYgbm90IE5VTEwuIEFzc2VydHMg
aWYgYm90aCBAb2xkIGFuZCBAbmV3IGFyZSBOVUxMLg0KPiAgICoNCj4gLSAqIFJldHVybnM6IDAg
b24gc3VjY2VzcywgLTEgb24gZmFpbHVyZS4NCj4gKyAqIFJldHVybnM6IDAgb24gc3VjY2Vzcywg
LWVycm5vIG9uIGZhaWx1cmUuDQo+ICAgKi8NCj4gIGludCBfX3hlX2V1ZGVidWdfZW5hYmxlX2dl
dHNldChpbnQgZmQsIGJvb2wgKm9sZCwgYm9vbCAqbmV3KSAgew0KPiAtCXN0YXRpYyBjb25zdCBj
aGFyICogY29uc3QgZm5hbWUgPSAiZW5hYmxlX2V1ZGVidWciOw0KPiAgCWludCByZXQgPSAwOw0K
PiAtCWludCBzeXNmcywgZGV2aWNlX2ZkOw0KPiArCWludCBzeXNmczsNCj4gIAlib29sIHZhbF9i
ZWZvcmU7DQo+ICAJc3RydWN0IHN0YXQgc3Q7DQo+IA0KPiBAQCAtMTg1MywxNSArMTg1MywxMCBA
QCBpbnQgX194ZV9ldWRlYnVnX2VuYWJsZV9nZXRzZXQoaW50IGZkLCBib29sICpvbGQsDQo+IGJv
b2wgKm5ldykNCj4gDQo+ICAJc3lzZnMgPSBpZ3Rfc3lzZnNfb3BlbihmZCk7DQo+ICAJaWYgKHN5
c2ZzIDwgMCkNCj4gLQkJcmV0dXJuIC0xOw0KPiAtDQo+IC0JZGV2aWNlX2ZkID0gb3BlbmF0KHN5
c2ZzLCAiZGV2aWNlIiwgT19ESVJFQ1RPUlkgfCBPX1JET05MWSk7DQo+IC0JY2xvc2Uoc3lzZnMp
Ow0KPiAtCWlmIChkZXZpY2VfZmQgPCAwKQ0KPiAtCQlyZXR1cm4gLTE7DQo+ICsJCXJldHVybiAt
ZXJybm87DQo+IA0KPiAtCWlmICghX19pZ3Rfc3lzZnNfZ2V0X2Jvb2xlYW4oZGV2aWNlX2ZkLCBm
bmFtZSwgJnZhbF9iZWZvcmUpKSB7DQo+IC0JCXJldCA9IC0xOw0KPiArCWlmICghX19pZ3Rfc3lz
ZnNfZ2V0X2Jvb2xlYW4oc3lzZnMsIEVVX0RFQlVHX1RPR0dMRSwgJnZhbF9iZWZvcmUpKSB7DQo+
ICsJCXJldCA9IC1lcnJubzsNCj4gIAkJZ290byBvdXQ7DQo+ICAJfQ0KPiANCj4gQEAgLTE4NzEs
MTQgKzE4NjYsMTQgQEAgaW50IF9feGVfZXVkZWJ1Z19lbmFibGVfZ2V0c2V0KGludCBmZCwgYm9v
bCAqb2xkLA0KPiBib29sICpuZXcpDQo+ICAJCSpvbGQgPSB2YWxfYmVmb3JlOw0KPiANCj4gIAlp
ZiAobmV3KSB7DQo+IC0JCWlmIChfX2lndF9zeXNmc19zZXRfYm9vbGVhbihkZXZpY2VfZmQsIGZu
YW1lLCAqbmV3KSkNCj4gLQkJCWlndF9hc3NlcnRfZXEoaWd0X3N5c2ZzX2dldF9ib29sZWFuKGRl
dmljZV9mZCwgZm5hbWUpLA0KPiAqbmV3KTsNCj4gKwkJaWYgKF9faWd0X3N5c2ZzX3NldF9ib29s
ZWFuKHN5c2ZzLCBFVV9ERUJVR19UT0dHTEUsICpuZXcpKQ0KPiArCQkJaWd0X2Fzc2VydF9lcShp
Z3Rfc3lzZnNfZ2V0X2Jvb2xlYW4oc3lzZnMsDQo+IEVVX0RFQlVHX1RPR0dMRSksICpuZXcpOw0K
PiAgCQllbHNlDQo+IC0JCQlyZXQgPSAtMTsNCj4gKwkJCXJldCA9IC1lcnJubzsNCj4gIAl9DQo+
IA0KPiAgb3V0Og0KPiAtCWNsb3NlKGRldmljZV9mZCk7DQo+ICsJY2xvc2Uoc3lzZnMpOw0KPiAN
Cj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiBAQCAtMTg5NiwxMCArMTg5MSwxOCBAQCBvdXQ6DQo+
ICAgKi8NCj4gIGJvb2wgeGVfZXVkZWJ1Z19lbmFibGUoaW50IGZkLCBib29sIGVuYWJsZSkgIHsN
Cj4gKwljaGFyIHN5c2ZzX3BhdGhbUEFUSF9NQVhdOw0KPiAgCWJvb2wgb2xkID0gZmFsc2U7DQo+
ICAJaW50IHJldCA9IF9feGVfZXVkZWJ1Z19lbmFibGVfZ2V0c2V0KGZkLCAmb2xkLCAmZW5hYmxl
KTsNCj4gDQo+IC0JaWd0X3NraXBfb24ocmV0KTsNCj4gKwlpZiAocmV0ID09IC1FTk9FTlQpIHsN
Cj4gKwkJaWd0X2Fzc2VydChpZ3Rfc3lzZnNfcGF0aChmZCwgc3lzZnNfcGF0aCwgc2l6ZW9mKHN5
c2ZzX3BhdGgpKSk7DQo+ICsJCWlndF9za2lwKCInJXMvIiBFVV9ERUJVR19UT0dHTEUNCj4gKwkJ
CSAiJyBzeXNmcyBhdHRyaWJ1dGUgbm90IGZvdW5kLCBFVSBERUJVRyBub3QNCj4gc3VwcG9ydGVk
XG4iLCBzeXNmc19wYXRoKTsNCj4gKwl9DQo+ICsNCj4gKwlpZ3RfYWJvcnRfb25fZihyZXQsICJ4
ZV9ldWRlYnVnX2VuYWJsZTogRmFpbGVkIHRvICVzIGV1ZGVidWdcbiIsDQo+ICsJCSAgICAgICBl
bmFibGUgPyAiZW5hYmxlIiA6ICJkaXNhYmxlIik7DQo+IA0KPiAgCXJldHVybiBvbGQ7DQo+ICB9
DQo+IC0tDQo+IDIuNDcuMQ0KDQo=
