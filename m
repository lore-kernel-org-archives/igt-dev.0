Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CBBC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 16:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66D710EA1D;
	Thu,  6 Mar 2025 16:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4tLN3I8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B0E10E9F1
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 16:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741279561; x=1772815561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=koY3G9N+8E5ILv+ynIKYAUzi4KfBOogA7zLLFiAJOss=;
 b=d4tLN3I8B6Ff29Hv6916z/xuHbB8O1JuUGlxHIyWmDuOuUE93Z62CH1n
 j8FGcV/kf0/aESSPQlL/Gq8ziAVta6GrTsikq2fT7HHTlEnA67SQqc+Ja
 HMeJHokIdrw3YX+5u/5T27wckvoWLHAsWEBrWLcxNvfamQUBPm7BF/YYb
 VQRDoMytpD7w09fgfJLFrE6M4sjqILbXykVBpQ0EdG7QNmfEh5UKoQju+
 Joi82RuyywEshQ42ct1S+mxSIa1yuj88zILgkThIXeTyDXEwZni/byGzX
 2JO8PpjssiMJZ1wjTilRKCl8n6ZLtkOxlAndPfAUVc+z5aOyOTpp0SdSk A==;
X-CSE-ConnectionGUID: gqG4JqInRrirw0Rcu3mFIA==
X-CSE-MsgGUID: IibMh5z1QdqSMx+Lg5AZOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42006929"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42006929"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 08:45:59 -0800
X-CSE-ConnectionGUID: V6qneD4lRX26lJgQXT7ecA==
X-CSE-MsgGUID: v50Jd/jqStyGd7q3MYWqQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119583252"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 08:45:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 08:45:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 08:45:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 08:45:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGR79eMZtiZerU/XKGekO5RVx0q/JRqN9gePxQiV7f7x5cZhJSJQX/nobVnsU8t5mMXonyydjTGt7AXGB5PtoU8QL7pTP9MWOEVkcMm3/djgTF1zngC8IzL6fyVYroyP0Vu/CYgijp4NpR6SDlP5c3XUanahzgHPkWOjNnTnhadehdfWNu89rDcqG7WbDlcdM2FECzoerF83JtUjxnwvooD3Gn1uarIbs+uINN3TT8lE07GCP5+cFNvhd+DaGYeXZNoXGgPMV0mzxn9xhZvdhf6NJ3r9YBY8rDGK84z3GrglT5zuX8IGP/OQWtN+Nwecn8hmcCJ6v18LH0GuPQU0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D11rdRhUYZNKBcFqmveXik5vhHrsjzey/aj+0ovijsk=;
 b=jvVDSZD9BlWZHNyFPZ0U9ZLX7uAmD+TIgIkpKAnt10KbQlPxnyxDXrCChd6IS31BOh4bpAqPx1Bz3CiUCrcnAxlffDqTDIsIXOdCriCIEIlfRCi7m4GjTaluG4EaV2bx/rg3kIUuMkBxFpDkotdCZC6Y18y90+HhI3RCfOCnplVnRkJpUEB2a9kxAgN2clG78W5lRmCCiaUCy3GvxL7MgbdPtIZiLCABeVTgfcohPW0v/MbNNu32IeRmSZrDINRkywwIhkWa90DSRTw6XVQb/AL/++oCAQIL8gwBmpV2Do2VuYYx1nY3KMHAZm16uDkBMX9pLhmoAMvHPv8TCf2EEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Thu, 6 Mar
 2025 16:45:15 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%7]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:45:15 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH i-g-t v1] Add support for runtime pm for xe driver
Thread-Topic: [PATCH i-g-t v1] Add support for runtime pm for xe driver
Thread-Index: AQHbjos98wlsrMbk30KIz6KGD3CPK7NmR4UAgAAIHBA=
Date: Thu, 6 Mar 2025 16:45:15 +0000
Message-ID: <CY5PR11MB6211574C038C2F3C46842E6295CA2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250306112754.1483363-1-soham.purkait@intel.com>
 <Z8nJAIyhgqhVUph7@intel.com>
