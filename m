Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F1DC2D0CD
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 10:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBED8112290;
	Wed, 21 May 2025 10:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYIH0k1J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CA5112288
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 10:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747824605; x=1779360605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=peN81qmbeC/NYYwjO7NtO+P5kuraBQwosSqnJa1N+s0=;
 b=TYIH0k1JQ4cA+ln3dORwLKdzu50ArZeB9uAFhgU0QSvLRvCjSKMKWdw5
 bjLuq3Zhg/w8ACcO2Q45xcf2Elrx+IviG81VSG73kj9e+M7STvzfeVNko
 ryGPm6GqgJGaCnbnXRf2eZdzALVhAnElh3/Eq5MLxvwSS+ozEPxI2Gfwo
 1lm6KzhP8vFMVJXmUiGAZ9SLmQTZigvrdZF1hckxK0IJZDRXLkZrpNHWZ
 CEWBA8ymAdlUZan+XtymahsneT64aNgsIzK9CiikO1xI0FNBidROWcjQQ
 I6qQ0QcdOnfgyEav4JFKkmyOQn0sfOoI+YJMWCy7cigMKxhHEAnt/ORFP Q==;
X-CSE-ConnectionGUID: cjISoimXQdihxEGMs4BJ1A==
X-CSE-MsgGUID: K5xjaqJHQDmMU/Eun5fwNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52422626"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="52422626"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 03:50:05 -0700
X-CSE-ConnectionGUID: lblb8aHGSpi3GWBaZSY/bA==
X-CSE-MsgGUID: 4HICVx0LSyOTetvZIHCxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140083348"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 03:50:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 03:50:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 03:50:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 03:50:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyDmJudsoZJzqZTBB2Yz+76FL0d4+qTXZaIIbCZDVPx1ve5LnBauN8DvNj/OPYUufWD42DxEavT5AdESu2ruckNe8HGNT2GwExz74GHmyTVRMPTav6Q0+2KqQUr5VlCuzJ+sSXE0b/BvsNA8V6zxVDqB04tx9hpPmVTNLnx2/bErFMwFnzP3g9gz1iy8Gyek2hEZJMdnkPHwJyJCoHJZHyx88kWK5R+rnvCOH80oXRRG7qxA1uEs8sfF5P2+s0mAPdlO6rTLBE2S2wGB5Q57GlewEIPRXNiJNwrHO6oK1vRfnaiBgbV9Vz0oXJUOHnA4mCx9IsQOa+NVR+2qnWYVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sp+a3L0O5dy2ye3MGDhwyQWaIIuw2pSF3Ge2JEqqJMU=;
 b=IFBbH+YJQaQsbUh/t3FuH5WFgFMO+deV+LTfPYkGRU+hMHPf4GODMgGi4ZRUDQoQO9Z6wfw6ymKF0uwMYBvbKslcVmziNiaZNOr7OlZRTe6L/2NLJ1pXjIgQGN+QUmcT4kkTEPNTrqjxiAnZfLPHKsfisUCFDVOGRv/XqMTINPmATP/x9AL7s+VVR0LGmXicDUn66lnXdhvwAbBELx+hy+SJ0A9WwpvexBHM7hmzGtcOG+9Bi5R0ajOaIgTwtIz+7jfbU7teM7b0DxJo0hgqZJPFEPAgh0+9rXaeNsBK+EPv0pQzCsTG23tAd3HuHrCQhcrrsJy+KXhUFpw5V7Z1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 10:49:47 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 10:49:47 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] lib/kms: Add secondary sort key (vrefresh) to DRM
 mode sorting func()
Thread-Topic: [PATCH i-g-t] lib/kms: Add secondary sort key (vrefresh) to DRM
 mode sorting func()
