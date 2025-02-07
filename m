Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1253EC02196
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 06:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF1210EA2E;
	Fri,  7 Feb 2025 06:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L1LeU6Tb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11B810EA2B
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 06:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738910203; x=1770446203;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3X0zIIDRd/3vLjiCG2FmefyL1Sgt/4W9/eAejSUdaxM=;
 b=L1LeU6Tb4oTGw5JtYN9VCdEym+L4uFbEBY1NZ69dQxdHD2wHvhV1ZNwq
 JRUwyjr0TiBnUXaOIC3w6gOxOA2XCsS7Xl3kVdNzPAeuDkLFLPFzE0hGI
 nUY3OS6fV16EMwceMkDa2khXf9mbmCZsQftCyhwkXjna9xUvAF/CPLOgy
 ftZ9sKctj4mP8IBcwYNy/kvAVoWt13+xT8igFDF3D7reK/M8HR7AeZyUB
 mdN08riKCr22SB0pGRtHycKP+VOyBmwp0/A4erpyw9Z3FsnLo6toXkvuN
 suLVH56YOEldfP/6Fgf8DhSf9MWdfgvQpZpxcX9lQ044COpIOQvkWZV/0 A==;
X-CSE-ConnectionGUID: x1qzG96cQyqixB3rcBUn3Q==
X-CSE-MsgGUID: gJehCYtIQ/a4IPJCVqzStQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="57080030"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="57080030"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 22:36:42 -0800
X-CSE-ConnectionGUID: zAU2tAlRT4WXeUlpa7YmQQ==
X-CSE-MsgGUID: 080LtzhTQdWWmJPBXDFnnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111367090"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 22:35:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 22:35:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 22:35:58 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 22:35:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EP6WPJo0n/0ow4zpwmEzYMvdQyEBKKSnPcixfxy9KkeK6DqoaltgQIHkK/VwRvVLDOx2n0ukwVvbT+26/VK7kkcoiSvIPWz1eQI9714lCKU2VuVBItQvxCx2JHV02CysKDxMyxpyFILcS76mAYDZBvU+WMTc9F9V1A/OBJ/l0xktfrPQ9+0DnTHNckJkDSfDGi1JhAuSTNd8Iv+ZcJSW4pc7nPcaeB+4Lekl62DESWs1gILDYUGskrrGArKPq+J4OczuEUUqdPOiM6MiL7seEiMpWVYnQrGIbMgznjF1Xojs8Uo0OM9gCVX096T2UEDyHZMuFBRuqtbAA5r4P4eM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM9ojJMPjAsmrJb7OkkkZ0B/M1z1PThLzws/W1lo0Ao=;
 b=JlS1d8VKttzOBo46yVc/kouR8JwYgGBIVs5Xur6ud5O3MkLPiyVIuYOzUYTip6YJaEx91x9l2G3D2QZzZLUcqKENWetjRouJ9ydVtfXJoHYrPxeaO/rW1RGBfRlAQjwLuqA+OIJ2tatybv88jc+thzk1hdwSQsc4HkFCDlnEQ8xWsPvETLIIxfALBDn4A19OXiOtcfcqYWkQiznMpzrv1tP/vPXX06wTn2ox+u7tvCRNmcEGxsDM1fF9kZ4/tK+qlVZvqmxruUdcl/g46nZrxnhZtbpu6kCV3tKq6QYBJIdJke8C+EEv4gIPkeeatenTNZ5KoeqQzC2PxHFjU7xcNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW3PR11MB4603.namprd11.prod.outlook.com (2603:10b6:303:5e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 06:35:50 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 06:35:50 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] tests/kms_atomic: Add necessary checks to
 ensure proper cleanup
Thread-Topic: [PATCH i-g-t v1 1/2] tests/kms_atomic: Add necessary checks to
 ensure proper cleanup
