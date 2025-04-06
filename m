Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE313C3600C
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 09:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6188D10E089;
	Sun,  6 Apr 2025 09:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sm5K2sl8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3976D10E089
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Apr 2025 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743931985; x=1775467985;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+4ITewWdh3oBmhGtlKyKCzc7+ubkBt0BjRs9e0e3lyY=;
 b=Sm5K2sl8VNWcLcv7NJlKrgczELlzeZVJ0/Mb5WPAWzgBNrVGSvZNsPfY
 md8SOxr9ShMjgBRWJ5ZNFkASP1e3YHWZmqrUmIZDqfP6nnrtyLU1YNkPt
 YWnE6mLPoehlFupW906v7YjXq+8mS+o7B+wRmzTGYBNtmSDTOOL+eVruj
 pWiAN0EAf4fW5s92bm5wEFMtMbXI6iKxUjBN6tyblaw0bQVeeKjld533X
 wpZf7KO32NSNV8uvpzCBWqivGQYZDCqj5nVdjPanmfvIMuIt9+irzhOfs
 NKEc/AADAUoN8IZRi/epXJxE2kIN+dQ2TUR5wLwr4j3trkhdi5GoPdipl Q==;
X-CSE-ConnectionGUID: yk4p0ZUXQ5yGfWhd7AWlAQ==
X-CSE-MsgGUID: wRSpb1SER+CztIZG8krlfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45447085"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="45447085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 02:33:04 -0700
X-CSE-ConnectionGUID: PjACJGe/RyCCjt+0hZh09Q==
X-CSE-MsgGUID: pyga1dTmSn60/QrxOqpTCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="131828454"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2025 02:33:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 6 Apr 2025 02:33:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 02:33:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 02:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfDFgXsY2jiGBKQPUKG/6Rboa9oBBGUl8Famu+P5fxwXSUrju3XTuIFqe9y2GJ+AewSb37uP2mcnO2vR/t9ISvzy9WuErkf+RS9aedAelzzL42zEbls9wSBNvtE4lEBt2v7UXZo4a1QJu14jOP+iDR0mZYFezuMu0PFzPsqsGvt9209U+Shc/d/6GLFjx9c8hKfp8eJmzRcDtEPN611y6HwFETji+q0c+3BvmGcy4s1f3xT3bRaF4KAmPEUpa96+3xXiMf4YlueafvU7fb0KlBRv0U4w/a1JdMjbyaa1C5w+5EuWjE34SW3MZSBLTgXQrj1Qyc8Z6GaZUIXgGcxA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCchW6a9YSbp7R0s2Vh+65kNdmd6Rw3QY/qoF5u6X1E=;
 b=tzrKLCoHdBZpsryJV2Pfhv8wsuNpOHZWCdPqo1WH3Br+miY+gS0WcReA+ClxZcy4reUMaWNpDV5WM8aJaUxNBINc2miGCBRgvBgvFhOLmGrsxwenGtimP8jXxz2qyRXkfycJbfGC2jDTKN0yAI1L+/D3W6TT3SMEZhFPWVkrhoFwAtIUBC1yMMlfHe1hVR5lVF7Z0BsvN1w3XsoFYwvh5fKqwlI4Sd/I7SLsEiEiPw3fDf7VzJKBe18tIKWSJEX2OTJ1/TFGJvArBCWEzUWLqmyw2WrAy8szirPoRXMVMcT6KfQLmHXK9UejB2QpHvKuHAo22XmBZ/4/2MClXUEwPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Sun, 6 Apr
 2025 09:33:02 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8606.027; Sun, 6 Apr 2025
 09:33:02 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [PATCH i-g-t 2/3] lib/igt_chamelium: Fix CRC calculation in
 compared_frames_dump()
Thread-Topic: [PATCH i-g-t 2/3] lib/igt_chamelium: Fix CRC calculation in
 compared_frames_dump()
Thread-Index: AQHbpTKeyvV/FQ2IxUi4N5RDYzQmVrOWYycg
Date: Sun, 6 Apr 2025 09:33:01 +0000
Message-ID: <SJ1PR11MB61290FFE128938F3A47DF9E0B9AB2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250404072930.695363-1-swati2.sharma@intel.com>
 <20250404072930.695363-3-swati2.sharma@intel.com>
