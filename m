Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3A7C8303F
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 14:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF0510E9FF;
	Thu, 28 Aug 2025 14:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNWngf6A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443C110EA00
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756392787; x=1787928787;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xmSjgWSO04SiVttFSdOk5fQJ/08zirRkFo/mMRIWOMQ=;
 b=WNWngf6Ag0k5+SNcAgKrKvRoTvQdTl2ILY9K/BRyN2qc35Dhqsi7SviH
 2ZHk+/xZ1xnZmjQdjztUMSROnw737OMFT01UcKdDgeCadF2SU9hFP75jT
 R2FOpXiXLyHq++szooZ65Sl0/N75EKAaP1QAt3cpn9OiMUuR0ce/lj3vr
 f5DaI+nZ5p3MX6XVI7DOpLeblcCcwiIEjBoHL46Sl9TXjeXTfxuJK0kyf
 nvkAqb5nYVjl2H7zbVdhhbalieV+pmIzCrYbOPQGHvTCRSe5B/YTKcijY
 zknEgdufMiuTsYBi0V0Rjg4bgdSSRatGkqGHpEjw/7O+M+SQCRDVsDrBt g==;
X-CSE-ConnectionGUID: TAzZyETVQ6yVQ9BbG9/5qw==
X-CSE-MsgGUID: 6Y9+8e7lR72ldpCiA0znag==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62497323"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62497323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:53:07 -0700
X-CSE-ConnectionGUID: zKz412lITrqyXCuthNkwzg==
X-CSE-MsgGUID: 7PqBBKtMTs+SuvjmcsDjWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170522805"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:53:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 07:53:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 07:53:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.72)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 07:53:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENP8TBrFizidgq3aA7wPeNv+UwDInjFACMG+M560o7ZaudxLpyUAOY833kRmT1iLDfS59ZKZ84jBN2d2gtrl0m49zv4j4m6lnkLRXV5jFmhUoCyM1R2Sv6HtHS60fLUNpLFlFReXcDKlC0BCCkYoLaMe/PyxVickWhvOIUo5OGqf86GMIocP5QtzYXZmYdcJUyI4/F1ghZxBLxY6GGYF+o0BV33EPQTLYbAm8AzqpCEpUau4igkXd9wmcZZhtvuLbkQCWzOSWrg/wiHxQW56j4gpmU0vFdua490RdrN+b1/hZQsSLMKGsnaKiNEAUKCnijIAjXk/P0TDO/e7s+FSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPcU0aY/AewbZsTpBxZ0jPOxgggN99A3xEPkxER6LJg=;
 b=bi78MtOnB2ON3xYe3d+clZt+VoCrWzEqtHy9HBMqXDkDtV79VYnUwE2Qnjq4Wu5S9PqFyT7k5XFRtPMwkerFECoEFokY1AhQu4RyjEgO+8feDunpC2U6WcIAm8ib9T9Pk/qmz9DhB0rgjG1b9A3XkN3MtIteYCJm6SYRsbNiRhSkBUXLlDL+rmfX3a+m/0QxqnfAPl96nJglO7i26n3Fnf6f3++tYkuxj1ROPj+qZqOsDUjcNZIczvq9TuPNIGuJU+sALZ98y3enOUGNv8AGPhKavzs0z7cXQIgGsugNfKYl2o13VO8kbn5a1A7NJRyxOL9J9VOPxgqowT37oKsJUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by IA3PR11MB9351.namprd11.prod.outlook.com (2603:10b6:208:57c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 14:52:57 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 14:52:56 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Sharma, Nishit" <nishit.sharma@intel.com>
CC: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
Thread-Topic: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
Thread-Index: AQHcFmVI8W9hpzXIo06KJXjHIpoa7bR4KOUA
Date: Thu, 28 Aug 2025 14:52:56 +0000
Message-ID: <BL1PR11MB5525B2D062096D41912C21F5843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250826084133.897768-1-nishit.sharma@intel.com>
 <20250826084133.897768-3-nishit.sharma@intel.com>
In-Reply-To: <20250826084133.897768-3-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|IA3PR11MB9351:EE_
x-ms-office365-filtering-correlation-id: be7d7d9a-d350-4da8-85cd-08dde6429339
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?EtELf8rqbQqKgPF1Auew2BtEDayCPiSCusvqONXyF4Dce9RbTSLHFs3Sefua?=
 =?us-ascii?Q?TXAl64moG6jhtwEeNas5gXNUBjhcdH/V5hG+ZmiJSC08ALKtmiFDNQpXMr8r?=
 =?us-ascii?Q?Rgl35JQyCr3ELtbdIMHVEq6r1B1/I2L0O/8HjyeeSBrzIWOS98nTr4+Qx9qE?=
 =?us-ascii?Q?AL+zslxoXoj+ZIdrEN7s+UJpwIbfRHTOq3eWoRJQ+huX/xQHuohJqXhbcjFe?=
 =?us-ascii?Q?3BlGwXWyhOrxqj+Odi2bIC/f3tzKqMy7C9Hu3W2JaGsqhOk9JnUsiUSn0Uk7?=
 =?us-ascii?Q?DhYk24SdaCG1ItILZ/gTTm/IUWn7lubmiNuH0qeHWPXFWek1rTxq/jM9Lq4I?=
 =?us-ascii?Q?3pu3m+gjS5wczoRh5KfC+IpwE6YVmeVQRGOvsz5nqQE/LNPGiLdwLP8QmeZi?=
 =?us-ascii?Q?IWyEoBThM5q2kKJZAH2vP49pORr1WGUqiRVQ+iypGaPF38npYjAh8BVPfsyt?=
 =?us-ascii?Q?xHMHTXUua2vb6ff5BSBsYDi77MOpixt4ZDnlbiRaj1JJHX+aPjhJ2Nk7ui8P?=
 =?us-ascii?Q?e9voFykLHoLx9Z4YpIu2aXRUrlFH4M5K7LtI5FRGzYPPEPPmJrDVOpoyMaMv?=
 =?us-ascii?Q?J2j6vcGM+qa+MRZtGUOGx/kCPPU1aWc5W3JO+fK4OaKkC+o0r/G0S0G/lJpz?=
 =?us-ascii?Q?iVuWF5GeVJDsNT2Ozx/evawtWWV0Izsif0ET5TsbZlGaYtCr/FiKqTaxJfAI?=
 =?us-ascii?Q?Vh0CP32hhwZXk5eGeRN9qQEteCbNHkeH40hU/SKExvL6aNiMXgZUJTpx1J1u?=
 =?us-ascii?Q?VVbxjR2geDpXoEvIGBCGt4GnVTizj4Ubea6mJYlloZHG5F5hv9T/85/VeY9o?=
 =?us-ascii?Q?lPvXEvicwBPyJaoifsR2nN/Oqyxrw4OicWK5e7H/o/5/2SNl96f2jvAkfLm+?=
 =?us-ascii?Q?qiAq7xUsFQ8HhSGQiFx03FJfrpjx2FusJtjVf0TpJ+nWhuUMRAkiFaZdpaGB?=
 =?us-ascii?Q?cEmhL/pDkZ6869ZtFKusZyKFrhu+iLI05tH1XDmZsVzMnLM5SzuOa5aCphd8?=
 =?us-ascii?Q?BtFyTlQqFo5ib2BmzCj7W0rasB+YXI875XMZpOoPy7ZxQOWcM5eVpEfuk6uu?=
 =?us-ascii?Q?Yfjdhi06itx9kXkwKYKnYFYxMmDQTFGEgXRGpj0HIP2FcqodmwVr4xoifxFw?=
 =?us-ascii?Q?HYueck7Sv/XbLu6ZPed0QJBjPS8SD9MMW4s+afZ1YtVxXK2bF0NHti1SP10B?=
 =?us-ascii?Q?NNQ50oVVa1n7J1qXpIpOrdDIydoDJVnQvleP+gckWBePdd9BNc8dHJOXDsLg?=
 =?us-ascii?Q?x4Sog4XnObOJfY2KoBdtpu+Xp0VqpEoTICWB18yAmfa0osByqZeQyfPYxOD8?=
 =?us-ascii?Q?apm9pjefyKgYFW3ldUHTiHwrqyvl1m8o5i209CrcXGp4EDlp1wmcKU8X9ux0?=
 =?us-ascii?Q?WjsKcBsdSSttC59I6sLVtcUYauguZqmkLSzA4NjVCSGiREPtgq3JpsPvj5Mi?=
 =?us-ascii?Q?lw2ja/PycDaTAiw0zaCd586W2/CXKewwYhoRV2PM7PtVhiz35wdgyVNKkQeb?=
 =?us-ascii?Q?frPSqoZfyZbN+g0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4XUDc4U6pj+L18AeHOU8qhr6gzutFElSB2z1bBDe0rv2HRL+I6JbOdqnzzYE?=
 =?us-ascii?Q?x5gyIFEmvCRF3zGW43Ciay+MB+D1VVl1NASmrOEu6vEbOuADgfDzDDYoilPR?=
 =?us-ascii?Q?jJtIGInH6me1DB+y/fHHXWHN9WL9zCzi5Q3H6bgPd3zezz2n7bz/xCsPN2Tb?=
 =?us-ascii?Q?jDvE3J92SXRhPHU8ZhaBSxnABqlXOwhUzOWf/gHaEf1goKVEgeO43+pHYfmg?=
 =?us-ascii?Q?4yrw2gossnG6LvOhAHy+ykfJS7sxYJHdMqJFJU2ypaMHXACC6mIQOSFtC/sV?=
 =?us-ascii?Q?Ki6lMD0hyropS0R1qHsywdmPzPZQXf+P8mZ0hLhrm7zelkoaR4GQ9NnKRwxY?=
 =?us-ascii?Q?c6nWK6wjc0Z3NqDyZQCnBbb+mMEz9nTkqD1C0pEnBiabV51xvC2DfLRaDlDD?=
 =?us-ascii?Q?S5Y/kRxgn5uf+qXsfJzM40Qsi65b2L/6Htl1COFFSW93z6GzwskTcc3Tvupa?=
 =?us-ascii?Q?niwD7CqHEHGA1pydud7MtebF9gzosD6Nl1AQd9GVCFG1RjApqgWg7mYLEtYM?=
 =?us-ascii?Q?Kj+6D+/DwxlwPX6l2hPVAqG6UKutPJrGWJhQJCZARzdsKgvsQ6pTwcRLrWrw?=
 =?us-ascii?Q?82u14hELn5ylSuYk8IdziQMJFeD3rbpR7393v71zyZcEh/ggGBgMHAE9dgtr?=
 =?us-ascii?Q?L0fRijh2hXE/zmbAFS2Mu91eYyvF5fVWgvUQ6td+fmYaT7NB+kdzugN+mg85?=
 =?us-ascii?Q?QbZcscCvbgI3iiRoGHuzZP7y+u1WXNVAETIBGCm9O8zvr8CnF2RhGF+ao/j2?=
 =?us-ascii?Q?stQ+9gxCcFhjrGZH/HYZiRP8YOvh9MdIpI5VRkxE7vEugHL1fTbF2Z0tDSSW?=
 =?us-ascii?Q?dCS/WiJzsp3NG3fOF3TsLlRoiL4I/aD7pXoC5NntRzodyOaK58hKBMN6DkAg?=
 =?us-ascii?Q?QA90FZ+NaPxcOZieuOQI3oo/VxecVxb4bc08ePi2T2HioU+ncC58lWEez3BS?=
 =?us-ascii?Q?ws1b7qZWnONiPYVn6H0oZyNz4mufrc9+PUevDgzYb3GbO/4nODvxr8yLA2Qa?=
 =?us-ascii?Q?537WFeJlNfWhtQN5Vop9310WufqpUqANALILaqu93+M6kClXdSsuVmSYY1p9?=
 =?us-ascii?Q?X3EIXjuW0p0EjcS9yLMDHd3U7B6pc+PKmIGyO1fuxiRuCjBAzI9Pn1ZTvkDo?=
 =?us-ascii?Q?QzmYJUab3VsliRFKphvnh28pokJgXBHugRRwNh5/gXYI/CrMzWkkcqOdZipO?=
 =?us-ascii?Q?eLjAWQS+0t44l9tO6iH+995hxP3hSfAIJvDyl+4dxIEdo3Q+kLPGH6iXRkjp?=
 =?us-ascii?Q?gRzzEsWduQaZuqVikzR/ieGhb3ZCC2n14KJMXSJemxFdbYm6ZDP9jTLNyJ7n?=
 =?us-ascii?Q?KxvZfgynq3YyHvlUN8ZFztIPzZFftV6ymEBDGA/n7om7bHa9oCOcJz8QXgDX?=
 =?us-ascii?Q?mi0FIPM+cFDJFitgpWjQTOwTzfwR3V8yt8ubpmHMxSyE1TdkVkUr3ny+d1lm?=
 =?us-ascii?Q?Y0h+TOzoDFZlquA+hujooD1p6bLyqXS1M7oiTCBOiMnEYA3YlkcFCR50Tw1Y?=
 =?us-ascii?Q?CeCSLLucurOMYw4IHQyVQKlCLW0JhotvQ3zZaMTK3osEVvhqpoWpR/A5JODw?=
 =?us-ascii?Q?AfxSwJsDCbaQavAQROqz3/08mtn//8Ekau9ojqP/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7d7d9a-d350-4da8-85cd-08dde6429339
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 14:52:56.8490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UGYz8C5xr/oRH5vzA9yp07IoWQXgvOhX+Ql0JUVy1TAKRVbGRXlvLhfvF0cJyaAnB5n+q1xnmubprIR5foRPGlN5l6+awBxgrPQVrcyzTRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9351
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> nishit.sharma@intel.com
> Sent: Tuesday, August 26, 2025 2:12 PM
> To: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
>=20
Use ] lib/xe:  Add xe_vm_madvise ioctl=20

> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Added xe_vm_madvise() which issues madvise ioctl
> DRM_IOCTL_XE_MADVISE for VM region advising the driver about expected
> usage or memory policy for specified address range. MADVISE ioctl require=
s
> pointer to drm_xe_madvise structure as one of the inputs. Depending upon
> type of madvise operation like Atomic, Preferred LOC or PAT required
> members of drm_xe_madvise structure are initialized and passed in
> MADVISE ioctl.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 56
> +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  5 ++++-
>  2 files changed, 60 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index 1e95af409..43bad=
8452
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -585,3 +585,59 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr,
> uint64_t value,
>  	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue,
> &timeout), 0);
>  	return timeout;
>  }
> +
> +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t
> policy) {
> +	struct drm_xe_madvise madvise =3D {};
> +
> +	madvise.extensions =3D ext;
> +	madvise.vm_id =3D vm;
> +	madvise.start =3D addr;
> +	madvise.range =3D range;
> +
> +	if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> +		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_ATOMIC;
> +		madvise.atomic.val =3D op_val;
> +	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
> +		madvise.type =3D
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC;
> +		madvise.preferred_mem_loc.devmem_fd =3D op_val;
> +		madvise.preferred_mem_loc.migration_policy =3D policy;
> +		igt_debug("madvise.preferred_mem_loc.devmem_fd =3D
> %d\n",
> +			  madvise.preferred_mem_loc.devmem_fd);
> +	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
> +		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_PAT;
> +		madvise.pat_index.val =3D op_val;
> +	} else {
> +		igt_warn("Unknown attribute\n");
> +		return -EINVAL;
> +	}
> +
Uses a switch for clarity and extensibility=09
Initialize the struct with designated initializers. "Please refer ___xe_vm_=
bind"
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise))
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_madvise:
> + * @fd: xe device fd
> + * @vm: vm_id of the virtual range
> + * @addr: start of the virtual address range
> + * @range: size of the virtual address range
> + * @ext: Pointer to the first extension struct, if any
> + * @type: type of attribute
> + * @op_val: fd/atomic value/pat index, depending upon type of operation
> + * @policy: Page migration policy
> + *
> + * Function initializes different members of struct drm_xe_madvise and
> +calls
> + * MADVISE IOCTL .
> + *
> + * Returns 0 if success and asserts otherwise.
> + */
> +int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
> {
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type,
> op_val, policy), 0);
> +	return 0;
> +}
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index 6302d1a7d..a5996=
cf65
> 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -99,5 +99,8 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t
> value,
>  		     uint32_t exec_queue, int64_t *timeout);  int64_t
> xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
> -
> +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> uint64_t ext,
> +		    uint32_t type, uint32_t op_val, uint16_t policy);

Both functions currently use the same parameters. Are there plans to modify=
 __xe_vm_madvise in the future?
If not, is there a reason to maintain two separate functions with same  arg=
uments?

--Pravalika
int
> +xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64=
_t
> ext,
> +		  uint32_t type, uint32_t op_val, uint16_t policy);
>  #endif /* XE_IOCTL_H */
> --
> 2.43.0

