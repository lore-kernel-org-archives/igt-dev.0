Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9110FC3ABD7
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 22:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254FC10E5FB;
	Tue, 13 May 2025 22:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gg8c5pwP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE98010E5FC
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 22:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747176322; x=1778712322;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vqmk+vN0TWZEqlPuF2+u3Nd7jTAGix/Cyhi8I15Cmpk=;
 b=gg8c5pwP6CMQXhztuh6Hlp55ZAyP0mzCWWhdaUacDfYXYa476Sck6LW5
 aboCCyTQSj0freHiYSdg7ElDzN9fFj/LKNa5Q49EOXlZ1r1aPUQN4waXn
 iGR++hFgsUzBKYO+3winl/FTUe8YP04VJYYmNKWx2AGDEJ1iLBCudt/5W
 DMqKzVGq+5Q6JAtUOyCSsyuRXz/gAAT+O6hlaLktzylXTmkP86ZCW3p1B
 6NPzAxD/8GCbV4a/lYstKraUZ+A6NQGaCWuUakTYTVEN/v0G+CY33lkbe
 ee+Ho+iUYCjc5fMhUcQxaDbom7tp9+0UlpUKfyzeSGp4SXbtwsU2zWUrx Q==;
X-CSE-ConnectionGUID: ODrK/YKdTyKJ9sW3Lzj0AQ==
X-CSE-MsgGUID: JYNvkyfgTrOG7WFinFH/xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52860016"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="52860016"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:45:22 -0700
X-CSE-ConnectionGUID: alUfCSsBStKdYGRhQt5llA==
X-CSE-MsgGUID: fn6kJ6++R5WyRmvtxwigvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="138771504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:45:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 15:45:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 15:45:21 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 15:45:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rY1nlddG3kWd8EVqOeQVxAYu5x6SdbwXLzzhgjpN7S+3u8cBmZanw/a2Cj1hnoT/CIILE62cwmIXKjUxIiimjGDUfY/Q5MhxCyueMs578yXpjQOn2YTDK17mJa1YQcrIOONg94R4t/DMNTykkM+QPsb4SPsYR+GT7uNOXaliMCX0hBUiaLRiZyALAVnfQ4l+QHHBAIQ/bQDcKql1mk9JvausKlBaREcVRKUFYUaD8JOThzgXbL2Fjj5Y1fbDDr0scwrJ/zqw1aMvb4eON6darMHNFqCvdiPpaIE5FvPF4ys4noO+GEn/UhkJ6pCSNSkxzmYxghvd7WM42fKiSID3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikgsA1DFC4KDz2TVRMB9ctL+dRkh9CM0IWui5KML5Lg=;
 b=w+OW2DmnUCUCg6CITTkwKcFLvVEN4QwLnikq/Xr63Id+KkBxWXuhtB6qwcrZtIUQU7TOBpKUR3oLBLP0xCaCo+HVpOfrJT/iVQeCkgzLIXYx4x15rn1MoLy26LqDY/O+5HzDVuePmL1mkArBE4Dhi+YWzY7dsCzKUphVK8R9Pjx4HTX+CbQA/5kB5td9x7r11TL2QDszeLQ6tMQLH5Ymelv7oIdjvdGNm1QKv+GJ+w0NVOrV0JPKVojRzWOgCQp8KmUFaXSs67dp0+ePOoyrT6nfQW4yhvyslxtsOMNFczD8M3bIfNLAI1CcusVC3HkPHrokFhgDM6u2rs5t8I5oNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 22:44:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 22:44:47 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the
 prefetch ranges
Thread-Topic: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the
 prefetch ranges
Thread-Index: AQHbxCmMwaAgE0/6w0CM+VMPTTQMlLPRFg+A
Date: Tue, 13 May 2025 22:44:47 +0000
Message-ID: <CH0PR11MB544416917F8F42EA25923B61E596A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
 <20250513170711.14518-4-sai.gowtham.ch@intel.com>
