Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F108EC1431
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 11:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF5310E795;
	Tue,  3 Mar 2026 11:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsGpQIux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F15710E795
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772537550; x=1804073550;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mId+7Y5iGHFVX0OIYuSZKPRuCrdYiVpjwoXCTsPuKa0=;
 b=VsGpQIuxu+HvcTBm4buMGs5pXj7Z42nWSLQ/bk/o8QAHPSjd3zGWB2Iq
 zslnSjmBwTqwDIpcYPTaB1E4X3EpC5dgzpV8CbGy4O1h097ViCU63lL8p
 XKUBS8KEN4hHHsriM8U2eiODw/WgYbZbu2aml0Z7L7Zf17iWi6la2ujLe
 e0aw3EXTQd9HERP8nAEpVC5ys4fjJEupiR1GnI2/hpaaSZB6Yq4kA6p4o
 EpgFufZSf2q6X3BHyzksTcfKqXNt/snGKgxIE15PXncJxyesAOmWgGgUS
 iUXvbEmUnmpxNWBYp0LCB/vn74p5hFW8tj6CA7jBej+ZrqqUsZqFSNdUw w==;
X-CSE-ConnectionGUID: d0ufWHtERVyxuGjZ03MjWg==
X-CSE-MsgGUID: PNIsLim+TX6o3Oqyk1dsRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="96181511"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="96181511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 03:23:33 -0800
X-CSE-ConnectionGUID: CTWlG+9GRZu7vVhTmVPfZA==
X-CSE-MsgGUID: MG8SuBhZTzC/cUCc86MMlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222974335"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 03:23:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 03:23:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 03:23:32 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 03:23:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yeradxpk1tFjPu0YVtkDGNBR8FQ5N+tlpMbsAl1iF4AQi5r02kFTCh135U6XKsoAy1ugcBlJ49cU2OjiyynRcue3xfWed/ZsVyXRzEeeKWVcgXrRJEDDzUpSBIoLc4j9qjJPvYAFK3J3YYI9a1PRbBjlzh4GxNz6RUwkbVfzjIMZoIPXgRBWO+w28IxTBkuDgTMOyHQE+cGYkdvYnCWXHVBatpdWUxU2pHyA/605gC7NzQ2szUZrDQ1TrG9GfZIcKG7iOHRliu+Q1S6tjDNWaDCTqMToFLPeaEcea6wLYyryE8NwiK5oKRyJM24JoRpGKckRfHJk/DffwJcgyMFCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mId+7Y5iGHFVX0OIYuSZKPRuCrdYiVpjwoXCTsPuKa0=;
 b=MKrrFdWDURivZYT3xWFnr/61AkGkDVPzXjYL2G6aziaEA7Zyulh1xYSGK1k+TXjF/FLfk7g0V05GQU1X8BwC87T/MIEAj5sbqV002JENWBUpmfDWG4DJXaxFgCWWUe1yXdZKxSF6AzenrAsUc7nzpQey/EsQxSalHdtHFH4HHoiMC9PoG9vPb0RZdowUAjB59wVbcXfU/WDXApmIKD1/lakM4EN2j7q209J+8pNOMELge7YJ4T3H0+Nf2J3k5F3uya+RVGeR55KUOehwNASRJ4R5r+tk6183DT1jo0CH/zLEYuoczlkTw1znl4dF1fH3GEpBZlyCKGOqLL5XfGi6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by LV8PR11MB8771.namprd11.prod.outlook.com (2603:10b6:408:206::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 11:23:30 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%3]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 11:23:29 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] lib/intel_pat: Handle platforms without compressed PAT
 index
Thread-Topic: [PATCH] lib/intel_pat: Handle platforms without compressed PAT
 index
Thread-Index: AQHcoMMWrml9ttl4fUS87m0IAi6uZbWcpJMwgAALhwCAAA6joA==
Date: Tue, 3 Mar 2026 11:23:29 +0000
Message-ID: <BL1PR11MB5525641EFD8BDFFE934FAFEA847FA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260218103608.2015045-2-sanjay.kumar.yadav@intel.com>
 <BL1PR11MB552518C35C193641C8AC3DB9847FA@BL1PR11MB5525.namprd11.prod.outlook.com>
 <cc6fb449-b15d-4f56-b2c2-4ac7f391b7af@intel.com>
