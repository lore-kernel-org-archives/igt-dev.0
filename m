Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE01D116F3
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 22:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C1C10E4A0;
	Mon,  1 Dec 2025 22:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkibsKLT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BC310E4A0
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764626592; x=1796162592;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bKMTKoksrM7OJgazVg/cm2SJIBMtVgmpIhRyMvVciOQ=;
 b=UkibsKLTQBka8dRfrt2PNOLFyEtEBFzEFsXdKILyT9qUh9pgPUluXU5A
 BGQO2ahO6/oAZ4HT6uFRDzT1PGO2Ddcf79ZDXAnJxJGhkrUtytPb2mlXQ
 Fi2lUIAfZxINU29ZPaCP2rBCe8BUa/r6bQJM0TJBTxRRocArOcV5yHgvs
 hVCqmDTos6JfFKOJ+HgTsgWKHwOVLwzmdU+kAAEdshikUL/K5lEV7BWmB
 YLYq1VMRpta30jhEdxyNQbGUz837wWvDqFJw9Z8aKR6HcRHmyAi2ak29J
 be5vOg++93lzkc9uQRiSHaVTdqT2pbpXiO7rfsqqdFneTFvbOuoYS2TMN g==;
X-CSE-ConnectionGUID: rl/ge7mwRxWBYODOhVRFsw==
X-CSE-MsgGUID: eC4J49nrSJ2bl/xndPbmHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70429999"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="70429999"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 14:03:11 -0800
X-CSE-ConnectionGUID: OAVu7Mu2S52u/WxBvs9KHQ==
X-CSE-MsgGUID: N9dewWpZQJ62O71KtaxJqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="199314248"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 14:03:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 14:03:10 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 14:03:09 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 14:03:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJ8r+F47m1K/ffYRNk0QDsSuGwfZofnK59kAbcH3Vnwjde7iCdrQUyxz4WnTCfTrfyyyY/grvK0bqhO1pDeLNGZ2FeqL1LtlLlA075nKDKGimXGM0qou4scvaPFBWBUV8EIOa0ndQtJLvDHno08OEqxJgI7JcTsvjW8PMqPGCqu06vZkO2SD5FPaOnJCTPtdTMbBcQG6ZgzriyiEXalOYY48VosLPSPjMR7jcvwHMCpwvQ5bIduroPk4rPX96RSjMf3bE1INvLu2t/Vzxic4K3t3h9KFMmn9zvnqxUNWeuPDS2z7fIeyULF3KA1YPOGxah5jsuFHI+2PnRHCT7UoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJuFGb3Alug7COD2h4cHEfLOgebhOyAGjKK+DrwH4Og=;
 b=c11m/S8j0e7pZx6ZAA5FKJMBHKV5QS2jXIblNA0qNyeebMDNXusUmJT3Cv8L98P59Y+vDs/zzJGYZAfAb+oqFgT1/FJ7x94lHiTBWfvtmM7SxCLYLW/ufMZsUL/Oxq7thTbNyU4sKTt3jzHWyS1phpgZLrUB63sb8Z80yEGpJLBQ84r3WcUwI7lkf9NIjFjJK9P1OZDlIJJKGCsBM0sbQsRTRjr7l8MTsG1UGoAJO11Uq5yP1kujYSiP3QrGQCQkfMo+v1elrXr150OsdJEscUgLxy5zyfTrKf1yCs9/z4qhfSdlp+7+Y7y3TkCjwMCAQEU1RUj6MY+r4hSBtzTslw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Mon, 1 Dec
 2025 22:03:05 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 22:03:05 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm-uapi/xe: Sync with exec queue replay interface