In-Reply-To: <20250513170711.14518-4-sai.gowtham.ch@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB7951:EE_
x-ms-office365-filtering-correlation-id: d95ca527-9881-45b7-e197-08dd926fc367
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?HMPG6Z/9CitidcpHNfxWarVayzkl/IHWXQKgC9sML4VTmqEvghqeyX20fBpF?=
 =?us-ascii?Q?nWJ+AuNw81xcmty2s4XE4VpQRtkcKdpMV5D5L1XbFPLcF22lUde3V8OHTW34?=
 =?us-ascii?Q?i2k/uGTHp1KXa6iprbgw2RLOEycjscvxNb0iRgIFrhWeawj4EwXnPvEVqZBe?=
 =?us-ascii?Q?pL2JfUNPj4x+okRWiokO85Q/lOkj1digJ4yOHyNO+1Z5PBWxzy3Nm7AVRX1E?=
 =?us-ascii?Q?v8gO1zPpCQ++82IriGesfTObx0BrJmTVodaZdQsKXriwRv6pNTUSyKMJlmju?=
 =?us-ascii?Q?xUjGpeXUyH8aH76ggn4aCHD4BhiZ0w9LklxEPCL0ahCW+BWmYsPujZsx0hu0?=
 =?us-ascii?Q?2QQ/4Fl/dkXDjChDY1Jp1W5DonuYaqpbkvraykNtnNjC4bjRicRNUooRc29v?=
 =?us-ascii?Q?a2Xm3Ju4S2ZGMBDP+2P6ZYuI5evH4IQyWR8w99NcZiXrF/UGHUF7BeOGCN8D?=
 =?us-ascii?Q?iJz/3EbsiCs2GpiXu/zZQpPduw79vbrOsrZz4pPv/xUOhAPTUUc30ZVFK11M?=
 =?us-ascii?Q?YYJEDpY9U++y9WEySf1x1QZuQDj9E9H4e2WVtScoDFSjf/EgxqkZMfMI5oIT?=
 =?us-ascii?Q?Z2nIjurb+dRAIUtKb1n6QRe3AdtTnfoQZgCd0KMIcFpXVZ7zYgfpE6/f8g8s?=
 =?us-ascii?Q?WBhV9bCneURIE3imnRQDiKZL4AFEkVgnU1phnk3odG4ATGEjL+U05ppKXcea?=
 =?us-ascii?Q?j4TkdoP4G7Ms3pEFDAVs4AuKENroQt/vQvnNLl35CFdwNWv+b9heTfeBVUUt?=
 =?us-ascii?Q?y3kAi8g6ob8U9tgJpn2vt67BpOz9zxoinEiI1qS5E6iOjL3IDZaUrm8dP5Y6?=
 =?us-ascii?Q?fFr2jgsxvNi5Em4id8GDWlF84naji7xFlaAsx9XoP2IXwDs53dY1QKkXy7e3?=
 =?us-ascii?Q?7LvRIRc+bsqvGBWSJ3UgrXnOfsOuOnP5L43hGXWJi73C684XNIlWWiqe5W5+?=
 =?us-ascii?Q?ckXGrnmTzOVI2WP6WRDDz+WSrFcHbt+Ly6SMtxsD45/FmcDKPIH92Cn3yjP6?=
 =?us-ascii?Q?0Np9fLMC3TAF0My+zfSfhFaiDdnY5ljymNdrRgjYItyfIc6WNNXDl7ptOeUi?=
 =?us-ascii?Q?HDnmBBQ8z1GLkPPkmtjJsHDSRCDc+C/BJAt64peRIBWSkDdCSGGpk0mzy1mK?=
 =?us-ascii?Q?aW99bn9o7GuuFVZOFhjPoMw45ezatQRp/7mGSro1ZICKrxa/b2qvcMf5GAiM?=
 =?us-ascii?Q?reeGcDOZxp6lfBePz2jDOO8Btc4gj0SvDF/560fB+3IOjAmpe7Cg1mFkNTt+?=
 =?us-ascii?Q?3YMGfVLKE9tiDilGhpNi5yO9ijvBLWNRFz9TBAkShVR37ya3aZ+Y5EwmS/cl?=
 =?us-ascii?Q?0VAQI1zW7oipHQ2SXrb8LTb0+fhG2BNUN8DUTGAzSQ1HGhk39TIM275pGFgW?=
 =?us-ascii?Q?CmnQyNrA4gWlNxzKBlm+AGNqnf5Jzx+/m1OXE26N8Z1KTPPs/WII9SYr8xEr?=
 =?us-ascii?Q?DNh6r2OKinV1rf/2IQa2e/Ih4V/li4f024fAxvWfiOuIuMLy/xrkxocc5oXw?=
 =?us-ascii?Q?YpJxDQDdD0smwuw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WoTX1qi0e37X35gCQ1rFND/Bhkvq0KvzCJAjsqbNhgrfSxl9He1VHl2LoPck?=
 =?us-ascii?Q?T+YGUVQrD2JayirMhavjWhJFn7CpPdcnXndHXVFwUwJJ5Zd0fF4K86TktCjc?=
 =?us-ascii?Q?V41uoa+K0J+F+0be4LOxSBcoSDj6r7jGaVGfbP9w/M6Ec+Exub8XFc7EhfF3?=
 =?us-ascii?Q?5i5HsMj4Y3rLkaoDvl8cMPvDw7jFAfp7bZeICnkAx8CoDtFJt6WsS8aoBWKK?=
 =?us-ascii?Q?uxLTAH25GXC/pWQPDu4LHJSUEtmgcxCiU8Gw9+rwU6ID5gL5A671FBD/RQXU?=
 =?us-ascii?Q?plnfK1pjA/hHFW/fNq8Djtz5ZU3T8lTlNWvXO8Bxia9SDq4GQoauSUtKamnd?=
 =?us-ascii?Q?v+DNcXFUpej6ioS4c45VvCtWUZrZ5/w4KzkCbCu/B82IIc2fRyTBuEKK/jKl?=
 =?us-ascii?Q?zc9wP71eNTL1zkVqugRIqDU/0eYrWCvJJNxq38WAMN5RjARr4UiY0JkplgCs?=
 =?us-ascii?Q?J3mIaINAJRca2M5OYgR/fGmOtSYsSOecyWBWBpgMYxl02QYMT7sY2RrFHKuf?=
 =?us-ascii?Q?7Dzzw0EAdM7zs+yEfJzYmDQG58QTERTXQxBfqqtfR3MvNkoY/zbW2B4d+6JY?=
 =?us-ascii?Q?nGQSBi+37++r7udyTbBZuOYmILvKzTEU6vBFJRDFsenkvqhqyTqDRlMJ/YhB?=
 =?us-ascii?Q?uWz60t+DcirN59bUNQ5L9j/7xXLzN+p82njBKfO31nLAVM0yXKCP1fyB7oo3?=
 =?us-ascii?Q?PM4qVZjeX31WC9uFmmZ8ahBd/ST6Wt31AELBUn201TlAzSQLYRUe9scZhNkQ?=
 =?us-ascii?Q?XaFenMMG0JceF4YlOe+dTCDy7KP9KQJX+gOyXutiS5cpuojISwjenlovdMvI?=
 =?us-ascii?Q?Kotf8ngv57H7X0yQ3txIaKaBCrffdmqao/ANaHPfzLwr+eajPZEqifhSI8Bq?=
 =?us-ascii?Q?+OdC5awp4Q6CX46shsbTATq/x+i3EDC22fgQsD0yhjjVPlNWkfvRl3Xv/R69?=
 =?us-ascii?Q?q3zR8ALya4l30ipkM61gZBuk1v0n9k9AJwCedsdYcq2T2RuimRC9dMQyWHKg?=
 =?us-ascii?Q?x2OmijJ35Ps8lcIgigXEA/Xj+7G/gIa2WXR/uvkNkeuXHwJ6apowXPRqF6xC?=
 =?us-ascii?Q?A3jtHqwIOtZbbkcOXou64AGm5gpDIID4p10CgXYx5O3EkcTew/XZhGfOtxBS?=
 =?us-ascii?Q?Sx7NimCUh3U8UuKj5zw/W3VG3Wy3wiaZb1RjOV7B3+CLXuSe6ciGqZRv6nth?=
 =?us-ascii?Q?ISuEcnssmyi39Uuff9lAOGo/qzWBh0B4xvttCoz1z1/e40VVczLduPup1FBv?=
 =?us-ascii?Q?c5kwi6A8BX4jcN7tHgRCg1SmQV3QTqKSDsLk5PaA0SroHeQqHLAmxm5FaYet?=
 =?us-ascii?Q?KPS87IBu/3tXFJcgOPmA4ldH99wEO0Og2cgIWkRGyVbEXZpZ7uLCXLbbStRM?=
 =?us-ascii?Q?IQDT3e94VRLiQEDCNpI+Mkkc0L88dIowPPBsesCfLbUWmTetlGtq9RZDFD/g?=
 =?us-ascii?Q?NJIybk2tnzs2GUi+aFz4fn9uwZPEKJ+qqQMfFh38bmvGTtOM/G5QVEtfmlAj?=
 =?us-ascii?Q?RHRc7oj8S+35sEae0/uK+vjgF5NJ/zU3eUYf6DD1L5GC/LrBOP8QrZDUdyDx?=
 =?us-ascii?Q?CZDPdGW+CDzM4U7hs+g2qJ0b4ISa60z5RMncwKUn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95ca527-9881-45b7-e197-08dd926fc367
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 22:44:47.3531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDZRA9PmBXi1kSlpf9z8iXPlDyFRyMUuGjWJPI9XCaDTV6zBbPITvD+n83aa5yO7N90dMFb/4U2A2oT2qYTUOV9Nr6KDGFOX/0SLVGcGyx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of sai.gowt=
ham.ch@intel.com
Sent: Tuesday, May 13, 2025 10:07 AM
To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham <sai.gowtham.ch@intel.co=
m>; Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthe=
w <matthew.brost@intel.com>
Subject: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the prefe=
tch ranges
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Test rebinds the prefetch ranges to check the ideal behaviour of prefetch=
 mechanisim,