In-Reply-To: <cc6fb449-b15d-4f56-b2c2-4ac7f391b7af@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|LV8PR11MB8771:EE_
x-ms-office365-filtering-correlation-id: 0617bb47-79e9-4c9a-cc2d-08de79174bfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: fjilrwnXzRDiuoaFCSwlOOIR2lNJooHCtw8MOuuK0EnLuVx+V8B1igTYPgBmck/Rt1GInUlaAnefuODZfgryZcfKQIy1GeZaReyAWaqV0Yl99EbFlJMgbwsh1fYCh+ZcxlfU1yZCN26zYP7gPtXQcbGzkeCBHaNBNVoxrDk8FAyLZt8Al7XRYRA/HZGvY2ASBgADnCW4PgiggAbjMznxTeVN5Izv6EdMpoSwzMcPs31Jvi83C9K9hUG40Js8b3B9v7YBCbvpNE8AmtNQStAPklgVre0NPn+9nO3W5FRar8Om/fgdbr2a2wXep7ugnhrsyym/rSiRQH0kCMZ19CyM6LcaLGHQto4BfAjZhEgB/Ol3mn2XzcIr1MRp1DtNRvNFIyL0e369wE1PgOf6W0tBQaJqpeZTslC9+pWZgcriJ/ya3ZUXgF6eY3a9ukstC1qTOhb7nNePoDLuI8cyfe3X1Eoekl6kHwlRSCLle0ypLXDUrA40mn+gxKUlpEpAwSZyneDP510iU/T5/qAoTR2NIS+rOo86I0UCOLoLaVYM4ZXk81BJFbm9vcs17v1XEspB8oJEK7fhqevqR/NS5YVTmNHuONqAZqrTGgvkZ7HipXIP5UESHIQ3qZfY0aUIL9/BLpM287GQabYgHsiqGnpIKBtYioFy0b3ztR+w16K2cMG2ZaVFBglj0UeMPrSHB+yAK/HFrtBV2jTcqd9JX4vs9wnE7dumXLX58Z3tkp/as0JNtbddhjOyWVsDQbQ03wq14+bqsdn0Qs54rZp8bnGalRQAYmPflCGRYP5Qn1msIIs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anRYWHAxR0pnOCtseXM1a3UrcGp1OGRldS9hSUQwaENObUxBQlhNMVpmdkRR?=
 =?utf-8?B?cEFWQTBLNU9xbWNqbC9GWVJmdXE0VDd5L0NWUWpTU0RIaktYQjlHSVJ3RFQ3?=
 =?utf-8?B?a0dMdTc1Sk1aS3RzclNXa3M2MGNuY1dJQTN0YWM0MlNOYUIyZHBneDIzeWNv?=
 =?utf-8?B?RU9kekRVQ0s4UlIwZDdIbEFCTzdZK1k5QllTaG94VHl2ZGlnSjczei9xeW00?=
 =?utf-8?B?RDNjdG1WdjNROUNKWHc4TDA5TDFHREZZRkkzeTR3b1RWRWFnY1pkNlBEQVRG?=
 =?utf-8?B?WGwzcDZGdlRMSW8wclR4b2lsZ0VhOHdkblcxMVR4QVFDRDJKcEgyNngzR3lQ?=
 =?utf-8?B?UWcrczlYQXljcXNKT3FMdTFhaUx2OU9YMHNuYlcyMmQvZkZyOE9kWWZjSmV5?=
 =?utf-8?B?L1NCaDBMUkZYZS9tRE9BM3AyZGR4MTMyNHJDSHNtR1ByQ0ppRGwzRzY3T0V5?=
 =?utf-8?B?L3BTRng3cWZYUC85R3FLd0tjL1BJYmtvOG9wRFNCV2xhVWVvNEhpSW53RjBv?=
 =?utf-8?B?UTRuZ1J5enRhUE4wQ3d5YmY5VGhhZTJxbTMybktNN1BxbXBURFN4enlyUVN0?=
 =?utf-8?B?c2lwU28xb1k5dFFUL3lOY09nM1JuMkZaVU1vVzVjdnJNY0xERHlIcXR1N2pq?=
 =?utf-8?B?TGtYTnkrTmlCMm1VamlrYzYrZ2JtMzZmM29USkk4VTZuV2VpbFpDZGs0NGJQ?=
 =?utf-8?B?bGFUdERpRW41SU84aXc2TGVHOUphZDdtOVUrM1lFR1dXKzhTMVczRE0vcEVa?=
 =?utf-8?B?d25RUm5VQk1wZnpKZmpTRi9pVWZMRkZTT1VhU0Q0WHRzOXc0ZU1WU1VCRVFh?=
 =?utf-8?B?akxucGFjZzloSVF5RndyZlBHeGkyU3lmN3FsM2dUNzd0YkFzMDF6dmhVL0ZN?=
 =?utf-8?B?RWdiTmZxZWp2M2Q1NzVJREhpMDByZGgrS3dQWEJhRFh3YnY4WHljWklSdFdM?=
 =?utf-8?B?V1BxWkxZT0NTemVVSGFHSVhEc0RGKzhGempoNG0yQTZYbkVWYUlGZ0MrMFpW?=
 =?utf-8?B?MmF5OFd6NWdwUmpmVXl3b3luMjFMY2JGSkFGMm1ZRjhzMjJMcU5Qa0RML1BT?=
 =?utf-8?B?MGtxLytTQStJdXNSRHhLbzlrYlc2QWJCNHJvNHlpL01uS1dXNnRXdkRndUFY?=
 =?utf-8?B?R2g3aUsyME41L1hEUVhVTnB2U3RHWkRjVmtGejdqOG5Uc3hTVmt4RXU1OXpz?=
 =?utf-8?B?L09SVERqSDBxWUJ4R2hjR3BIMFRmU29tL1dnWTd6VDY1Z01uT2hLcXRNcUV4?=
 =?utf-8?B?QjgzQ1NIdGt1MFJPUk93TFVITWREenpRUXA5YjhaS01VRXVaZnlocnlyOStz?=
 =?utf-8?B?YmpraFo4d3pUODhDZ29SbTZHN0lWcnN0YmttY0JGTGZQRXZQN3J5bzk4UTJM?=
 =?utf-8?B?b0ptcEpvTUJ0NVBSell1V2ZYUFV3SzRIMTB3dkFGazliVkI2L0lVNUtwSEZE?=
 =?utf-8?B?a0Njbk9RYktOY1pXTW13S2dBV2F0Z08rTGN3bFNvbkxKR09ZSzN1NmVxNmtE?=
 =?utf-8?B?bHJ3QTBlYWVrRlFYbm4vUnRPTWlndmNKdDZsVXZhZ3V0b3VwTmoyUUpqTDF0?=
 =?utf-8?B?NHdoM0tLTWhLemJ1OVB6ZUhTMWNoNksyVTliWHRGUVoxYVVGSVhCSXdmR0s2?=
 =?utf-8?B?eGszUTIxOHZSbXRWVmhoN0g3b1ZhTm16M3dtaXEyZjJEUVpqd0VsTEUwQjhV?=
 =?utf-8?B?bWdrR05zUGZYQ29raGoxVjNxejV0UXFoUy9oNE81am15cGhQd2NkY0RxOVBa?=
 =?utf-8?B?eGtSYnpBUTFuZFFwYmp3cnFWbDVnR2puSnN3Wll6Zkd3QUk0VEJibkg1UHlz?=
 =?utf-8?B?ZEFqTXl0bU5pR0ljZkd6VVNnMXJVVFEydENzRm9jUDRtNzk2STRKcWVBRkdz?=
 =?utf-8?B?WlZDcEw4Y1JCZUpQM1hZa3cyd3hRZWNzSW5KMDk4aTkzdDhwWXVyblpuaVB6?=
 =?utf-8?B?ZUJlUGdDdnR3Y0h1K3dxM2hzRVhmQVQyU21WTUR4NkNBQTVyb1FNblo4Y016?=
 =?utf-8?B?NHFtLzgvOWtOalVOaWJrTGhYc1FXaXFqTEZUbzV4bVF3RmtkSm5peFQvSkNI?=
 =?utf-8?B?QTlBRFJzWndXeEtoY3B5Rm8xZDIvYWJZdVhSRmlKSEtodjhoR3RianZsdGdI?=
 =?utf-8?B?RTRXUnhDUjl6d3FUVENQVkZtd1htYXhOeVEyN0RsNU52VDVxTEk3ejJKZUp1?=
 =?utf-8?B?aW90UnZFUmxSbmZUUWM0S1oydFpPZlNQbllkSExOaXFWdlpqM0Q3QWpkOHBT?=
 =?utf-8?B?bHJpamFON3ZmSnQ4NUg2TytWSENMcEVqaFFkdm9lbFBXZWpCWktianQyZVNB?=
 =?utf-8?B?bDIrRHVBMitKMWVhNU90KzhSQVRoTklWb3p1WndERXM5V1BZeXM4UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HzQk8BNPe1gofsWAebwZ6Z/fL0RTtyGWVGjWp5mNVX/SZld6RR5o6HQ+mEeK30cRqxFR2DtyF3RF3Xi3I+Nb+uSS2Ktlzi1W57HJAB2TKGTS+V+JKMS8A4bqi9V/oeD18BnAqxC5lO3eYozLBhl70Hnyskb7tN6fmZuqmp5e/B4wFniPmI/IErqkyMD/Q5UvAInxIApLTT/6QQpe7rAPm2+7Vv9szTWWFIl/+Ycjt0BW/W06PY2WXMjTp868tiZ88Q6emPmVwvN8XZMFk3xvhTabMtqlQcaKlG9O6ZlRrTKl+ZrnD8tLCNJK6aRMvqjuO+arYjLv6t+5akrucLec/Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0617bb47-79e9-4c9a-cc2d-08de79174bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 11:23:29.8779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P+ySvBCH+FThj8XcrWldIqlL3ck7z4YDC48KA2T2ZVrYH36RZbSJZVicRZbTILUgil9SNEvpvpUO20A/x9r3m72bREy59wHLMP36rgCeXPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8771
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFkYXYsIFNhbmpheSBL
dW1hciA8c2FuamF5Lmt1bWFyLnlhZGF2QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgMyBN
YXJjaCwgMjAyNiAwNDowMSBQTQ0KPiBUbzogR3VycmFtLCBQcmF2YWxpa2EgPHByYXZhbGlrYS5n
dXJyYW1AaW50ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBBdWxkLCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIXSBsaWIvaW50ZWxfcGF0OiBIYW5kbGUgcGxhdGZvcm1zIHdpdGhvdXQgY29tcHJlc3Nl
ZCBQQVQNCj4gaW5kZXgNCj4gDQo+IA0KPiBPbiAwMy0wMy0yMDI2IDE1OjIwLCBHdXJyYW0sIFBy
YXZhbGlrYSB3cm90ZToNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
PiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBP
biBCZWhhbGYgT2YNCj4gPj4gU2FuamF5IFlhZGF2DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgMTgg
RmVicnVhcnksIDIwMjYgMDQ6MDYgUE0NCj4gPj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+ID4+IENjOiBBdWxkLCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0K
PiA+PiBTdWJqZWN0OiBbUEFUQ0hdIGxpYi9pbnRlbF9wYXQ6IEhhbmRsZSBwbGF0Zm9ybXMgd2l0
aG91dCBjb21wcmVzc2VkDQo+ID4+IFBBVCBpbmRleA0KPiA+Pg0KPiA+PiBQcmV2aW91c2x5IGlu
dGVsX2dldF9wYXRfaWR4X3VjX2NvbXAoKSB3b3VsZCBzaWxlbnRseSByZXR1cm4gemVybyBvbg0K
PiA+PiBwbGF0Zm9ybXMgd2hlcmUgbm8gY29tcHJlc3NlZCBQQVQgaW5kZXggZXhpc3RzIChlLmcu
IENSSSksIHNpbmNlDQo+ID4+IHVjX2NvbXAgd2FzIHplcm8taW5pdGlhbGl6ZWQgYnkgZGVmYXVs
dC4gVGhpcyBjb3VsZCBsZWFkIHRvIGluY29ycmVjdA0KPiA+PiBiZWhhdmlvciB3aGVuIGNhbGxl
cnMgYXNzdW1lIHRoZSByZXR1cm5lZCBpbmRleCBpcyB2YWxpZC4NCj4gPj4NCj4gPj4gRml4IHRo
aXMgYnk6DQo+ID4+IC0gQWRkaW5nIFhFX1BBVF9JRFhfSU5WQUxJRCBzZW50aW5lbCB0byBkZXRl
Y3QgdW5zdXBwb3J0ZWQgcGxhdGZvcm1zDQo+ID4+IC0gSW5pdGlhbGl6aW5nIHVjX2NvbXAgdG8g
WEVfUEFUX0lEWF9JTlZBTElEIGluIGludGVsX2dldF9wYXRfaWR4KCk7DQo+ID4+ICAgIG9ubHkg
cGxhdGZvcm1zIHdpdGggQ0NTIChncmFwaGljc192ZXIgMjAvMzApIG92ZXJyaWRlIGl0IHRvIGEg
dmFsaWQNCj4gPj4gICAgaW5kZXgNCj4gPj4gLSBBZGRpbmcgaWd0X2Fzc2VydF9mKCkgaW4gaW50
ZWxfZ2V0X3BhdF9pZHhfdWNfY29tcCgpIHRvIGZhaWwgd2l0aA0KPiA+PiAgICBhIGNsZWFyIGVy
cm9yIGluc3RlYWQgb2YgcmV0dXJuaW5nIGFuIGludmFsaWQgaW5kZXgNCj4gPj4NCj4gPj4gQWxz
byB1cGRhdGUgdGhlIGJvLWNvbXAtZGlzYWJsZS1iaW5kIHRlc3QgdG8gZGlzdGluZ3Vpc2ggYmV0
d2VlbiAiQ0NTDQo+ID4+IGlzIGRpc2FibGVkIiBhbmQgIkNDUyBkb2VzIG5vdCBleGlzdCIgdXNp
bmcgSEFTX0ZMQVRDQ1MoKS4gT24NCj4gPj4gcGxhdGZvcm1zIHdpdGhvdXQgQ0NTLCB0aGUgY29t
cHJlc3NlZCBQQVQgYmluZCBjaGVjayBpcyBza2lwcGVkIHNpbmNlDQo+ID4+IHRoZXJlIGlzIG5v
IHZhbGlkIGNvbXByZXNzZWQgUEFUIGluZGV4IHRvIHRlc3Qgd2l0aC4NCj4gPj4NCj4gPj4gU3Vn
Z2VzdGVkLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+ID4+IFNp
Z25lZC1vZmYtYnk6IFNhbmpheSBZYWRhdiA8c2FuamF5Lmt1bWFyLnlhZGF2QGludGVsLmNvbT4N
Cj4gPj4gLS0tDQo+ID4+ICAgbGliL2ludGVsX3BhdC5jICAgICAgfCAgNSArKysrKw0KPiA+PiAg
IGxpYi9pbnRlbF9wYXQuaCAgICAgIHwgIDEgKw0KPiA+PiAgIHRlc3RzL2ludGVsL3hlX3BhdC5j
IHwgMzAgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ID4+ICAgMyBmaWxlcyBjaGFu
Z2VkLCAyOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0t
Z2l0IGEvbGliL2ludGVsX3BhdC5jIGIvbGliL2ludGVsX3BhdC5jIGluZGV4DQo+ID4+IDk4MTVl
ZmMxOC4uZDMwYmVlNDUzDQo+ID4+IDEwMDY0NA0KPiA+PiAtLS0gYS9saWIvaW50ZWxfcGF0LmMN
Cj4gPj4gKysrIGIvbGliL2ludGVsX3BhdC5jDQo+ID4+IEBAIC05OCw2ICs5OCw4IEBAIHN0YXRp
YyB2b2lkIGludGVsX2dldF9wYXRfaWR4KGludCBmZCwgc3RydWN0DQo+ID4+IGludGVsX3BhdF9j
YWNoZSAqcGF0KSAgew0KPiA+PiAgIAl1aW50MTZfdCBkZXZfaWQgPSBpbnRlbF9nZXRfZHJtX2Rl
dmlkKGZkKTsNCj4gPj4NCj4gPj4gKwlwYXQtPnVjX2NvbXAgPSBYRV9QQVRfSURYX0lOVkFMSUQ7
DQo+ID4+ICsNCj4gPj4gICAJaWYgKGludGVsX2dyYXBoaWNzX3ZlcihkZXZfaWQpID09IElQX1ZF
UigzNSwgMTEpKSB7DQo+ID4+ICAgCQlwYXQtPnVjID0gMzsNCj4gPj4gICAJCXBhdC0+d2IgPSAy
Ow0KPiA+PiBAQCAtMTU1LDggKzE1NywxMSBAQCB1aW50OF90IGludGVsX2dldF9wYXRfaWR4X3Vj
X2NvbXAoaW50IGZkKQ0KPiA+PiAgIAl1aW50MTZfdCBkZXZfaWQgPSBpbnRlbF9nZXRfZHJtX2Rl
dmlkKGZkKTsNCj4gPj4NCj4gPj4gICAJaWd0X2Fzc2VydChpbnRlbF9nZW4oZGV2X2lkKSA+PSAy
MCk7DQo+ID4+ICsJaWd0X2Fzc2VydChIQVNfRkxBVENDUyhkZXZfaWQpKTsNCj4gPj4NCj4gPj4g
ICAJaW50ZWxfZ2V0X3BhdF9pZHgoZmQsICZwYXQpOw0KPiA+PiArCWlndF9hc3NlcnRfZihwYXQu
dWNfY29tcCAhPSBYRV9QQVRfSURYX0lOVkFMSUQsDQo+ID4+ICsJCSAgICAgIk5vIGNvbXByZXNz
ZWQgUEFUIGluZGV4IGF2YWlsYWJsZSBvbiB0aGlzIHBsYXRmb3JtXG4iKTsNCj4gPj4gICAJcmV0
dXJuIHBhdC51Y19jb21wOw0KPiA+PiAgIH0NCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2xpYi9p
bnRlbF9wYXQuaCBiL2xpYi9pbnRlbF9wYXQuaCBpbmRleA0KPiA+PiBlOWFkZTJlMmUuLmU1ZGQ4
YTBhZg0KPiA+PiAxMDA2NDQNCj4gPj4gLS0tIGEvbGliL2ludGVsX3BhdC5oDQo+ID4+ICsrKyBi
L2xpYi9pbnRlbF9wYXQuaA0KPiA+PiBAQCAtMTAsNiArMTAsNyBAQA0KPiA+PiAgICNpbmNsdWRl
IDxzdGRpbnQuaD4NCj4gPj4NCj4gPj4gICAjZGVmaW5lIERFRkFVTFRfUEFUX0lOREVYICgodWlu
dDhfdCktMSkgLyogaWd0LWNvcmUgY2FuIHBpY2sgMXdheQ0KPiA+PiBvciBiZXR0ZXIgKi8NCj4g
Pj4gKyNkZWZpbmUgWEVfUEFUX0lEWF9JTlZBTElEICgodWludDhfdCktMikgLyogbm8gc3VjaCBQ
QVQgaW5kZXggb24NCj4gPj4gK3RoaXMgcGxhdGZvcm0gKi8NCj4gPj4gICAjZGVmaW5lIFhFX1BB
VF9NQVhfRU5UUklFUyAzMg0KPiA+Pg0KPiA+PiAgIHN0cnVjdCB4ZV9wYXRfZW50cnkgew0KPiA+
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfcGF0LmMgYi90ZXN0cy9pbnRlbC94ZV9wYXQu
YyBpbmRleA0KPiA+PiAyMTU0N2M4NGUuLjA1MmI3YjY5OSAxMDA2NDQNCj4gPj4gLS0tIGEvdGVz
dHMvaW50ZWwveGVfcGF0LmMNCj4gPj4gKysrIGIvdGVzdHMvaW50ZWwveGVfcGF0LmMNCj4gPj4g
QEAgLTg0NCwxNSArODQ0LDE4IEBAIHN0YXRpYyBib29sIGhhc19ub19jb21wcmVzc2lvbl9oaW50
KGludCBmZCkNCj4gPj4gICAgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4g
Pj4gICAgKiBEZXNjcmlwdGlvbjogVmFsaWRhdGVzIHRoYXQgYmluZGluZyBhIEJPIGNyZWF0ZWQg
d2l0aA0KPiA+PiAgICAqIHRoZSBOT19DT01QUkVTU0lPTiBmbGFnIHVzaW5nIGEgY29tcHJlc3Nl
ZCBQQVQgaW5kZXggZmFpbHMNCj4gPj4gLSAqIHdpdGggLUVJTlZBTCBvbiBYZTIrIHBsYXRmb3Jt
cy4NCj4gPj4gKyAqIHdpdGggLUVJTlZBTCBvbiBYZTIrIHBsYXRmb3Jtcy4gT24gcGxhdGZvcm1z
IHdoZXJlIENDUw0KPiA+PiArICogZG9lcyBub3QgZXhpc3QsIHRoZSB0ZXN0IHZlcmlmaWVzIHVu
Y29tcHJlc3NlZCBhY2Nlc3Mgd29ya3MuDQo+ID4+ICAgICovDQo+ID4+DQo+ID4+ICAgc3RhdGlj
IHZvaWQgYm9fY29tcF9kaXNhYmxlX2JpbmQoaW50IGZkKSAgew0KPiA+PiAgIAlzaXplX3Qgc2l6
ZSA9IHhlX2dldF9kZWZhdWx0X2FsaWdubWVudChmZCk7DQo+ID4+IC0JdWludDhfdCBjb21wX3Bh
dF9pbmRleCwgdW5jb21wX3BhdF9pbmRleDsNCj4gPj4gLQlib29sIHN1cHBvcnRlZDsNCj4gPj4g
Kwl1aW50MTZfdCBkZXZfaWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKGZkKTsNCj4gPj4gKwlib29s
IGhhc19mbGF0Y2NzID0gSEFTX0ZMQVRDQ1MoZGV2X2lkKTsNCj4gPj4gKwl1aW50OF90IHVuY29t
cF9wYXRfaW5kZXg7DQo+ID4+ICAgCXVpbnQzMl90IHZtLCBibzsNCj4gPj4gKwlib29sIHN1cHBv
cnRlZDsNCj4gPj4gICAJaW50IHJldDsNCj4gPj4NCj4gPj4gICAJc3VwcG9ydGVkID0gaGFzX25v
X2NvbXByZXNzaW9uX2hpbnQoZmQpOyBAQCAtODY4LDE0ICs4NzEsMjUNCj4gQEANCj4gPj4gc3Rh
dGljIHZvaWQgYm9fY29tcF9kaXNhYmxlX2JpbmQoaW50IGZkKQ0KPiA+PiAgIAlpZ3RfYXNzZXJ0
X2VxKHJldCwgMCk7DQo+ID4+ICAgCXZtID0geGVfdm1fY3JlYXRlKGZkLCAwLCAwKTsNCj4gPj4N
Cj4gPj4gLQljb21wX3BhdF9pbmRleCA9IGludGVsX2dldF9wYXRfaWR4X3VjX2NvbXAoZmQpOw0K
PiA+PiAgIAl1bmNvbXBfcGF0X2luZGV4ID0gaW50ZWxfZ2V0X3BhdF9pZHhfdWMoZmQpOw0KPiA+
Pg0KPiA+PiAtCWlndF9hc3NlcnRfZXEoX194ZV92bV9iaW5kKGZkLCB2bSwgMCwgYm8sIDAsIDB4
MTAwMDAwLA0KPiA+PiAtCQkJCSAgIHNpemUsIDAsIDAsIE5VTEwsIDAsDQo+ID4+IC0JCQkJICAg
MCwgY29tcF9wYXRfaW5kZXgsIDApLA0KPiA+PiAtCQkgICAgICAtRUlOVkFMKTsNCj4gPj4gKwkv
Kg0KPiA+PiArCSAqIE9uIHBsYXRmb3JtcyB3aXRoIENDUywgYmluZGluZyBhIE5PX0NPTVBSRVNT
SU9OIEJPIHdpdGggYQ0KPiA+PiArCSAqIGNvbXByZXNzZWQgUEFUIGluZGV4IG11c3QgZmFpbC4g
T24gcGxhdGZvcm1zIHdpdGhvdXQgQ0NTLA0KPiA+PiArCSAqIHRoZXJlIGlzIG5vIHZhbGlkIGNv
bXByZXNzZWQgUEFUIGluZGV4LCBzbyBza2lwIHRoaXMgY2hlY2suDQo+ID4+ICsJICovDQo+ID4+
ICsJaWYgKGhhc19mbGF0Y2NzKSB7DQo+ID4+ICsJCXVpbnQ4X3QgY29tcF9wYXRfaW5kZXggPSBp
bnRlbF9nZXRfcGF0X2lkeF91Y19jb21wKGZkKTsNCj4gPj4gKw0KPiA+PiArCQlpZ3RfYXNzZXJ0
X2VxKF9feGVfdm1fYmluZChmZCwgdm0sIDAsIGJvLCAwLCAweDEwMDAwMCwNCj4gPj4gKwkJCQkJ
ICAgc2l6ZSwgMCwgMCwgTlVMTCwgMCwNCj4gPj4gKwkJCQkJICAgMCwgY29tcF9wYXRfaW5kZXgs
IDApLA0KPiA+PiArCQkJICAgICAgLUVJTlZBTCk7DQo+ID4+ICsJfSBlbHNlIHsNCj4gPj4gKwkJ
aWd0X2RlYnVnKCJQbGF0Zm9ybSBoYXMgbm8gQ0NTLCBza2lwcGluZyBjb21wcmVzc2VkIFBBVA0K
PiA+PiBiaW5kIGNoZWNrXG4iKTsNCj4gPj4gKwl9DQo+ID4gRG9lcyB0aGlzIHRlc3QgbmVlZHMg
dG8gYmUgc2tpcHBlZCBoZXJlPyBJZiB5ZXMgeW91IG5lZWQgdG8gdXNlDQo+ID4gaWd0X3NraXAg
QW5kIGhhbmRsZSB0aGUgcmVzb3VyY2UgY2xlYW51cA0KPiBOby4gVGhlIHRlc3Qgc3RpbGwgaGFz
IGEgdmFsaWQgcG9zaXRpdmUgcGF0aCBvbiBwbGF0Zm9ybXMgd2l0aG91dCBDQ1M6DQo+IGl0IHZl
cmlmaWVzIHRoYXQgYmluZGluZyB3aXRoIHRoZSB1bmNvbXByZXNzZWQgUEFUIGluZGV4IHN1Y2Nl
ZWRzLiBPbmx5IHRoZQ0KPiBjb21wcmVzc2VkLXBhdGggYXNzZXJ0aW9uIGlzIG5vdCBhcHBsaWNh
YmxlIHdoZW4gSEFTX0ZMQVRDQ1MoZGV2X2lkKSBpcw0KPiBmYWxzZSwgc28gSSBrZXB0IHRoZSB0
ZXN0IHJ1bm5pbmcgYW5kIGFkZGVkIGEgZGVidWcgbG9nIHRvIG1ha2UgdGhhdCBleHBsaWNpdC4N
Cj4gU2tpcHBpbmcgdGhlIHRlc3Qgd2l0aCBpZ3Rfc2tpcCB3b3VsZCBkcm9wIHRoYXQgY292ZXJh
Z2UuDQo+IA0KUmV2aWV3ZWQtYnk6IFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1A
aW50ZWwuY29tPg0KPiA+PiArCS8qIFVuY29tcHJlc3NlZCBiaW5kIG11c3QgYWx3YXlzIHN1Y2Nl
ZWQgKi8NCj4gPj4gICAJaWd0X2Fzc2VydF9lcShfX3hlX3ZtX2JpbmQoZmQsIHZtLCAwLCBibywg
MCwgMHgxMDAwMDAsDQo+ID4+ICAgCQkJCSAgIHNpemUsIDAsIDAsIE5VTEwsIDAsDQo+ID4+ICAg
CQkJCSAgIDAsIHVuY29tcF9wYXRfaW5kZXgsIDApLA0KPiA+PiAtLQ0KPiA+PiAyLjUyLjANCg==