Thread-Topic: [PATCH 1/2] drm-uapi/xe: Sync with exec queue replay interface
Thread-Index: AQHcYu9eZloa5YYTjES19RKEaVAWCbUNVb+Q
Date: Mon, 1 Dec 2025 22:03:05 +0000
Message-ID: <DM4PR11MB54562BFA667BD67CC1096B03EADBA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251201182114.851967-1-matthew.brost@intel.com>
In-Reply-To: <20251201182114.851967-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|BY1PR11MB8031:EE_
x-ms-office365-filtering-correlation-id: 7f552ef0-839a-4e74-b0fb-08de3125676e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?DyOtc8xQNNHeixpyrVn49NWYbxnJSx9+EOY+uOajFRF29vqCTiTXzAxKIkot?=
 =?us-ascii?Q?G8aIJ+y6kSEx1OlABMRBr4WMy0nFNwrbwj+VIDDL4SRuRFRNlPWL2JAyhLKZ?=
 =?us-ascii?Q?HTrYNOIpAjbkZDqC170IPUJD5iAWi3tiK6vHghN+x9LNSkPh5jbRnf9fRMGX?=
 =?us-ascii?Q?IcLQbIePMgTpq/mxOFsUFx/HuSgklyE2MbtDLFZsKSN+AUidQ+A8R8ehP1wR?=
 =?us-ascii?Q?4FMltkkbi4eMkRTjQiccpswQKVWkLttsesrVxyQ6k8EsP8HL5+iaugRGwyhY?=
 =?us-ascii?Q?8hiwrG0SnFY+PllnazMsLea1tOVY6DKaJJgTh6ca/ASy1BvRVbraPVTWoVmv?=
 =?us-ascii?Q?AjHvmpl7HtYDmS9+RNvRFyk0VWtlb//u7oYgS664GhgvGqCeHuH7b1YU/e4u?=
 =?us-ascii?Q?OJAmQsNVmC2x7xGOWXl4PoxvwmV+xDKSi8us77Tdbabeo4oGE7aDIFOdxqL/?=
 =?us-ascii?Q?V79YHyr4c3pzWlLkIYJrJFqbu1SPLXlVxdRg1zzQF6pGvUkyLHb9j3dTfEXZ?=
 =?us-ascii?Q?/8VWocgpSbGIMNem9e2xYrKXijB9NX2YoYBZaO24vom7yVig0M+e3POXTetk?=
 =?us-ascii?Q?qeBFxk8Tl+OQLZUkT5FYuZFsCYSUWThdmqoz8gGhQ2KRrLePJMPmHPEJf6Hq?=
 =?us-ascii?Q?DliHYn89FCuciHYUPcr2P8Em4xC4lCv1TYgByJd9ezElBFAc4PCMK//mUWCT?=
 =?us-ascii?Q?JTnKFZOXiaMvXvNfJ04FSRWFEzYHzDT6ugSmMKhMTBr6uOoqLHJqM3hBf1kZ?=
 =?us-ascii?Q?FZOC24anEN/8LZr0nmI79mpSDYInPTB/hyvF+70zpQHRYoQPOgEa25X7pJDj?=
 =?us-ascii?Q?m8M69UxFb9bY+L2s/BEk/ZG7jSi4++XNGbqDfc5C/BijNxwVViGzXeDwzIrN?=
 =?us-ascii?Q?Um5tXOzH/WO5Yice90i7AtzUgmDUbrL/6BxFmfGnQOHaf8FBmQHK9uyF/kKh?=
 =?us-ascii?Q?F4uUKV/vmL04fkAKZJMLUDbigI1kYqKeubyqB1sxiYUGybo+GGeeKFvZlecI?=
 =?us-ascii?Q?iFABOq6/o7S8fj6uiI21x4PngqxFFuPluETOr+OHcOoMeuIFIrk04mgnX2nG?=
 =?us-ascii?Q?HHJDxJqcQWVWH6PPB0nbNhK3zcoRthJSQjDf3Xx02AnXaToj1u05jImHg3L7?=
 =?us-ascii?Q?jDyHiXy1fv7ggthdvSmIjivogmYtcowKSf1TAM7+kbkNZUXmKkrY000i5LPW?=
 =?us-ascii?Q?nxM3E1Ljhd+m72vU5m5aaKgbb27nO6xlELAtS3+KJN07ZME5gc9i2feEGyKS?=
 =?us-ascii?Q?B/VmW98C/zhelD0f0LDCnr2HYt4fvdIsnHYWoHpNcCdfRYe4ITgZzr9xuupI?=
 =?us-ascii?Q?yJbgGFGVl2aGf1MVLdlT+6t5Aj3na2/FUxi2n9UJkCnGWAg4+kFmPJfZAkVx?=
 =?us-ascii?Q?k5sK22rIBKcHgicY1DHkMdYsXrNeK4TBmkQAfDImv6F62POy/K2RWvLZGVIl?=
 =?us-ascii?Q?af4rclf/Hh2p/yo7TbqSYJmItWZcxzO6GNc4MP6w0pnh6+inM1p5/jr9rdcM?=
 =?us-ascii?Q?tG4K6gF2nH7K1pmGFOigAD4t99PDSnhwIYg/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yW1S0NlvwP9CIOxxqHUFYQlPnP9vFgZ4tTRde68SH5JUfFs3qiX81oa7SfOt?=
 =?us-ascii?Q?vgd1oI08U3Dfl5CNvfAud9VU9M7EPGoWLrT9ESn3y0numqUuVE6FxXQr3Tlb?=
 =?us-ascii?Q?5QGadVwlrsOd5WL1o9aAeUrwLvK4u7WD3V6oJYBm7oScG+nz4LI0vRDv37Cx?=
 =?us-ascii?Q?yLnYl4Bz4kVey+jmapWlTwWL1olaVcKLLVnd6HNwZPonzMSEeB3oqik10Aux?=
 =?us-ascii?Q?U3VF7VZKuS/1hpB/vp/pV7LOyC1pfCnmXp5F31ctlucw+aqG0KqUgmzql98W?=
 =?us-ascii?Q?9cMXrmWrQgXl/+bDQ4t1neF6APcZUZ58x8WUtQ4Obwy/rS+zmN0OefKrOO0L?=
 =?us-ascii?Q?nr26s6nT8qH9AGc+GKDGRWK7gVWlNi+VqiOUo9VdOrZ98PXwfvSt5RdYRKIy?=
 =?us-ascii?Q?i210sE3FOqwlz0FvT3iflQ3mOG6yxV7Iv2EFQ+6vW1LJGz4lcCZatADMBcGp?=
 =?us-ascii?Q?hHi1+/ArwvvOKtzML15zgE8thHQbw5HT+WA3+RC5aNF4IlqtN0rGPgceK1be?=
 =?us-ascii?Q?9RHuUfO8R+R9+E4HnZy/W//XdtIs2PdyIvIAu5O+iuv74Xdgcc6Y42y/JNIn?=
 =?us-ascii?Q?zvYH9NkXoU6K6dRsm/RncLa87YvpsiZXiKeYID6jBAHajuyMaXzJrLTtI/Op?=
 =?us-ascii?Q?kyen+n1sK8gae8sI8s/x/L8m8V8YHjuwZWBldddJEsjZXtBlWkav4ErHiBGr?=
 =?us-ascii?Q?1w5cS4G0x3GveXQhY4bYLRDaXkt23XIo5pr33J2d+8rj94D2Z05niC1Kkef3?=
 =?us-ascii?Q?ghhDvaPtbDojSpKrubO/mkXnxYW+Eqa/bwQQgIiFquwIso84t+f+R+XxRU/y?=
 =?us-ascii?Q?X1MHSKPbtbuepA0aIo8yxA9d4MqT9HJarS3xGW0q5SEleBy8wFom1sI9utF9?=
 =?us-ascii?Q?RsqcVbP2CNiOJyzaP2RShbE6MKD1f8BSudzaJTDMrMkPOc1MvNFhzc4UDV/B?=
 =?us-ascii?Q?Ei3VYAXQoWcauhCWFf51OrO9LUFXzJ46AWjwu6HyXsiwoNpBlWCzcVVJthbA?=
 =?us-ascii?Q?89l0Xyc0nCG97iNuBREjOYAxZEJE8ehw4saB5FtycEr0RH6V1QBtryPrJz7s?=
 =?us-ascii?Q?U10HM2C4ZDHGzKtroVBSmITviRBvwZmILgivQaWGnnv2W8Crt4q/+203TqA6?=
 =?us-ascii?Q?YjacpdzuzEWiWGhuJPGybcHNY48IAM4s0tYEFzyh7D0LNPWojaHjDQaQ9bjc?=
 =?us-ascii?Q?bVSyxQ7skPxTmctcyd+dxa/sIvZkc52k/y32yhQt5i0N2IPMDQC0Tlf2q4v8?=
 =?us-ascii?Q?HShFSAsdX/9odoW69yZH315Xup1oDugIqQJzYGK13bccyIYA01gC0M4OgDpi?=
 =?us-ascii?Q?eXuRHsbrXoNrHG7qv2R+s9+56DVQNoZchgylQGJkgwK9YFch0igvJ4enVS31?=
 =?us-ascii?Q?xHf/NM9bXAnUz0dGrK+ECTWGp9g0/R4L1L/V2RGHibCw+dwc86qE8GZItVwL?=
 =?us-ascii?Q?n87V8W26EqPkRmHyPbmHudGTbbL0AcOMyJ0O1+E+2+J2esP5rOu7PCbFnBUS?=
 =?us-ascii?Q?h4xjnaf2O5yBi6CL6PT90LCT8S7NbHlIVu4oyJMm2zoI6ESenNcqLaIHGnV8?=
 =?us-ascii?Q?spWAJ/GVUSXmoyDg6Rzcyymi2Pcyev1gYkALK3Um?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f552ef0-839a-4e74-b0fb-08de3125676e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 22:03:05.1832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 288OUXymEGGizg+7DNJiBI0mD3mlDOKth2vP34UNf1Om/nuyWD/PRnb/IWEH8uuoLwo007GtRnZMziFDYHi8+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8031
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

