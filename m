Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1CBC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 14:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85F610EEDD;
	Fri, 17 May 2024 14:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CPmfy9fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74D210EEDD
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 14:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715954997; x=1747490997;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y5NszhMapLLLI7ZNqZnT28sN3ewL4Iqh/fYZqNwwL6w=;
 b=CPmfy9fxFm6Iz+Mo8amIgSzdjW6UGPgML7bu3Zd+oJOlqAgh3u3TauET
 KCb9sPLSr96Az2dkCLVXr+SPagk41nVCCJcRwaqrjQ8TcxL61AlyzPGbc
 3IIJqvHPAGmqTn77hmho2mJVQqYyxRRPhWrAgceiGUY+es/EWV8EDTphl
 yZLECMlVcPu+clRHEpzuphswbehRGJDmTfLhNO26xg4YLX8f/zXnv4UFn
 F14u1PWgc6Gh7d5bipUrSzQhVzJRnx03qvaavAvkqtggT37WAme/4Su+e
 xPUuixomnjT8B0WZ+rqzqzgLglb7XlSd8SoMlQdZRZ7nRKaNTFjC7clUp w==;
X-CSE-ConnectionGUID: GU1iQ3UhRF6muf8P+xgC9w==
X-CSE-MsgGUID: LEQhUuKISR6r1ZQR5zdMWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="15961851"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="15961851"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 07:09:21 -0700
X-CSE-ConnectionGUID: dWirzDRhRKKpWQCdSI7Haw==
X-CSE-MsgGUID: cKJBr7nQQFSEVd6J20Z/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="31625758"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 07:09:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 07:09:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 07:09:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 07:09:20 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 07:09:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSl0UVuVmtZxaV0oQc18VBJ/M6oGlmxGKpLljakcPfshvvQXH5M7I6GCXAC7cvlR7oY9FPWyHcT4+Or+L4SjuABZY1ePbGeyUorHQguJ1J0ThKo07/AyjTzcK+V13qUwU/HRpeKzh37KIbBPwykjDPUCN7BPlfqXsLdIBOH2dfZ5Huf8ZX3lzuG+KyRXBRIBbeHO+lek5tK0kaxIOf16fQHOtCyCoHqT3rlCpOGK9u/PajF+Vgf5sK80Uu1O5H0aX6f3NVcuR3g5Io3j8L9sv7Bq6F3AThBZkLkkEnm+MPonbd8h/UgKprZIfMkz96zun89vy8D2LsYInOXMLPKM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAubjV7dMC1n6qwitN3heoa18QzkI8qOn6/PCqBJq0E=;
 b=JXRVjaciTh1Ypg+PZrbuyUkerp1yoYjtgtJbEg7p1uO5WAhi/v5TKcyDlq8JEbSO6A4AP+GwAZ3UtUJ57uhKg6Mz1QHfhCxEfOg/DPW3xZwyz1p5SgGs22DsWxFevah+oKsPvFXEtTkyr+jP+rSNBkCfsajnOf/NoP6JEpMIfTJPYXjKcqiv3yn5/W+QA3ON6pX7f+iy+PniTQNW2kpN9i6X+XTK5G6y7CeqPpNVFp4meQuxpPRrVatfLyZ4LjuGzERxobqTzlYFL29vjBTPtP9R+6ORK1J7vCUP1LFLt0LGjLSNUUTOEw8DJJ2NrqRZlQztkR7rWQO87z+PtDLs5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA1PR11MB6465.namprd11.prod.outlook.com (2603:10b6:208:3a7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 14:09:11 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7544.052; Fri, 17 May 2024
 14:09:11 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH i-g-t v3 01/10] lib/xe/xe_util: Introduce helper functions
 for buffer creation and command submission etc
Thread-Topic: [PATCH i-g-t v3 01/10] lib/xe/xe_util: Introduce helper
 functions for buffer creation and command submission etc