In-Reply-To: <Z8nJAIyhgqhVUph7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS0PR11MB7652:EE_
x-ms-office365-filtering-correlation-id: b0936cd9-5601-4cb2-f9fb-08dd5cce4558
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?LT1RJ/7U+zY/aQUxO2y738e97+wAWiPrs5wDEkvuRXWEYx5VA6hgCxjK3z+t?=
 =?us-ascii?Q?6tmzDUTJW4+yF7iXBeTaPlwlVlhaBE0c3+9SMGZsQzX8glLH5Z6VkGrr6/ZZ?=
 =?us-ascii?Q?qobVNVzJlJpp4chiMTV9JoWEuGBqgaCoYqGepavsaA2jkQ8LBmVQeRaCUEM/?=
 =?us-ascii?Q?b76gF6BjQV8/cwttzz5+X+kMH1wAtG1xhTD8ViC2cDQ2xKOX0zBypLG+OJBw?=
 =?us-ascii?Q?5VyAjokYd4GUFrgBdPnXUQVlBX9ZnyQk2eUUEu30gP5BZCBVDiSBIYRo9PF9?=
 =?us-ascii?Q?ZFiCpUlsceHiueCyoEN6va90PedROEFepMoRc9xcTJh8Dmi2Fk+N5fNRyXhF?=
 =?us-ascii?Q?ISzq+J/a/UgpjShx0VyQX5pHZC5NmsMO0Tt4fkxlNICzIrJzUPmUkAlNF/Tl?=
 =?us-ascii?Q?bX5YUgJW6Alg0qd7TAi4ukwgrUgK8c5UuOI3Mbo13/1uOZgD6Jg8XZJ45QKp?=
 =?us-ascii?Q?JwmaR+F2jaTvj7R2x2TNnyfQBtaQ4x4Ug05hi2aK9iMgJJmA+eRwv6HfXPTA?=
 =?us-ascii?Q?CeCKp8DSYdbnX2EANoe57I+ZtMzhXsDRqgSVaIYLW10I3i2xUtUxrBL6xhQl?=
 =?us-ascii?Q?+an7D7bGM7qzzaTpP6wEXqqzaJ7Tyy1J3cH9X84TRWJjoWCLsO9o6s9zLyBW?=
 =?us-ascii?Q?LaX/rwvdePQ+fjZ3dwN/tc1l0Z+CD3sTIRWTX5IXVvdjoAT2HNuIwUhnl4Aw?=
 =?us-ascii?Q?uYbSDthFm2a/cC7sbpa0nnwUWKIH9pIxlxtTRQFJiM98Kdvd4t0kbXzCLyep?=
 =?us-ascii?Q?gacVF17NbR7opdkNopnJ2G5FVLWjVjCCL8XduydKr6HsCFfEFvbrsClNR34d?=
 =?us-ascii?Q?LNjGEr34jQe/ycRkR0svm3tvvrt3ZV67SeqHadZrZ3mOsfbfh1XD0w9Qlsbh?=
 =?us-ascii?Q?izWryfNiwV/wiXAX38oqE8tzLqEQ/MhlQEJQ7/sB9nml7RiEqtMIy3O0tFt4?=
 =?us-ascii?Q?Y0sAPtpQhQ/IHDOdIC4eEz15xQDodmk1t36MP9ROOoYVrljXgrluNvYlrn7j?=
 =?us-ascii?Q?s2Eod1jZ9xWqFdksrriiv8WbCGDPbtN0DG4gFWQnoSgYzSCGI8OKAZDzk2CQ?=
 =?us-ascii?Q?HZpOM8iwQm1Lllxd6LybOKzpHVssjgJmMK+18R/JQiKvI2KunYjhfT2f5iVk?=
 =?us-ascii?Q?YwH+rSV1iLat1I24V5RFznjW1/72JmFWhntrZFp8IeKBY1PfBtDDMnqj85Am?=
 =?us-ascii?Q?TLcuIUk1vHZ40IRRj0bmkF6UYg3215/f4+aGjQV8kDayABMjM+V1216tae9Q?=
 =?us-ascii?Q?f9djA/3jD+pM8Y3Jl+mxff6akPFdq3VB5l6SVNqcx1ZcKwMNG5CzJ0Y7OPRO?=
 =?us-ascii?Q?GihAF0F6dWxS1ZPIC5zX2xoZCYQwO6s5MKQH1WM1eTsxuNhRdb/BpdUv64OA?=
 =?us-ascii?Q?NNTP+YOL7+oHYihiaJWYyQyFVl32tNd37OhSVbSE+Y/RK94viyhQJgo6oCPC?=
 =?us-ascii?Q?LcJBkOgX3+hLKnkg7gWSNwalJ9Y+Ve7w?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cmnGpzlBCwJ1QVhBaRdwWIZNdmiqBh030vJSkHrcpr5W2f0yjoaxuzqa4QB1?=
 =?us-ascii?Q?/mhVdGQL7uLqaOu1Zr+iOtfZJTy0qZBXzgoJkikKGUoF7jQiB9GKkbbR1zqV?=
 =?us-ascii?Q?6QLNLEEIWs4gbcGpEs8g6WWlVkHcWkXqev2xKTemv40y5aayctYk2VobEvCX?=
 =?us-ascii?Q?pzVtJSpsL5AfgtLKbYZ4F3Mo6eLz+gPjxjF6rvyxLRuHFumdCWDnECg81S0K?=
 =?us-ascii?Q?sScZLpqG3XP6rktaKbTHQX+RN/jnJUxCoxMVCrDaq/cXeXWj7Pb7XKUmpvZ+?=
 =?us-ascii?Q?mPUEqrwaUy+/C0LbHhzUaz9C9ktoOkyXCVG842x6Eu8d4gd56pO/TaxnV4Xr?=
 =?us-ascii?Q?5DpffuP7cyIR/GjASEEAJG0qPWI40garBKSq5MORGNQSHDFDmTLDPOLOPZPp?=
 =?us-ascii?Q?SQCY8Cts306LypNiFSmv4XiQfdtsAtZuBNqr+gHYP49zCRpYQ01ZB5M8rvGp?=
 =?us-ascii?Q?waA5RIWs0T9z/XfaYHHaJdGho0OHucSaXiio68ReK1YJjOrbp/tJseBat7+W?=
 =?us-ascii?Q?E9AavJy1ukwGlL4Nni6ZOSKPC8qzr9Dv1lwxQSAZvUU6rkFlCSDhp76V+2Hr?=
 =?us-ascii?Q?BQLiZ2ARo7CvfaMDUM68KUvg0N7wNS9Hj4+GzmeZfMFYRirtVwUk1DLwv9cn?=
 =?us-ascii?Q?HhFl+BCYK4WuaZOgFhFtj1kLfhCUKU6B2ZNTGONOje9i7kIXXuRAOIqfXJJ1?=
 =?us-ascii?Q?bPvYOFx6cw40kafWBt4cPMXydmOBCyG7ucrE9o1fhbVa0uO3ORN9gADu2sU6?=
 =?us-ascii?Q?UrqyufoFbr5Bme0G9fq4WsbRTBwYVCVkYzHFZvwAXv39VtshUpKwrdrmFKHs?=
 =?us-ascii?Q?neuHuhMG4h4yn28SQctAxW/r7GqOOE7M3TSrcC3N8AAzxl03npihmQkHoBRe?=
 =?us-ascii?Q?hYyeRcFzejlxZFPpssGerUotA1t9y+p0HfmlmF1oqrfESWg9grxEUk9ZP58s?=
 =?us-ascii?Q?01yNroC1hBMf6PmHNxMa4df2bWAx/gvGqG9nZGweqx5mkUUeStzfMJl6cQcv?=
 =?us-ascii?Q?Iw6doW9Ev36bi1IhBR8WyLFHz6OjCHhuTJIFFr+ahHND70KKTugQmHlvlCfB?=
 =?us-ascii?Q?fG93KLc5ImpQc42OXjA+hbtRB9FPSfJA8qqCp0x3y2OPDlmygFuMwkxalsGu?=
 =?us-ascii?Q?ULtxwOrB1igXU7zl+ijFguEPUcodtqE81mcx2YTMEJRG12PLeIcjoDdiMDsN?=
 =?us-ascii?Q?lYAkaDlIG3fTUscE3VcVMH9uv63/jrqWgzAPBU0D3yEegCseo+T2jOLG80gp?=
 =?us-ascii?Q?Uv+mARgmGSr1ukR41hnMx+mi71q+zivWLThNMafCPudfB7zNblVBsLAPcFnY?=
 =?us-ascii?Q?qeUTagds7J8A5tNZyZhwTLQlVr2DbFjGkiYch8DvAZgjSKmXWf2AVU08fcDm?=
 =?us-ascii?Q?PQGgVtDYl824rgMtRJGzdAVpI45gWAKXtnZRNDRPoIGna5MHkCG1ImgtCPT8?=
 =?us-ascii?Q?0uqUhhmsJoy3v/QW14g9wXEId+FDMhMTLI4tMRukwVJkXekLzp4NrR4PlFk8?=
 =?us-ascii?Q?xNGSVu5vIv86GE6cvoB+b/iLeayPuwDfgJZ+WzcXpmtLmtJpXSCNOM5rM1sU?=
 =?us-ascii?Q?tWUeUc/XTI6bUfNhctY+XboJVx5XH1u43a85Kefq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0936cd9-5601-4cb2-f9fb-08dd5cce4558
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 16:45:15.2329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AqKje1tOG8R2/G0jx/Nf/0viaR4xobPsaRsRJVe6d59zikhy7TmpCI6/iB2eqntvB6i0MKWT1vJlLqBZexLFT+4RfgPu9a+gE9bkd/p7RZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
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