s/mechanism/mechanism

> expecting address ranges in the corresponding mem regions has to be creat=
ed again and
> use those address ranges to submit workloads.
>=20
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 47 +++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec=
_system_allocator.c
> index c3f0e61f3..94907847c 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -484,6 +484,24 @@ static void test_basic(int fd, struct drm_xe_engine_=
class_instance *eci,
>   * Description: Prefetch of mutliple ranges within arg[1] size and check=
 if multiple ranges are created
>   * Test category: functionality test
>   *
> + * SUBTEST: bind-vram-%s
> + * Description: Validate prefetch-smem of size arg[1] by rebinding them =
with prefetch-vram to
> + * 		check the behaviour, ideal behaviour is to migrate ranges
> + * Test category: functionality test
> + *
> + * SUBTEST: bind-smem-%s
> + * Description: Validate prefetch-smem of size arg[1] by rebinding them =
with prefetch-vram
> + * 		check the behaviour, ideal behaviour is to migrate ranges
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-bind-vram-%s
> + * Description: Validate multiple ranges of size arg[1] by binding them =
with multiple ranges at vram
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-bind-smem-%s
> + * Description: Validate multiple ranges of size arg[1] by binding them =
with multiple ranges at smem
> + * Test category: functionality test
> + *
>   * arg[1]:
>   *
>   * @SZ_4K: SZ_4K
> @@ -492,7 +510,7 @@ static void test_basic(int fd, struct drm_xe_engine_c=
lass_instance *eci,
>   */
>  #define MAX_BATCH_DWORDS 16
>  static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
> -		     size_t bo_size, unsigned int flags, int num_dwords)
> +		     size_t bo_size, unsigned int flags, int num_dwords, bool bind)