In-Reply-To: <20250404072930.695363-3-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB7663:EE_
x-ms-office365-filtering-correlation-id: 127e73b5-37db-437c-4c5e-08dd74ee06bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mmx72nsiZGniTGYvhQPqdeGM4AYAyquF4ILKb4F08TIYs8vpTgx4v42rCpaP?=
 =?us-ascii?Q?6bK4JESciJxa2qywURt3p6p0IUi4sWrn84nDwZqqdU6S20RUo0XwPvVtYOal?=
 =?us-ascii?Q?LSJs+uR+IgjF2OYKNAL1F3IQ5BxpLrQIhqKgT6+yDOtkmkmW7MMHQC89hAw5?=
 =?us-ascii?Q?24e/jdZHoP7EcSRniJjSOdjtfNTVVrluNI2JQpTxmQG0YZdJEXQD2XXvSmS8?=
 =?us-ascii?Q?lHQ9CaQK+08Fec/SNg1f807WMR0pV/+b9AREKI9SVfJPtPSK/P84GnIhSfEm?=
 =?us-ascii?Q?v+vM39EIINKpX2SX4koejAYyYYJRDmKpED9Ub3aj9DFC35sp+kyar0fTadkZ?=
 =?us-ascii?Q?dgYtnU4v+PhAzHnSNjJzgThSeZIs01VqwP846UBPItgTyrLoe3r1YUbkBtPV?=
 =?us-ascii?Q?lcFSZW6fwFcC3VQ+tRRC7C79U3KWhtQaWMw0qoPNRPmMVZ5e4ZoSatSO3K+m?=
 =?us-ascii?Q?W5oM23q9i3oG4msQaf3Pm9dFlgMC7f1SXvhudQipGRVTRlgjmlmPrwmxVTVv?=
 =?us-ascii?Q?AfNjup6jEGXq0SPXb/4rnI7W3Vyb1uwF2rEce8R3R44EOM1w+yZDIazDXF1K?=
 =?us-ascii?Q?5Hsi9jE9IWwrpwp1FazQxZhqfm12GLYrq/4vwZ8KyWTQxdgIClJsriGBzDTd?=
 =?us-ascii?Q?zcjqkqN9YlCxYhoQdUgFyW99C1aP3gsg52JXyX1DeQ1iTjpJSRkzsoOg/s2F?=
 =?us-ascii?Q?fqegtVaaCF5/9pkZ6QgqrMh+iG/V6tURP5nROe5YmEgboK+4CszeoPsAmzyE?=
 =?us-ascii?Q?Fxmuqeq8HMzq5BVK2RVdkwAJWAwwhFbEG5Eq0lhJxSCojMyk4HWii63osKFP?=
 =?us-ascii?Q?cF7KHBOQyhKiTMbVIJXCeK5yB294JAOh79FYiLjEU6C3PwViv6WXyZSzB5Zp?=
 =?us-ascii?Q?uB3lXzIH+zh4/bmJiuDQD1HpeYpddd5WQfqNFUYdyuO5gdPaIlh3dAX4CW/j?=
 =?us-ascii?Q?LqWQZkZgSbHoG7xb8J/YnbKlEzVuMBhXu7m3PBmpi9KPx7Tj+IaXD9X7pDAz?=
 =?us-ascii?Q?eEC2jCNcOEo6wVLytfNfeHGoiUcHsCd/K82lxpEGShHlVYkL9QK5D/htplQj?=
 =?us-ascii?Q?Q3SsQQuFk8bcJXbVjprPNkoZalsTln3uI4xmq1yhdiUik3WcOhhU1aOQIMmj?=
 =?us-ascii?Q?rSdcbSep2HH+okjQjx3VGNmpp4jK4MPP0uYzf568wKV9dnBRD314PRbnX37z?=
 =?us-ascii?Q?bONuYRUgmMbal+aeSIYSbUqleXb7Gvy7D8e3gsoky/NmCU6kd1RIYy0myp0P?=
 =?us-ascii?Q?sNhmDav7KaD5+7gJkiL+5ccmJcy3Mful/7wb22LQduW03zPntgMnAbCOGlLB?=
 =?us-ascii?Q?woEWxeCndjqwu+LleDJJJjnjGHMRuGhCy3Keoaiz7heNmyCpyrrNvYjtafbo?=
 =?us-ascii?Q?5HprlhgP0SWQ42Cx990xw0530ezOkG6RO06+a6REYiFxWAwUdExkXGK1GxTf?=
 =?us-ascii?Q?wBwGtQDTRXj8DigXcDOMbHpo0V+TJPP3OQcEHic9emOKqpgIuD3QIbxfosUM?=
 =?us-ascii?Q?iIitSIDMx5rwv2A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?18HE4971TxOFBIF/rycd06aL9qJ+urppdUfB4DuZFfz4V83SSbTEmMtcS+vs?=
 =?us-ascii?Q?1MMxxmylZbPNxWgHHmn/AWm80prcB5AnoJu6R61VoJgJSYYJI33AEefKCEXx?=
 =?us-ascii?Q?09EDti8ecAaqH069Fr2LBtcU2HIswwL3X9aRRioIZcDRGF+q/7IU9tp8N7wy?=
 =?us-ascii?Q?UNkCkMAVdw3yNCs4TtKfFrrPsd+7js+qNHv+lP+n6pSYfOitUUZJyZb51v+3?=
 =?us-ascii?Q?R5OzqCRH7fflDrMyOvqeg2sfr/vraTuddioBl+A78EeuXEF0EYoZWj8gwrID?=
 =?us-ascii?Q?wr5SCm2WFEcLEaPdkbbs//9ESj1OYYwosIrRw6kafv01veKVM0sjYgYYWyE1?=
 =?us-ascii?Q?f4wtnmSuVtfK+gmy2sj6O8xVYt59DoLBB1w74SMpoHl5nxaz/O8OtmlmXEXh?=
 =?us-ascii?Q?Ju95G0nHjqImBg1olctSYqmFxoK8IgBGwWpE/reReiibenZxYmFlfyNoTVL7?=
 =?us-ascii?Q?vKw5C9n335bd1QFVl+WdMLW72oF0NHjREvx+TO4LFjJU9zRkT3AZUbwBV7Ef?=
 =?us-ascii?Q?Uiay3J7qxM3WPVeGfdUcx0Xd+KS9gtMd5HA9TSyqLfwmNU2Me/2hMTL2VG/n?=
 =?us-ascii?Q?EFz54daAp/gJXFMtFtUp70TVCoXxE49uqjlQoZ5CE9Z6/l7ArZ1SsCnXXBOv?=
 =?us-ascii?Q?MtV+aHrt74N0742e81Wy2K+PT/TzJgerc8pmEOjKCY4C57ZJrmyz4FICrO3/?=
 =?us-ascii?Q?LlpnE9X3Vctt5UrDPa+J60LgJ1MvnjeuusU+Fuh9ITd0To1Ohrjn6wCZePcF?=
 =?us-ascii?Q?Pqml0Wwma/4Q+e0ULDapwPfL4ufMKThnhkv4J3Wv273K5dZXmmInKQqAWLFo?=
 =?us-ascii?Q?aDEMLcmGaVwS+ooOzfG7To+IPVxg8RwCuUqBPAlqDRDv8+GWgbCH9XfTXQp2?=
 =?us-ascii?Q?25zR4naIApcf8Jgh81/lXkHVmCgKqU4tVz413nGinXow0m5pgeQ3RCDQ10bY?=
 =?us-ascii?Q?i6WAnWWkWgVCktZoGgW2+RukU48DL1sxAl5xY9pdtpzd4t+OpKEvDSmnYHY3?=
 =?us-ascii?Q?I8d3tvhzMFyrBqQt5ANFWcAAX+wzL2BRhxIKN569DrJwda6m3jBCfdiLTwYF?=
 =?us-ascii?Q?eF+Yg5i6/vwxxEXirQDEw7pZGNZOHgEkYYIaK5/K0H+nRR8/R+X/dCY7RQTR?=
 =?us-ascii?Q?CD1gtxMJ98Qt46XVIai8LtWsYy5uveHUd9cCoZd78CeH/Z0lD5BjvxjSX0z0?=
 =?us-ascii?Q?kjO5RmMTSUHAUmJHvfv+qslWUMEZbw0uDoUBHGuu4NvAPlAEyNgY1owiMBdi?=
 =?us-ascii?Q?2XNiOcoT5X4nyiGR+/gHq8G4azgDO1H/2ZV52A/yX1lard4mcd/1xORHRWzq?=
 =?us-ascii?Q?/Tz5+hNtW6P3rLjB4RflZiVqXYui//PZu4Oh8olMnsz8fCe9YHSY2Ttk1t8C?=
 =?us-ascii?Q?7YavzpZCwDFFdg5fVPxk9tdVTbr8IEh5QoO29dLKx2ZRwKSmJrWF5dTS5d1H?=
 =?us-ascii?Q?bb+6HU/iQDQzJ7mfHZoHiljk+0APYo58AxdWLpU3dgAges9FvrC9ltpZUTXy?=
 =?us-ascii?Q?J1vUtfCXKz6lnfe4qvCbKVla/kW+wu48SZGwBvLdO4QeUhv47B1VaeTB4vPq?=
 =?us-ascii?Q?mvSTkhWb9uxCJXVO2p1Z/25ToUSN071wz4RlUOkZOfyz10t1P1hiqMz00Bu2?=
 =?us-ascii?Q?nA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 127e73b5-37db-437c-4c5e-08dd74ee06bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2025 09:33:02.0044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6/ixUBF8tp/gjwnbul/1GRqdiy9qTSmRe6EPJs6TQl3Q1oBor+7qx4eV6tLMkGtRXLc5fta/3QdxggFWsUbRKl1iHHPsbC3tSL6kAPZlvcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
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
> From: Sharma, Swati2 <swati2.sharma@intel.com>
> Sent: Friday, April 4, 2025 12:59 PM
> To: igt-dev@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; juhapekka.heikkila@gmail.com; Shankar,
> Uma <uma.shankar@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 2/3] lib/igt_chamelium: Fix CRC calculation in
> compared_frames_dump()
>=20
> The CRC calculation in compared_frames_dump is incorrectly using the
> reference frame instead of the captured frame when capture_crc is NULL.
> Fix this by correctly passing the captured frame to
> chamelium_do_calculate_fb_crc().
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> ---
>  lib/igt_chamelium.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c index
> c86773898..a96e36b5b 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -1878,7 +1878,7 @@ static void
> compared_frames_dump(cairo_surface_t *reference,
>  	}
>=20
>  	if (!capture_crc) {
> -		chamelium_do_calculate_fb_crc(reference,
> &local_capture_crc);
> +		chamelium_do_calculate_fb_crc(capture, &local_capture_crc);
>  		capture_crc =3D &local_capture_crc;
>  	}
>=20
> --
> 2.25.1