offlist
> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Thursday, March 6, 2025 9:41 PM
> To: Purkait, Soham <soham.purkait@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Tauro, Riana <riana.tauro@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: Re: [PATCH i-g-t v1] Add support for runtime pm for xe driver
>=20
> On Thu, Mar 06, 2025 at 04:57:54PM +0530, Soham Purkait wrote:
> > Add support for runtime power management for Xe driver.
>=20
> Why?
>=20
> We already have that covered with xe_pm d3hot and d3cold tests.
We need to this tool for e2e validation to keep the card in d3cold for long=
er duration and verify the Package G state counters by Python SV. It is use=
ful tool.=20

Thanks,
Anshuman.

>=20
> >
> > ---
> >  tools/intel_pm_rpm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c index
> > 08c25ca8a..945247d2e 100644
> > --- a/tools/intel_pm_rpm.c
> > +++ b/tools/intel_pm_rpm.c
> > @@ -151,7 +151,7 @@ int main(int argc, char *argv[])
> >  			goto exit;
> >  		}
> >  	} else {
> > -		if (!igt_device_find_first_i915_discrete_card(&card)) {
> > +		if (!igt_device_find_first_i915_discrete_card(&card) &&
> > +!igt_device_find_first_xe_discrete_card(&card)) {
> >  			igt_warn("No discrete gpu found\n");
> >  			ret =3D EXIT_FAILURE;
> >  			goto exit;
> > --
> > 2.34.1
> >