Thread-Index: AQHbdBKRotHAuatEXUSZzxsbag/XVLM7bHNQ
Date: Fri, 7 Feb 2025 06:35:50 +0000
Message-ID: <PH7PR11MB6053566C058171C28B921887E7F12@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250131191613.447979-1-ramanaidu.naladala@intel.com>
 <20250131191613.447979-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20250131191613.447979-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|MW3PR11MB4603:EE_
x-ms-office365-filtering-correlation-id: cfbffc1d-9417-4436-4758-08dd4741a9ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dDnJcp+TRvBUXCjfK7a2bOZ9LD+9RV8ReG7ZJGPjWl8BnN5vHPJDYZ5UQ3IP?=
 =?us-ascii?Q?PwdtUf3hygYJ1ZXlrD+XeRz65mWPW+ueYZUI+4IC97AVFWGoz4in0JO//CRb?=
 =?us-ascii?Q?GbOFboaVMDzoF1/hPg+WVes8/g6M5WF73roiR0svysLf1tVscvY8c22skZ5k?=
 =?us-ascii?Q?90uN84jopxK0fTpQx8aEObqZhlLvldyIbwecHT+AjTFO7uA8GlUohM64tVix?=
 =?us-ascii?Q?hiZzJ03kG/Gfly0xI/o299fPt4nRuOyuAExfOhbbI2dJ5RuurBuFcSxH/N3f?=
 =?us-ascii?Q?Chm2xHpWyf+4XzEyWVc0MhN/aY+cA/zBmnS87sAwKk7KgBuBXh9pl+3NV7Eu?=
 =?us-ascii?Q?b+kT696Ax4aYtYmkwhbd2XFKCz/vJkuYBbVcto3UrH0G0h3WS0fBsirullWO?=
 =?us-ascii?Q?c/tFTsQf6n+V19mih6GeZk9PcmbZ6ZFwXgcR4pyaWxY3i91Awr9+qTIuzxn3?=
 =?us-ascii?Q?BXk474zZebZZDtPTGJMZ1JaMUcThmC9Yi2RWV/Lyib760CUqdSwd62LYpsUy?=
 =?us-ascii?Q?OLtXk/Y2mEs0YyUUraDeKIqnFKjebQQtUz9XTrJOvnvcJUHsfjR42az5gfJY?=
 =?us-ascii?Q?8irUkxSHWcgndIY2VmXIyUU2GYHYDVdAquD9rK9R31+1FF+W8+8VPikdu8hB?=
 =?us-ascii?Q?02AyXLDJt/4eHyvtGz0a+ouOn6d1R4kNA7fqL3SORz+DGWoU3MsO/ZDBTzk7?=
 =?us-ascii?Q?uTuj3JOqPyih6C3SPr4HBrUe5bduNymXp7vyPeQMubXuMWh4Z3jEnu5Ezj52?=
 =?us-ascii?Q?ZivG7cWtIrXzw+BCeghKVtjOYxy+l/uYEUJxrVRT2tFFFrKv0yCvVKoPHs9z?=
 =?us-ascii?Q?Mn0OV0SgedmT64EhDJPt2/WwrUIDsH8PgQq+vx9Lkc9O/NgpoLGQDrU/jGDT?=
 =?us-ascii?Q?LIB9STHHGVP3JwlVYH+kzdeIndMnJQgLqNziyyqskidEGCF2XWM62nz0Fhq1?=
 =?us-ascii?Q?t+h0/UsFc5NoBqzWakZbvovMXSpX/zUxjCbbsZe/YFabljG+pd76R0ZCok8r?=
 =?us-ascii?Q?JoM4H7GM6RNv3+V728Ek27vvVdrl2qGrYI42dTiXPgGmBkwd/FenKwwk6gd/?=
 =?us-ascii?Q?vLf/uYeSuNYTEBqVysC0rYY+/ClLKquHnHOlMm8G5HsPpJ+IRURE1LSw2mcZ?=
 =?us-ascii?Q?eIXYjJvCHbpmO6Qg+QtvKkB5rm9wk2srDIZSysHam7V2npkGmDxbernOQL2F?=
 =?us-ascii?Q?M2GcXZ5YPVtjlxUYb5ywHFqO+SMoPChaCt2mr/RRbKnCdkgbJkdZCmsqE9GJ?=
 =?us-ascii?Q?T6wOD8i3PamWclkiEmjXR5IJOu9QVdLWXoNcV/GpZrafr1kzqRTNOZSPvj7t?=
 =?us-ascii?Q?wD4MoHoClMeqqX1Wr6Lzz4LjnJG1TEFdbBN4cJrAY6u6n9jeU9Zx+2Hh7TOJ?=
 =?us-ascii?Q?TjPUH0QdndbrYaDsvA58CUIJJrebubbVET7x+axwx5P7uz+IfNUE9IGdVkxL?=
 =?us-ascii?Q?xEaBjdlWyQGIJmTo7iKNIK6Jt49notyx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UfcH/GSHkO98up3O8u9msJJ+9YTp2MbptilPGXsI8urrECS4YR4vnH9dHlN1?=
 =?us-ascii?Q?83C5B305P9v0Adsm1J8mQcWlg0IfYmcHhcYHN6iINuX0j5CA0NHEDPXbGvip?=
 =?us-ascii?Q?66R073RpFDPylJ3RxH1YEffCbg+PdDkmw8DV3/zKS7jZKEWulBgJ9EGEFCle?=
 =?us-ascii?Q?Y+u1tC58h8Nc+KvgTg+AhIt8NyTMnVKbj/gE7htqFcyxXQSASMFBXkB2VCI+?=
 =?us-ascii?Q?InyYqEwb92XwjZDfvcWUfmQmk99evQgdFLAS7PuZkh9bKU69wmmqmyvm5KJH?=
 =?us-ascii?Q?5yDAIeE4yAQGT68qumwCs68y1VtZd1qB/p5PaJrGttjqa6Co6BtgbS7lbGDf?=
 =?us-ascii?Q?5EqHrZpqHkrRG5pwlv60Xbe3XhS/Ejf3jeNdC/jmwH/4G6en1tqCS+Rpqk2C?=
 =?us-ascii?Q?pyN7Y6C8z5cAfn1FuoDqXEdpHt8TNoS5nZlMvEKhgtnL5QnFr5lO1dnz2db/?=
 =?us-ascii?Q?r83rFUFbOHD2No1PfL0C7fFAfWhhTr9RicOPYMhgUsdKGSXbSkui1140ZoSB?=
 =?us-ascii?Q?1yOl1m9NHFNJMN7XHyU+WvwEPzu9cbpMzf7th6LrtUtj7lax7mM/vOM3oI9R?=
 =?us-ascii?Q?C4WwRB2bPFHSi7YcQr9wl7P2rta9iFRRxvpES+DI2XIJFoknWOClyO9l9NG/?=
 =?us-ascii?Q?V4H+5RZKmk8MDBKa7+x2GxvgVevdysG67aHE6ve2I5QK4HGmT6H7HLONC/wy?=
 =?us-ascii?Q?i/l5dcnZfxDMadNit6H5zzOjq2y0nF4JUq0oCLPhKloVcHI8f/yn1MqdP2du?=
 =?us-ascii?Q?d4b6RV/a8x36yo8W5/fA4rqzSIhk+z9wlAwS9t9SRvI1lfV5Gl+dzuA9oDq4?=
 =?us-ascii?Q?SyDcD/HMWf6zCpvS6K0XrpH2UlyFGiRDeV5VYq7sZa0l9LgBfa0nslhS6owr?=
 =?us-ascii?Q?5WZvrRfiL5YZHGH5KVjHcswPWPHSOPGaenwI9kKV9tbVk96N04oQG9PvMyXF?=
 =?us-ascii?Q?ZH23uuoTzMVMBE1Q1EY05rxPGQPqHfWGBfblO1zZOE/jLKVdQ2stMS6RG/6J?=
 =?us-ascii?Q?FPZj+Jfqrsaa26sb1sKKIGeKjp3bzXZFFzSwtPwfkbeO6cn0QMalqbNZ3LCy?=
 =?us-ascii?Q?vZNI4rJf57S/fANFBfYu09BNCO8agc5lSWHG5z1Pj8tWIK+OcVwz01iXKEHD?=
 =?us-ascii?Q?Tm25ikyThnYFYIggmL0EGASqYs3shzmug7t30oXZJjI/e4tkXE2N7B6yvYPO?=
 =?us-ascii?Q?qMEcoxgv9BErDJhvQuwYZ2BDUX6Rlj4r/3GSZv18K9aGoJyDgrTZhA28l144?=
 =?us-ascii?Q?1ex1kx0tC6qjXmqDutLRMOs1U8BXCQPSCZEofz/8TfC5Hj3eqD/f9E5+Itgk?=
 =?us-ascii?Q?7bgyAk+TWVIbRPbcuvchjR5Muj/vNtxxqgNpNoDcFhbz1fPJOdWjcp6ZqpoX?=
 =?us-ascii?Q?yrMo5VZyWwu+fM69eUXCTdg8MCT2NhwVgNgEiCBEkzf6Km3q61wyinWH85po?=
 =?us-ascii?Q?njjWP6m88LdE2sIkRz7QZOnAx2s3hvPCcLAwMn542837malglTmnOLjCtAHl?=
 =?us-ascii?Q?4bvETqAkwuKYSAKViQKIUEnDkpGZR+lf+niNah/Jy4v6XdRU+Nb9APYIqLb/?=
 =?us-ascii?Q?ewqfaRj0fA2yCD26QL3aeZnhrBs+JfpNfiU2DdqR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbffc1d-9417-4436-4758-08dd4741a9ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 06:35:50.1197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAjlzll6asCKk3F4fXUnBa7nFLpwq333er8Vd1XFUR4x+0dprmRcr+iEECJ7HYfFok6UXkYwkTUEWVI31mRo8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4603
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nalada=
la
> Ramanaidu
> Sent: Saturday, February 1, 2025 12:46 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 1/2] tests/kms_atomic: Add necessary checks to e=
nsure
> proper cleanup
>=20
> Stop CRC and free up CRC resources to prevent memory leaks.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_atomic.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c index
> 489b0d709..8fb26a079 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -506,6 +506,10 @@ plane_immutable_zpos(data_t *data, igt_output_t
> *output, enum pipe pipe, int n_p
>  					  DRM_FORMAT_XRGB8888,
>  					  DRM_FORMAT_MOD_LINEAR,
>  					  0.0, 0.0, 1.0, &fb_lower);
> +	if (!fb_id_lower) {
> +		igt_pipe_crc_stop(pipe_crc);
> +		igt_pipe_crc_free(pipe_crc);
> +	}
>  	igt_assert(fb_id_lower);
>=20
>  	fb_id_upper =3D igt_create_color_fb(data->drm_fd, @@ -513,6 +517,10
> @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pip=
e,
> int n_p
>  					  DRM_FORMAT_XRGB8888,
>  					  DRM_FORMAT_MOD_LINEAR,
>  					  1.0, 1.0, 0.0, &fb_upper);
> +	if (!fb_id_upper) {
> +		igt_pipe_crc_stop(pipe_crc);
> +		igt_pipe_crc_free(pipe_crc);
> +	}
>  	igt_assert(fb_id_upper);
>=20
>  	/*
> @@ -560,6 +568,8 @@ plane_immutable_zpos(data_t *data, igt_output_t
> *output, enum pipe pipe, int n_p
>  		igt_plane_set_fb(plane_upper, NULL);
>  	}
>=20
> +	igt_pipe_crc_stop(pipe_crc);
> +	igt_pipe_crc_free(pipe_crc);
>  	igt_remove_fb(data->drm_fd, &fb_ref);
>  	igt_remove_fb(data->drm_fd, &fb_lower);
>  	igt_remove_fb(data->drm_fd, &fb_upper);
> --
> 2.25.1