Rather than adding bind as a boolean flag here, maybe we should add a new f=
lag that
performs the same job?  Since we're borrowing the many_alloc flags section =
anyways, it
could maybe be:

"""
#define VRAM		(0x1 << 5)
#define BIND		(0x1 << 6)
"""

Then, below, instead of checking for the boolean value, we check if "flag &=
 BIND".

Combine this with the advice I gave for the previous patch, and your mode a=
rray
would looks something like:

"""
	const struct mode {
		const char *name;
		unsigned int flags;
		size_t size;
	} mode[] =3D {
		{"smem-SZ_4K", 0, SZ_4K},
		{"smem-SZ_64K", 0, SZ_64K},
		{"smem-SZ_2M", 0, SZ_2M},
		{"vram-SZ_4K", VRAM, SZ_4K},
		{"vram-SZ_64K", VRAM, SZ_64K},
		{"vram-SZ_2M", VRAM, SZ_2M},
		{"bind-smem-SZ_4K", BIND, SZ_4K},
		{"bind-smem-SZ_64K", BIND, SZ_64K},
		{"bind-smem-SZ_2M", BIND, SZ_2M},
		{"bind-vram-SZ_4K", VRAM | BIND, SZ_4K},
		{"bind-vram-SZ_64K", VRAM | BIND, SZ_64K},
		{"bind-vram-SZ_2M", VRAM | BIND, SZ_2M},
		{ NULL },
	};
"""
The nice thing about this approach is that it doesn't necessitate changing =
the
below list of subtests in the "for each mode" loop, as long as you don't mi=
nd
changing the name of the bind subtests from "bind-.*" to "prefetch-bind-.*"=
.
-Jonathan Cavitt