Thread-Index: AQHbyhy/cD2FGja+KkqgtudErC58LLPc5OBw
Date: Wed, 21 May 2025 10:49:47 +0000
Message-ID: <PH7PR11MB60535AE2BAA9886B2E33081CE79EA@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250521065027.1400461-1-swati2.sharma@intel.com>
In-Reply-To: <20250521065027.1400461-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CH0PR11MB5235:EE_
x-ms-office365-filtering-correlation-id: 499ecc24-2a1e-4930-6794-08dd9855345c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Ole5SNPtzKViOkZi4sAC66cvwSRWi1bNma3gqSPC1W2aGo7agOYZwKfo4vfI?=
 =?us-ascii?Q?2V6gJOhevtwHEfDCq4THKP+LfHqoFKq0kaB0Ry2VlAFsbphg3Guzd4XRIAHF?=
 =?us-ascii?Q?yJzEdHiHhpKkajSHIis5tqsN+pRd+Mbr8b5FkxYjUPh3LxuhFvEAujrEbSR9?=
 =?us-ascii?Q?aW7kwKIZzMR2Niyd1X9fQbyX+3hveYoixbq1C5tmbdb3Tp/tx44C4X575E3A?=
 =?us-ascii?Q?/TkYaYBhiPEDkKIAYfOc6AFLT0XkEgCBklYnnK6zH1YvisK0s60oaNT7o4KK?=
 =?us-ascii?Q?dVF6/YMRAeG0TpobD2qiwjcuWziolNgAflM2fUkaVyGZ4g/9XJFFVfYPRjY3?=
 =?us-ascii?Q?H2+BBGgAg5uikRDx2ztdSFA3D7jj2nxK+JhU/k+d+FG6GpTETR7JQwnfbztU?=
 =?us-ascii?Q?5AF46ZYHEq7jBuvXB4USzZbGOKcOnfooKM3m18tJadZQCjSccbqZevEswDH/?=
 =?us-ascii?Q?dnTXb/ubIG/9KeeK0wbRn+CglFAs8WKvx3Au3gjOEB9wo/nsejaOHSt7w/ep?=
 =?us-ascii?Q?2gnMNOKoRJ8UVWI1Q+q8LrMz0uSBeNgmhxo/0afb/W7os7I0ys/uqz0SzQnB?=
 =?us-ascii?Q?m0ic+3LlZkP85p4/omA27BkDxDglSXPVMq0juhrpC8nEp+rX42eDBs4RWhau?=
 =?us-ascii?Q?giETb517ZHSOJN4eg9gRUld7a4rcI6hlpqzqPdCXZHFvcw/qqCoyvAC7DTIV?=
 =?us-ascii?Q?zOCjfr+m02HFvlKY3keKKthkFVWsJ2o+OVlNnJjj/hJCHSuaqCUWH3ZYk97P?=
 =?us-ascii?Q?Y6XwjaYCBc4W7agQZcKKZguLPCp2ZpF/DMwdn2L8LXUcQrgirZpO/Ga3L9pk?=
 =?us-ascii?Q?Nj9Vc8UtDprWaO8XWr9z87HqrbHgFhEUmSS8TJmBxRevPmdvSunaveRBoi+G?=
 =?us-ascii?Q?iOEADq7qOnO2xZuHSWVqHlONKuVwENlyWNPTrYsMn1SeZhNbkpKsU0EkT9QJ?=
 =?us-ascii?Q?Wb6lZIXH+OcGkrxWt2kofRwAd0FAfqc2/zXK/zE+CupqrcTB4D4+TBc18XhP?=
 =?us-ascii?Q?tebIPs0eGmVlno8MpTVK1cmzp6kq6ILVFSqif/c7Cw9Rwi+4A4dMKuL5yzCP?=
 =?us-ascii?Q?VLP5h+xO3mbgeJNaMesrHHs2vsWQoD9Cx4KV6oLBwPf1kCXRrS0dyhcouDWJ?=
 =?us-ascii?Q?eCrNOCmnTQv8y8C/8/iizPgzRFtNox1EtOzIoIv1vgQjRal7q/iQ7iKuAOBL?=
 =?us-ascii?Q?27GLr/uI677AAifljcN7npp4u8GGPLYjSFaU19J428/GnQxepEgD3Eq1E4/A?=
 =?us-ascii?Q?vII/k4mM2E+0Kc2DstW0i2oL/aju1zdqkAdYh3ZKJMXjUD4WZu19MQvXnQ+y?=
 =?us-ascii?Q?AviH6WYXRYyYXiYp31U4ASREyA5RvZ3X/HtIKIs8yd7lolNXLvZ1lH29a0PW?=
 =?us-ascii?Q?No11QAeqUaXseQXTtZot4pKRjb25x3rhiHQYWEazn4cBo2z3sVVNBMSQdD2g?=
 =?us-ascii?Q?ec1nQWKQ9t8T8pQIJa8DGnbFaz9o8LawU4b2AlhxdX00Crc019G+JATj/oGb?=
 =?us-ascii?Q?ibifBfP4cxB9Eq8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1z5zUdBr/g/LCJKWuIPCVnST6v8dlHCCYHDeWzJUy5MTILCAmnt80AbPfPJH?=
 =?us-ascii?Q?fm3Hrh7vPxGwnml+iu8zSqQwc8ps4nPvX/B19wf5rLV5iloMr/BubCvHG749?=
 =?us-ascii?Q?zrfCt5J/6GL8r6qVTvncpSz58+m+d5WHw2FWOzJuhTbkR3OCNyqj+4y21PI6?=
 =?us-ascii?Q?2EAO6ldiDhLv1m8qPqM+4ryVEk2DfNehDq03eGYXwPhd8k4sIfB7KsIZCrro?=
 =?us-ascii?Q?j52WO1T4RQm0El6g505meFfBDZEMciUYAzR5e6nEavqI6ZnNsUIfoBdR1OTt?=
 =?us-ascii?Q?ytsqqLXIhij0FJ3wOLIwR0btZs2ZbH4Xjwiac2GtqJIzRKBlbdJMawQ4mV1k?=
 =?us-ascii?Q?SD2ZZ8AW7Z2AnsRAvAHGhLWmwGZoCZV3waOtCJboyA6ueTyvmeodjWA9jxF9?=
 =?us-ascii?Q?1RiSSsktA3dblsb30AzSXYP3G93cDguBtWlcHqqyn3mHi2626v+OwpfF0ErH?=
 =?us-ascii?Q?u2y7pjfl6ChAh8V62fWsuPF7bUAzBtTf36MTwEcQb5nNhUiTYEq2xlJZGaCO?=
 =?us-ascii?Q?RO2JFAKPabwud/zcFXmO025l6x802QP9rqH8R4XOeMLXfcM/PB0nv5gOMlv/?=
 =?us-ascii?Q?z/rwgJAe0I2exDFAUzztxuPBu4e3q8uHM2oUPb1lv3lOl2J1MaV4JcTF6pmx?=
 =?us-ascii?Q?7rbuijrE59l9WlGDRSeB185ztroARje528i9nLV+foGPjvtxnd1lPSspdrFM?=
 =?us-ascii?Q?CW+weXF+L73OyJZYBIr3cduW3bV2W1zOBIVKV5Km2R7NDpFbgYSAmVcB6Tvd?=
 =?us-ascii?Q?dY7v4FDxYLBvTQjgzX8mfGX3r4KeSDaU2GlPNaEqQjO7vFZICnb66/ntpt8g?=
 =?us-ascii?Q?qELzHhMXbW3LAgw6s3K93075ZIEQy+fvI+v9WsnFZ6OyJznXJ9dmf9gJopp3?=
 =?us-ascii?Q?vF3I8mwBMrVyxq9NHUMLg5GHYFGDLWD1q5z9bFYo2DiB5/DCRtmEU7o1ANnf?=
 =?us-ascii?Q?t2DZp8ItRZa9x+katdWqMDbnztjEVPHIPrJTmNidynR61CxnAqPpxqJ7W+SY?=
 =?us-ascii?Q?D+y8CtWFkYqMozAGyUnD9kxBhC/YfYxcBhUN3uM44MFzxpj90SuCL0p9njCi?=
 =?us-ascii?Q?aCKHzWQyntqGr1QrSI0EY6DoxNodbriLUKdmtaOJlZIg9jkiNRy4c0dQsqiW?=
 =?us-ascii?Q?GfeH0njSf5hoGTSPExGCjqNDNRwRWd4TXrJR+bFg3QYLDowsaIDu+h0gwF0J?=
 =?us-ascii?Q?4Rmgj5nSnbpgbSqsO9ebhP2GHYFHZyeCsRs3uaBelDHCjWUKteW+kieipfRA?=
 =?us-ascii?Q?rMyu10P6U0rYBDFZT4uvbwKvXmhB1Pm9yyP8lWPrDD2YY6+GhPwDzLa4N59S?=
 =?us-ascii?Q?/cP6lYI89cwx96m8oYqBWDm4UBjtI5Z8tVtDe32cVFmeBc7DHhspiYcsXCHP?=
 =?us-ascii?Q?6dpl0mceF9dZpUs2au1fkgVnxknarUY+9qmm4vxuBtaIRBFszIwGyDsTn6/g?=
 =?us-ascii?Q?rUXdIlQWS7A7t/u/GHyj4n0TFz0/wpHSkeWwGr/0H7sA5eSLWlgHPWRtcwwK?=
 =?us-ascii?Q?hNX/Pv56ddzmzciMETLW4+9MEy1s4a4VtH02uIOFYE36DzrgNeESHFGqS4/a?=
 =?us-ascii?Q?oQ8ouPB+ACWtLmr0JXd/MKPb9o+xI9UV6cgaEqHV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499ecc24-2a1e-4930-6794-08dd9855345c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 10:49:47.4055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tL/NcrW0essXpuc/pys/w+3ryKZE4EWe7NBGE/NLaxJ632vEy8tqgBpGWrQ6WEsjroRtyFop9pMMejJm+8RiNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
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