On Mon, Dec 1, 2025 10:21 AM Matthew Brost wrote:
> Align with kernel commit  b80961a86b40 ("drm/xe/uapi: Add
> DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE"). This is to bring in exec
> queue replay interface changes from KMD.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h index
> 89ab549354..e56b77542e 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -210,8 +210,12 @@ struct drm_xe_ext_set_property {
>  	/** @pad: MBZ */
>  	__u32 pad;
>=20
> -	/** @value: property value */
> -	__u64 value;
> +	union {
> +		/** @value: property value */
> +		__u64 value;
> +		/** @ptr: pointer to user value */
> +		__u64 ptr;
> +	};
>=20
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> @@ -771,7 +775,11 @@ struct drm_xe_device_query {
>   *    until the object is either bound to a virtual memory region via
>   *    VM_BIND or accessed by the CPU. As a result, no backing memory is
>   *    reserved at the time of GEM object creation.
> - *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
> + *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT - Indicates that the GEM
> object is
> + *    intended for scanout via the display engine. When set, kernel ensu=
res
> + *    that the allocation is placed in a memory region compatible with t=
he
> + *    display engine requirements. This may impose restrictions on tilin=
g,
> + *    alignment, and memory placement to guarantee proper display
> functionality.
>   *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using
> VRAM as a
>   *    possible placement, ensure that the corresponding VRAM allocation
>   *    will always use the CPU accessible part of VRAM. This is important
> @@ -1013,6 +1021,20 @@ struct drm_xe_vm_destroy {
>   *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The
> CPU address
>   *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, t=
he
> BO
>   *    handle MBZ, and the BO offset MBZ.
> + *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in
> combination with
> + *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises
> when the underlying
> + *    CPU address space range is unmapped (typically with munmap(2) or
> brk(2)).
> + *    The madvise values set with &DRM_IOCTL_XE_MADVISE are reset to the
> values
> + *    that were present immediately after the &DRM_IOCTL_XE_VM_BIND.
> + *    The reset GPU virtual address range is the intersection of the ran=
ge bound
> + *    using &DRM_IOCTL_XE_VM_BIND and the virtual CPU address space
> range
> + *    unmapped.
> + *    This functionality is present to mimic the behaviour of CPU addres=
s space
> + *    madvises set using madvise(2), which are typically reset on unmap.
> + *    Note: free(3) may or may not call munmap(2) and/or brk(2), and may
> thus
> + *    not invoke autoreset. Neither will stack variables going out of sc=
ope.
> + *    Therefore it's recommended to always explicitly reset the madvises=
 when
> + *    freeing the memory backing a region used in a
> &DRM_IOCTL_XE_MADVISE call.
>   *
>   * The @prefetch_mem_region_instance
> for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
>   *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures
> prefetching occurs in @@ -1119,6 +1141,7 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>  #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>  #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
> +#define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>=20
> @@ -1273,6 +1296,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
> +#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>=20
> --
> 2.34.1