>  {
>  	struct batch_data *data;
>  	uint64_t target_addr;
> @@ -542,6 +560,13 @@ static void prefetch(int fd, struct drm_xe_engine_cl=
ass_instance *eci,
>  	sync[0].addr =3D to_user_pointer(exec_ufence);
>  	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM=
 ? 1 : 0);
>  	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	if (bind) {
> +		exec_ufence[0] =3D 0;
> +		sync[0].addr =3D to_user_pointer(exec_ufence);
> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRA=
M ? 0 : 1);
> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +		exec_ufence[0] =3D 0;
> +	}
>  	exec.exec_queue_id =3D exec_queues;
> =20
>  	for (int i =3D 0; i < num_dwords; i++) {
> @@ -2045,16 +2070,28 @@ igt_main
> =20
>  	for (m =3D mode; m->name; m++) {
>		  igt_subtest_f("prefetch-smem-%s", m->name)
> -		        prefetch(fd, &engine->instance, m->size, 0, 1);
> +		        prefetch(fd, &engine->instance, m->size, 0, 1, 0);
> =20
>		  igt_subtest_f("prefetch-vram-%s", m->name)
> -		        prefetch(fd, &engine->instance, m->size, VRAM, 1);
> +		        prefetch(fd, &engine->instance, m->size, VRAM, 1, 0);
> =20
>		  igt_subtest_f("multi-range-smem-%s", m->name)
> -		        prefetch(fd, &engine->instance, m->size, 0, 10);
> +		        prefetch(fd, &engine->instance, m->size, 0, 10, 0);
> =20
>		  igt_subtest_f("multi-range-vram-%s", m->name)
> -		        prefetch(fd, &engine->instance, m->size, VRAM, 10);
> +		        prefetch(fd, &engine->instance, m->size, VRAM, 10, 0);
> +
> +		igt_subtest_f("bind-vram-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, 0, 1, 1);
> +
> +		igt_subtest_f("bind-smem-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, VRAM, 1, 1);
> +
> +		igt_subtest_f("multi-range-bind-vram-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, 0, 10, 1);
> +
> +		igt_subtest_f("multi-range-bind-smem-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, VRAM, 10, 1);
>          }
> =20
>  	igt_fixture {
> --=20
> 2.34.1
>=20
>=20