Thread-Index: AQHaqE/mNA3qoIK6s02U9hMfrM50vrGbdDEA
Date: Fri, 17 May 2024 14:09:11 +0000
Message-ID: <SA1PR11MB6991FA45A0D910A2716A0FD992EE2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <20240517114658.810283-2-krishnaiah.bommu@intel.com>
In-Reply-To: <20240517114658.810283-2-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA1PR11MB6465:EE_
x-ms-office365-filtering-correlation-id: a1c7c5ec-65aa-41f4-5d1e-08dc767aed17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?bM5csNRlPy+GjaNRWu3xT7irrjvjpL+KwXr1CAdHWwC/hibqO+q9jQPvho8H?=
 =?us-ascii?Q?0dOSbxZw/blQTHFwfdCC0oBDPYenXvBDDKxYca/3dP1dB3waUu3GOgZcI+zn?=
 =?us-ascii?Q?f9A8bZXg1ikqIR2HwZtnBSNXKrAENBmA1iVNNr8u5Af2lxFy82mRiapNzqOK?=
 =?us-ascii?Q?UA+Eb8PzyrZ9GqdP1U6Ie3rYTO/klM9AtZVYvJrH3wHpX2oRw3IdsT599IOL?=
 =?us-ascii?Q?gdERrMVh7OpsruR1fNgNejkZO51TCBWfQ179hInnpLXzTHWDqbGVBcX/8tWF?=
 =?us-ascii?Q?5XxGfbVSwLNkaN1O514JYcpqWfBSliJlGYQNg94HARmt2KPjfr04UiHTL+xh?=
 =?us-ascii?Q?l/sERzfcblvLTf93hFHNhIVxjtMqJ1efR6A/nOBx107kXZrK6KdtuRDclRJq?=
 =?us-ascii?Q?b41iSVQVzbN1SZRxaUzn/PeBba+PFK93cs7eNXHKYAJ/cfLpA0Kvp1JV+N1J?=
 =?us-ascii?Q?67qNf6ohcbkoVYiClyGXISv83+W6+yz7pEHeClR3eWFwpKxTGtKoQS9S0Jr1?=
 =?us-ascii?Q?hO3GM0weZ59Tg46ZYO9Mk4lC4By5pbvp+Y1ZnVVY8z09CJHPzfwHmiTTtvMY?=
 =?us-ascii?Q?kt1eVOslqJp+KLXPqKT0i3QS/25zA+dNM6NrNYr+ucuGxYD0jUoYgJ65dtSV?=
 =?us-ascii?Q?bntRFyRKsSHTtr+Kg6H0YCf6ym1SzyqMm7Af0LseyLWkD3TU+Zg0H4gepYVS?=
 =?us-ascii?Q?yp/vKFYZnmk5nN1A8E2wnfASDPAN9OAcf9Hb9C1Htnmz1dJ7+qiLHlF0/6hs?=
 =?us-ascii?Q?gw8YdOftDEo6KZbYxN/HQ2bTl/f51mRMysXaD3YYuDPeympWQZWQitRlJIsU?=
 =?us-ascii?Q?cN1yIBkPA/BC9XXUZZmL3M6D98ISEyVj9gSEpTdzbAZX1D9pHQh9OUATVU5l?=
 =?us-ascii?Q?HZgZMvly5G8X/YyEqTe6OYoJBJh4mzPrV2uwspng+w8NA4v3n6w6UkOGjmtk?=
 =?us-ascii?Q?y59kXOff8F2OdVi7S2KcT48AWC+uu2scYpWawjDf/APkNuJR3OLLPnvNplFL?=
 =?us-ascii?Q?guzotfNWvfd4v7MiLWV+BFLF6QP0dq4EdbAi8pCVKSJAH2rZYrPQCktTjOxE?=
 =?us-ascii?Q?0VkAu4Q0JkvTSkKitivuxn94jvsf14k70jcwu1gAr3+lfCJICmOPbgsEvt0w?=
 =?us-ascii?Q?T1ey72BbIiPTD9Z+F2dLusUyEJqBpfVV03UVBZlt3f0FnLgUEPwyrviRiSvg?=
 =?us-ascii?Q?Xy6HvfFSANV1FFrkNwnnDNcfDHcxRDVJJiDEZW5Rj+RzH9MyRKzkOJg/8VS/?=
 =?us-ascii?Q?TPGrmf2D0p6dgLWotmGTOawXRQ5aoYhRft32305QfsdhgzI0n9JQE486m5mA?=
 =?us-ascii?Q?HYjHx3EdheKENYR7+0975SNAn0vcLEdz9/XDLszQMXSlIA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4Mev2bE62QWkn8xQAEE/RxtnLL8dw5bsGmT6qYdFUkRXvYrRFfmvr6mXT1Zc?=
 =?us-ascii?Q?s13u8o8R8OXEkKGYgNTs+g7iRe2P791EMxvROmiS9X30CPNNx+J+02GgNmyP?=
 =?us-ascii?Q?SFQqiM9F5+daJEqdsl6V3Pp0NAxdLTZPVC8Nx+jFok7tI6MWVoPzwWq6xK3P?=
 =?us-ascii?Q?vrtFA57Tz+S1vUNmREY+o6fjarc28deVIXYIfsZ5DTuoU1fpBusLC+OE9d2F?=
 =?us-ascii?Q?l7Hc2CiT4/Y9lz2yyTgD+Y9MGnCfxULd/piDrS1TS7AfsMO8EY43vvgXxqLX?=
 =?us-ascii?Q?Vd27ytB02qUynxWI1cTClHa3VoAhvz56JiXkkDVm+Yn+tzVkv5uFUM8EKIvG?=
 =?us-ascii?Q?Tx6hwuVJNn117gv21qRXpFJnFNutgMl6Eh0Xffx2u+tRsYOC5KUbzeTbTBNr?=
 =?us-ascii?Q?hpAB0X1lQdyvnoFwYQeLe4RNQg0Z+zFxWLjieHWOjztX9iYShL/R4uF6uhwk?=
 =?us-ascii?Q?cHW3yoTYnBt7RNvn759Jqw21CThpNhl7yNWLf/Fp0RczOtTe6OBmm0I2VUN+?=
 =?us-ascii?Q?OVmhtXs+agFU9Zh9zxE1A7xAFJVre7ZdO2r8IqXywAYs3KUiohlf/OO4jijD?=
 =?us-ascii?Q?WXO7JbpjpowdOA4ZQiSXgtwjfVKNAQNrqzMAd7IoGhH+3KkyTq6fCdOU+Wbo?=
 =?us-ascii?Q?a0Jxnkzb3Cl1avugqx0ePoA7RvAgLsWFQqhyCmjAvK1hEFLOby2YP0MIvWei?=
 =?us-ascii?Q?ICknOj4NjwLnv1K58cVfLk4WGju0OUBGwdCRPYof+n+lLY/PwydQqrLkgp1k?=
 =?us-ascii?Q?+S5mjDhQU+YNMzs4n3KagjzaqBDbfJXBr8uNRJoAzeg/13mHq4XLjAPhkhMo?=
 =?us-ascii?Q?BusRETriEzYdXcYLZq2xUQKR8JDk5zWDSD2Nx2NA32m20s/RlOSpPl70ys1f?=
 =?us-ascii?Q?Jjoky3eMis1h76/QdJqYWabx6M3PL17w1xdr1XueJYziBatofckPYNjxygXY?=
 =?us-ascii?Q?+twNr1tcR4qryFMNu8tT0tastzmO97go3lssr1UEDn613YIWQZEaOYK2rZNY?=
 =?us-ascii?Q?bmHAdt8D+aG8dJqbcm1U4uNI5jB3bMKQs2BCojkCBw5DXOnTuA16jZ0HcKWP?=
 =?us-ascii?Q?gE8vHy7qqdJxyW4z02bsVOWEI3X6+pn6IiDUPVUChA3MRIwjX5N7HjwV23Ao?=
 =?us-ascii?Q?TH60TO7AsvpELUrtJ3YUFjixx+YY0xvQebKr4tWWzYD8R+EK7U50HF2WwBbW?=
 =?us-ascii?Q?duBvYN8ZcQp/3jkoaLTBplFtzKTPKKqSDAd8yD7O5Icv7eMG3FgeggMe95rf?=
 =?us-ascii?Q?8HVbe8cxVyRHC7d8XqFmAMCF2YU3CrdBWuVJO8ZGU+kV+Am+KMLHIoD5LeU9?=
 =?us-ascii?Q?qXJaHQc3fTnogALV7Jvm6rdmoxCZ8P3SbHKtiHaGyWP40LFMEA+UOmIMWA3O?=
 =?us-ascii?Q?iFKgsLLESevwqxItYjWFREQtb7rcltkcMFrIaW3JvbgLOcUCoqveVqVBcU7T?=
 =?us-ascii?Q?nsQHxN1KNKQwoB/BUNNbVsMYOK6AMutdKyJaYYNLKQIHG5EB2UY9A4nd1dDX?=
 =?us-ascii?Q?j7n1o2G9QG4XQaOciYh3jyz7ONqsxVdBJ6nCQdTBLLf62Q8wrce7MQOatbI2?=
 =?us-ascii?Q?ITBD1qAKmMWK3tyE6vI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c7c5ec-65aa-41f4-5d1e-08dc767aed17
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 14:09:11.4964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Gc1BWmBiu7OuSHxSBsU6sXbF7USvbgEr9NaDWq3CwyGf8wx4SsTRSWwBlXTaBZQCKRHJOKFSvJaOaq/2ePcKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6465
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