Hi Swati,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Wednesday, May 21, 2025 12:20 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] lib/kms: Add secondary sort key (vrefresh) to DRM =
mode
> sorting func()
>=20
> Extend sort_drm_modes_by_res_dsc() and sort_drm_modes_by_res_asc() to use
> vrefresh as a secondary key when hdisplay values are equal.

When both hdisplay and vrefresh values are equal, then in such modes can we=
 use=20
vdisplay as 3rd key comparison?

Regards,
Pranay Samala
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_kms.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 9ee03e870..e5c0a51ae 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1887,7 +1887,11 @@ int sort_drm_modes_by_res_dsc(const void *a, const
> void *b)  {
>  	const drmModeModeInfo *mode1 =3D a, *mode2 =3D b;
>=20
> -	return (mode1->hdisplay < mode2->hdisplay) - (mode2->hdisplay <
> mode1->hdisplay);
> +	int cmp =3D (mode1->hdisplay < mode2->hdisplay) - (mode2->hdisplay <
> mode1->hdisplay);
> +	if (cmp =3D=3D 0)
> +		cmp =3D (mode1->vrefresh < mode2->vrefresh) - (mode2->vrefresh
> <
> +mode1->vrefresh);
> +
> +	return cmp;
>  }
>=20
>  /**
> @@ -1904,7 +1908,11 @@ int sort_drm_modes_by_res_asc(const void *a, const
> void *b)  {
>  	const drmModeModeInfo *mode1 =3D a, *mode2 =3D b;
>=20
> -	return (mode1->hdisplay > mode2->hdisplay) - (mode2->hdisplay >
> mode1->hdisplay);
> +	int cmp =3D (mode1->hdisplay > mode2->hdisplay) - (mode2->hdisplay >
> mode1->hdisplay);
> +	if (cmp =3D=3D 0)
> +		cmp =3D (mode1->vrefresh > mode2->vrefresh) - (mode2->vrefresh
> >
> +mode1->vrefresh);
> +
> +	return cmp;
>  }
>=20
>  /**
> --
> 2.25.1

