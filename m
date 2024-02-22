Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4460CC48BF8
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 06:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97DA10E87A;
	Thu, 22 Feb 2024 06:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtMBkVRC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BB210E87E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 06:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708584093; x=1740120093;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OEyqhsvqAuFK+Kk2eYSHhIsFYMRs/WeHWoPp4SyC2dI=;
 b=LtMBkVRCgCULX40y1YUC0lTLsNegvm+E0uhRPPWsOqIjGzIrcO3ykl90
 xUgkOCL8YliyG1zfmygyjY3gtRcQdLhqXSkp6ZF5Dx9WzddHRcQC67lcx
 nEy437fobZ0OPVrqHgJgeAt8Z6HSr9iw/y+At9voA77dweRTNSKhcl2W9
 VvJq2Q8DaAexyv3r4XYpAgWr0JFDXMDJVXHQY/4VM1brlV+5cOiLMFxNP
 wDoGxVkI4NvBTaytP7cUw66/RuyVwcRNEZJ6LfIajyeHb82mmaZzHpj9y
 TelRb+dQCM7O/fuo8z7Gsly8fqB2qI7CXxiL81i1ft4MlIDXRhCpTFixX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="20340188"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="20340188"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 22:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5351195"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 22:41:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 22:41:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 22:41:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 22:41:30 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 22:41:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2+JDcucqqUesD24ww7k1Go5S6U3oqvUcRiiVOq3s3XwZTDgp3rknVE8JXFZTcYLoGTov6a0f+BhGp7E20/QEbNf6iQsInUut2jNM4hckTqK9HcCYfBWWJMpCEJ2hXjei3RXnGS7H4a5jpVtHMIHIu2j9kEmnMOhJ0h4w39orSoYv6ve/FLtqiQsr1OW/Wm1FKAQjnxp6XRy9oF2GF4maNI3G60X5+ZOn2E9U1Heckhd03Xj+eof9H/15UScpz7LFt/6FyVdOsaLIaV5HmhNgAUWKF4pAcgzM2lgtFDSFZniDCJlIQ2ovdLW5jdNP17TC2Z4iSiCV71pquoYlrgFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzZx/P/Wp5S0Tn2VLEJYDKKqCvaURD+4aCtuK99MtAE=;
 b=hGMratVR5B2fK2H+Ooyrgnnb4PB3bnbLYbOYumat9Zq3qPFnn4iKSBzSepI82jjI6xetIWF2lDOw2YDOoymiiD/IkVH7W5COfeMLbf/DkXrsnucSxe5H1VLC+QStZ7SCLtBR1JtZKFLtE9ae46B0t5ECLzkVr8+uagoTOWtgvp5mV7wga1f5H0F9XPwpTUIKcEkC24H61YoereS+1jp2VM08fK7gYDXEypk3PSGye3ZrSkpVOdMiDLrIh0WNXuMDL/0Y9pDyFaEFGpQ/juvc3Kh5anJisG6zIiQY2CAKxulsilINRGfnQdbm/UDUlIfXVCiYM+sxUWH0jG3FYKrfLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by PH0PR11MB7633.namprd11.prod.outlook.com (2603:10b6:510:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 06:41:23 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7339.007; Thu, 22 Feb 2024
 06:41:23 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_compute_preempt: Extend it for more
 engines
Thread-Topic: [PATCH i-g-t] tests/intel/xe_compute_preempt: Extend it for more
 engines
Thread-Index: AQHaZDn88REpsH5QSEGHBnwc9A0qzLEV67mQ
Date: Thu, 22 Feb 2024 06:41:23 +0000
Message-ID: <MW3PR11MB47488666990DED86553DE57AAE562@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240220200455.31217-1-nirmoy.das@intel.com>
In-Reply-To: <20240220200455.31217-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|PH0PR11MB7633:EE_
x-ms-office365-filtering-correlation-id: 42347b16-a401-4e62-1176-08dc33714982
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qmTKbNuxlYcbTrwG+0ZKWsm3fjq51EyAQj3gs5xXhYfY6JfKJdXl0aDxydZ655LHEh/SCpeApEXPb4VNpUXWliP0gC/GIROGWd/upywi9srAOCii69TR0u6bb1LoVSaO4npWe72kEOiKJKphspW5tosYTfmRuZI/UZ/a/NFv3KCO5RwH9Wx8W37e05+su+nEj6KhA3q218Uv5fMRcf9bLhDjHs8T2UuZxLABQyXcKE0dJW2A/ZgnAC82B0L5FrHowGn/cvCiBeS1EBY0lb+FTE/k0CPMOs+v65iRXSAiGkoqATz9NzZCYUZLnfROgETcr0CjARqfHEaXbxA6xggn5+TqkviHQvpQ8kKkRIBEvj+czL0DM6/5IpJUtOK/7ClCYzfTNi1MZ+hK++Y8NBIflQGY9eqI8iEOZpydaFQMEeSJYkxrd5UBScnhmp3wX3aCex3no7J6EKJFRaFyKJQy8hEQ4541PfD6EpH6NBYhnX39zj9f7YAaqw/FYTHv9YVcmEKDCmJAhw3h5EvvRoxLAdMDnJN9Z9nVzPYlvQUAV8WfT+7hvaUiXafC+zGPvqekrhOaAngHJhjC3LCKsJsquTa16UQSKHCyl9pznc5eiSEWwiV68gPic/Qzoat3X2ev
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AAsscnlZEUIcxuyf50wYYv9D2e+kp3aiaz3ahwNzP9jZ9IcL9/JoGkzwaf36?=
 =?us-ascii?Q?I8GHUhw/glGaA9fm753LlyxF9QuhHtLMOFeAFxumXaCXB2+ZxoBzr7IhlsoL?=
 =?us-ascii?Q?6rzHsxNUro77TmIjXDM14oi64F0sSHFjyMYnkMwtpREiHZvhWEjwb/sJl8q2?=
 =?us-ascii?Q?DE1FwVwtgAXJNuS52QksCQ+c35VA2f09N+o/EnttCCXdxdZ7OQaZdD3liYz1?=
 =?us-ascii?Q?LMT9VL4ExzOB6N1xOWRYNZt4QzB5TYC5V96MGlV/JtTskvd/mIRs5W5Mxqkj?=
 =?us-ascii?Q?k2dvF4XCb2Hshq2dWL5iH4sf8oEY5bjRVST3cBRvjI2nANCAzI9KJUuKu1K+?=
 =?us-ascii?Q?gUA4hNSPu6sNmNBEklS1ItTMkdMI3fS7vC6amxbJzKQb5h23VpsNy5Deulk0?=
 =?us-ascii?Q?EG66wPcKPCD+b1Urgurlcc3cwFtWkEf6QR4r/Wn80R4+nGflf7ZTSYlg+cmE?=
 =?us-ascii?Q?5T5ZwjpH6Qso8usp7IMfO93WqVCA4vQ8zL2iXiUpPUoTB6APd/FxWFgT4Vxo?=
 =?us-ascii?Q?bCVokE/pR/lThY40D3XUKCc4nEcgQEEXwWjHf71Eu3+P0UepsjvRDv35OVGB?=
 =?us-ascii?Q?4ETV/gzRHGirHRtgcuuUF3gonBzML6VohzwNqrNQDqh97BvxFyLw9zPcFNVJ?=
 =?us-ascii?Q?xbIFKU3B/4USp83jjvjWVhgTyy4ITTnnfX3XLW8BRp9kEkMJ/TX+yXupXiMQ?=
 =?us-ascii?Q?jdz8KskPfn1Edf6LStITK3verm7uHwa7Yav3kRqPhXBH4aKaHICj/+razYg/?=
 =?us-ascii?Q?/pacSbxHDowGki5rWuIbUu/vR4J3pB0V31dF1hIFvR/IV/qd1nd5sgQQogoB?=
 =?us-ascii?Q?3+6Nu8K5bzEfe2/HS4XUq+73rqqUvPLwP+jBVOX6qwbIE1jmyFnB3xMWjjD7?=
 =?us-ascii?Q?87PiBi01vIA4mjUnBvxO67tKKZSfH2zMTSh2odl+chRsV1Ow10jx09AOjf9w?=
 =?us-ascii?Q?fvhxwdVNjdPh+1Qht4q8xwd3MwiKXlEZz4pXVdwk0Z5MmZ1LxY7+J3v7RVhv?=
 =?us-ascii?Q?a8qOQEecWBIk3r6Bjq9uyO0E7e1t/qsdlXXlDfWVRQbu1mHxA1OU4EbfgtL0?=
 =?us-ascii?Q?MduaKt5jRwv0ZpzFc5Hwj52PMQWodVAzxMxZcQBjX6gLuhapXtceRve08QK7?=
 =?us-ascii?Q?nOo59/KmkIcz9evSZGWgFvDjHpLdexD69po+Eys+RMpGr04g/tzf1EKCdVnb?=
 =?us-ascii?Q?pmz0FHPe+nXvbJ9p3cKcIST8R6l55yanBo7Mr7+5F7UfHhhYiJNeMPf7ksg1?=
 =?us-ascii?Q?E2q2rzLXaEPT73yFUD4C9f57H4M1xQJwM53GOtS4sryivSaYVkEXJU8swmhT?=
 =?us-ascii?Q?6tDPYrgtMTXVXT29XNaI/OoqeI1NfFLpzS2xJJf7Sw6wARpm2gEuBAZMi7ab?=
 =?us-ascii?Q?3iXMPUdgEztyekK3NQ+OxRPhvhlAPoOqsPzj//n24CTFirxhKQpWgzWvFJ23?=
 =?us-ascii?Q?WqjG6r8wjsTXPskUg9og9fNpPeXcIgyROMfr809KiqfeCPDDZjN9WgNIDiN8?=
 =?us-ascii?Q?jS2EaOrXn/IJNaYu1S0dbrzuq3/bMJRch8PFL46zZpDyIldNkuTtZGK+M6pM?=
 =?us-ascii?Q?L30TcR0S7a5k5R34bC6XWFB4+iH4WwDzMqBz7qip?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42347b16-a401-4e62-1176-08dc33714982
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 06:41:23.6943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BY1Vkv/i8QLOCUoH0jQ5H4r0YwpF0DZESzvHmAXJhEccbO/GRhYW+cIOuh3cZFbqLxGB5clYxpC/Qkuyrn23W1hOuhbhBLDLQlY1mBm/mZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7633
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
> From: Das, Nirmoy <nirmoy.das@intel.com>
> Sent: Wednesday, February 21, 2024 1:35 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_compute_preempt: Extend it for more
> engines
>=20
> Extend the test to run on all eligible engines.
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

LGTM,
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Thanks,
Rahul
> ---
>  lib/intel_compute.c              | 21 +++++++++++++--------
>  lib/intel_compute.h              |  2 +-
>  tests/intel/xe_compute_preempt.c | 17 +++++++++++++----
>  3 files changed, 27 insertions(+), 13 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> eab407a0d..c5d253ebc 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1526,7 +1526,8 @@ static void xe2lpg_compute_preempt_exec(int fd,
> const unsigned char *long_kernel
>  					const unsigned char *short_kernel,
>  					unsigned int short_kernel_size,
>  					const unsigned char *sip_kernel,
> -					unsigned int sip_kernel_size)
> +					unsigned int sip_kernel_size,
> +					struct drm_xe_engine_class_instance
> *eci)
>  {
>  #define XE2_BO_PREEMPT_DICT_ENTRIES 11
>  	struct bo_dict_entry bo_dict_long[XE2_BO_PREEMPT_DICT_ENTRIES] =3D
> { @@ -1578,8 +1579,8 @@ static void xe2lpg_compute_preempt_exec(int fd,
> const unsigned char *long_kernel
>  	for (int i =3D 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
>  		bo_dict_short[i] =3D bo_dict_long[i];
>=20
> -	bo_execenv_create(fd, &execenv_short, NULL);
> -	bo_execenv_create(fd, &execenv_long, NULL);
> +	bo_execenv_create(fd, &execenv_short, eci);
> +	bo_execenv_create(fd, &execenv_long, eci);
>=20
>  	bo_dict_long[0].size =3D ALIGN(long_kernel_size, 0x1000);
>  	bo_dict_short[0].size =3D ALIGN(short_kernel_size, 0x1000); @@ -1673,7
> +1674,8 @@ static const struct {
>  			     const unsigned char *short_kernel,
>  			     unsigned int short_kernel_size,
>  			     const unsigned char *sip_kernel,
> -			     unsigned int sip_kernel_size);
> +			     unsigned int sip_kernel_size,
> +			     struct drm_xe_engine_class_instance *eci);
>  	uint32_t compat;
>  } intel_compute_preempt_batches[] =3D {
>  	{
> @@ -1683,7 +1685,8 @@ static const struct {
>  	},
>  };
>=20
> -static bool __run_intel_compute_kernel_preempt(int fd)
> +static bool __run_intel_compute_kernel_preempt(int fd,
> +		struct drm_xe_engine_class_instance *eci)
>  {
>  	unsigned int ip_ver =3D intel_graphics_ver(intel_get_drm_devid(fd));
>  	unsigned int batch;
> @@ -1720,7 +1723,8 @@ static bool __run_intel_compute_kernel_preempt(int
> fd)
>  							  kernels-
> >long_kernel_size,
>  							  kernels->kernel,
> kernels->size,
>  							  kernels->sip_kernel,
> -							  kernels-
> >sip_kernel_size);
> +							  kernels-
> >sip_kernel_size,
> +							  eci);
>=20
>  	return true;
>  }
> @@ -1732,7 +1736,8 @@ static bool __run_intel_compute_kernel_preempt(int
> fd)
>   *
>   * Returns true on success, false otherwise.
>   */
> -bool run_intel_compute_kernel_preempt(int fd)
> +bool run_intel_compute_kernel_preempt(int fd,
> +		struct drm_xe_engine_class_instance *eci)
>  {
> -	return __run_intel_compute_kernel_preempt(fd);
> +	return __run_intel_compute_kernel_preempt(fd, eci);
>  }
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h index
> a02688ad4..fe9637b91 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -37,5 +37,5 @@ extern const struct intel_compute_kernels
> intel_compute_square_kernels[];
>=20
>  bool run_intel_compute_kernel(int fd);
>  bool xe_run_intel_compute_kernel_on_engine(int fd, struct
> drm_xe_engine_class_instance *eci); -bool
> run_intel_compute_kernel_preempt(int fd);
> +bool run_intel_compute_kernel_preempt(int fd, struct
> +drm_xe_engine_class_instance *eci);
>  #endif	/* INTEL_COMPUTE_H */
> diff --git a/tests/intel/xe_compute_preempt.c
> b/tests/intel/xe_compute_preempt.c
> index 31703638e..a4e0e1454 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -24,20 +24,29 @@
>   * Functionality: compute openCL kernel
>   */
>  static void
> -test_compute_preempt(int fd)
> +test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
>  {
> -	igt_require_f(run_intel_compute_kernel_preempt(fd), "GPU not
> supported\n");
> +	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe), "GPU not
> +supported\n");
>  }
>=20
>  igt_main
>  {
>  	int xe;
> +	struct drm_xe_engine_class_instance *hwe;
>=20
>  	igt_fixture
>  		xe =3D drm_open_driver(DRIVER_XE);
>=20
> -	igt_subtest("compute-preempt")
> -		test_compute_preempt(xe);
> +	igt_subtest_with_dynamic("compute-preempt") {
> +		xe_for_each_engine(xe, hwe) {
> +			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE &&
> +			    hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_RENDER)
> +				continue;
> +
> +			igt_dynamic_f("engine-%s",
> xe_engine_class_string(hwe->engine_class))
> +				test_compute_preempt(xe, hwe);
> +		}
> +	}
>=20
>  	igt_fixture
>  		drm_close_driver(xe);
> --
> 2.42.0