See one nit-pick inline

Patch is:

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Friday, May 17, 2024 7:47 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH i-g-t v3 01/10] lib/xe/xe_util: Introduce helper function=
s for
> buffer creation and command submission etc
>=20
> Introduce helper functions for buffer creation, binding, command submissi=
on,
> and
> destruction, applicable for SVM and other tests.
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  lib/xe/xe_util.c | 151 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_util.h |  33 +++++++++++
>  2 files changed, 184 insertions(+)
>=20
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 050162b5e..de848b8bc 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -10,6 +10,157 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
> +#include "lib/svga/vm_basic_types.h"
> +
> +/**
> + * Submits a command buffer to the GPU, waits for its completion, and ve=
rifies
> + * the user fence value
> + */
> +int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf)
> +{
> +	int64_t timeout =3D ONE_SEC;
> +
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value =3D USER_FENCE_VALUE,
> +			.addr =3D xe_cmdbuf_exec_ufence_gpuva(cmdbuf),},
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +		.exec_queue_id =3D cmdbuf->exec_queue,
> +		.address =3D (uint64_t)cmdbuf->gpu_addr,
> +	};
> +
> +	xe_exec(cmdbuf->fd, &exec);
> +	return __xe_wait_ufence(cmdbuf->fd,
> xe_cmdbuf_exec_ufence_cpuva(cmdbuf),USER_FENCE_VALUE, cmdbuf-
> >exec_queue, &timeout);
> +}
> +
> +/**
> + * Wrapper function to submit a command buffer and assert its successful
> + * execution.
> + */
> +void xe_submit_cmd(struct xe_buffer *cmdbuf)
> +{
> +	int64_t ret;
> +
> +	ret =3D __xe_submit_cmd(cmdbuf);
> +	igt_assert_eq(ret, 0);
> +}
> +
> +/**
> + * Creates a buffer, maps it to both CPU and GPU address spaces, and bin=
ds it
> + * to a virtual memory (VM) space.
> + */
> +void xe_create_buffer(struct xe_buffer *buffer)
> +{
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value =3D USER_FENCE_VALUE },
> +	};
> +
> +	buffer->bind_queue =3D xe_bind_exec_queue_create(buffer->fd, buffer-
> >vm, 0);
> +	buffer->bind_ufence =3D aligned_alloc(xe_get_default_alignment(buffer-
> >fd), PAGE_ALIGN_UFENCE);
> +	sync->addr =3D (uint64_t)buffer->bind_ufence;
> +
> +	if (!buffer->is_userptr) {
> +		buffer->bo =3D xe_bo_create(buffer->fd, 0, buffer->size, buffer-
> >placement, buffer->flag);
> +		buffer->cpu_addr =3D xe_bo_map(buffer->fd, buffer->bo, buffer-
> >size);
> +		xe_vm_bind_async(buffer->fd, buffer->vm, buffer->bind_queue,
> buffer->bo, 0, (uint64_t)buffer->gpu_addr, buffer->size, sync, 1);
> +	} else {
> +		buffer->cpu_addr =3D
> aligned_alloc(xe_get_default_alignment(buffer->fd), buffer->size);
> +		xe_vm_bind_userptr_async(buffer->fd, buffer->vm, buffer-
> >bind_queue, to_user_pointer(buffer->cpu_addr), (uint64_t)buffer->gpu_add=
r,
> buffer->size, sync, 1);
> +	}
> +
> +	xe_wait_ufence(buffer->fd, (uint64_t *)buffer->bind_ufence,
> USER_FENCE_VALUE, buffer->bind_queue, ONE_SEC);
> +}
> +
> +/**
> + * Destroys a buffer created by xe_create_buffer and releases associated
> + * resources.
> + */
> +void xe_destroy_buffer(struct xe_buffer *buffer)
> +{
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	sync->addr =3D (uint64_t)buffer->bind_ufence;
> +
> +	xe_vm_unbind_async(buffer->fd, buffer->vm, buffer->bind_queue, 0,
> (uint64_t)buffer->gpu_addr, buffer->size, sync, 1);
> +	xe_wait_ufence(buffer->fd, (uint64_t *)buffer->bind_ufence,
> USER_FENCE_VALUE, buffer->bind_queue, ONE_SEC);
> +
> +	munmap(buffer->cpu_addr, buffer->size);
> +	if (!buffer->is_userptr)
> +		gem_close(buffer->fd, buffer->bo);
> +	else
> +		free(buffer->cpu_addr);
> +
> +	free(buffer->bind_ufence);
> +	xe_exec_queue_destroy(buffer->fd, buffer->bind_queue);
> +}
> +
> +/**
> + * Inserts a MI_STORE_DWORD_IMM_GEN4 command into a batch buffer,
> which stores
> + * an immediate value to a given destination virtual address.
> + * */
> +void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val)
> +{
> +	int i =3D 0;
> +
> +	batch[i] =3D MI_STORE_DWORD_IMM_GEN4;
> +	batch[++i] =3D dst_va;
> +	batch[++i] =3D dst_va >> 32;
> +	batch[++i] =3D val;
> +	batch[++i] =3D MI_BATCH_BUFFER_END;
> +}
> +
> +/**
> + * Creates a command buffer, fills it with commands using the provided f=
ill
> + * function, and sets up the execution queue for submission.
> + */
> +void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t
> fill_func, uint64_t dst_va, uint32_t val, struct drm_xe_engine_class_inst=
ance
> *eci)
> +{
> +	//make some room for a exec_ufence, which will be used to sync the
> +	//submission of this command....
> +

Remove the extra blank line

Also better to use /***/ for comment

> +	cmd_buf->size =3D xe_bb_size(cmd_buf->fd, cmd_buf->size +
> PAGE_ALIGN_UFENCE);
> +	xe_create_buffer(cmd_buf);
> +	cmd_buf->exec_queue =3D xe_exec_queue_create(cmd_buf->fd,
> cmd_buf->vm, eci, 0);
> +	fill_func(cmd_buf->cpu_addr, dst_va, val);
> +}
> +
> +/**
> + * Destroys a command buffer created by xe_create_cmdbuf and releases
> + * associated resources.
> + */
> +void xe_destroy_cmdbuf(struct xe_buffer *cmd_buf)
> +{
> +	xe_exec_queue_destroy(cmd_buf->fd, cmd_buf->exec_queue);
> +	xe_destroy_buffer(cmd_buf);
> +}
> +
> +/**
> + * Returns the GPU virtual address of the execution user fence located a=
t the
> + * end of the command buffer.
> + */
> +uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer *cmd_buf)
> +{
> +	/* the last 8 bytes of the cmd buffer is used as ufence */
> +	return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size - 8;
> +}
> +
> +/**
> + * Returns the CPU virtual address of the execution user fence located a=
t the
> + * end of the command buffer.
> + */
> +uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf)
> +{
> +	/* the last 8 bytes of the cmd buffer is used as ufence */
> +	return cmd_buf->cpu_addr + cmd_buf->size - 8;
> +}
>=20
>  static bool __region_belongs_to_regions_type(struct drm_xe_mem_region
> *region,
>  					     uint32_t *mem_regions_type,
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index 6480ea01a..c38f79e60 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -12,6 +12,39 @@
>  #include <stdint.h>
>  #include <xe_drm.h>
>=20
> +#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> +#define ONE_SEC MS_TO_NS(1000)
> +#define PAGE_ALIGN_UFENCE 4096
> +
> +struct xe_buffer {
> +	void *cpu_addr;
> +	void *gpu_addr;
> +	/*the user fence used to vm bind this buffer*/
> +	uint32_t *bind_ufence;
> +	uint64_t size;
> +	uint32_t flag;
> +	uint32_t vm;
> +	uint32_t bo;
> +	uint32_t placement;
> +	uint32_t bind_queue;
> +	/*only a cmd buffer has a exec queue*/
> +	uint32_t exec_queue;
> +	int fd;
> +	bool is_userptr;
> +};
> +
> +typedef void (*cmdbuf_fill_func_t) (uint32_t *batch, uint64_t dst_gpu_va=
,
> uint32_t val);
> +void xe_create_buffer(struct xe_buffer *buffer);
> +void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t
> fill_func,
> +		uint64_t dst_va, uint32_t val, struct
> drm_xe_engine_class_instance *eci);
> +uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer *cmd_buf);
> +uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf);
> +void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val);
> +void xe_submit_cmd(struct xe_buffer *cmdbuf);
> +int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf);
> +void xe_destroy_buffer(struct xe_buffer *buffer);
> +void xe_destroy_cmdbuf(struct xe_buffer *cmd_buf);
> +
>  #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
>  	(xe_region_class(fd, region) =3D=3D
> DRM_XE_MEM_REGION_CLASS_SYSMEM)
>  #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
> --
> 2.25.1

