Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C05C02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 10:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBEE10E008;
	Fri, 24 Jan 2025 10:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHxPI41J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0DA10E008
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 10:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737715598; x=1769251598;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pg39t/YoKTARvMwC7fma7GAHQ/7ZaGNZFMYkZ5mhyhA=;
 b=mHxPI41J5UP9fr3eGEDHi1vfYXY0ML3jlGU2ObFCMDpPJA4FQY7WnCcW
 yBdFAFKff8m8vnTIbgTIlUI6X3uugRfJU+LhPb5wcNum5JTPsEAg+m4tG
 5zT+vsfPqsDRsaUX/0tUU2P5wW87oFY5RR6U58g+Ogrzjkah/dhCsJJn0
 kW9K456/9dOy+U2AuDrfsOPGYyC06HSFRR9Xi7MoVR+6sx7duO5iClW16
 BPRyGvn7lSsXU/GVfLf0xeYNrh1WuNtlQ/kDib0n8t6A0Ec4ezv03YTvW
 5SRnECHHuBsdsOf/JC+rSCRFFFM3fKN4Wd5aydhygIhAs1IcEYiubJOT2 A==;
X-CSE-ConnectionGUID: l75Gi/G9RrGCFM2G+Df2QQ==
X-CSE-MsgGUID: IHeFxIgaSs+oSFM3Cbbsfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38410689"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="38410689"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 02:46:38 -0800
X-CSE-ConnectionGUID: N0pllCWTQE+Cd/mJexp2Lg==
X-CSE-MsgGUID: 3XMBobutQTq0bWSJIqpQfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="108279867"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2025 02:46:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 24 Jan 2025 02:46:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 24 Jan 2025 02:46:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 24 Jan 2025 02:46:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxMiAReR4uXz4Fj+7KroR/mXe90FTMf5MK580qoIEbVgq3hMcqJ7bH9GGUWmYOy7fmYszx4nVy3qKG2BcKY30ElR6rBaSrCSLzFHITowgbRkJcPyVzXcYyIqOYEA0mKjRq0fPLFldjHqcSLv0DYg+jWqN6x42plpMMngid531B40W83q+mz1sGMddb7RayfN0nIOgItrbDvTmnRzmxIVJs2A206RlfXQGVzwr80WluJZ/C4NBkPBo4xfoLBzQxUfxtYIoUXdl+jm6xXFTWbqQupR9KNRKq8uNq2rfi42bGYzrCP4+T6CvaWzsT96I6erzufSxKhIepWh9U3nt+72+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmUxc+b6PZ/Oufi2Be+Owp1q5YIJKGUOGyhoe6V10o4=;
 b=D2IgF0QObeMQmewPCmR6B/fiEAww47fLQGaMx4DP4VSmdgWj8qLh4wYdynmE1v4XhY3VMpnvCjNGYMHxImS54bn0IjwOWAgF4iWaGb2XJc7THQQBwlHKS11+Z0phdyutkEz6I7ndKmjOK0TQ6wDIcSfEyZVEK+0lCVXwKA9eGl0hTZ5eG4WPUGTYdqxXnm58u3Pc7ityZICGQ9fQLzzB0TAeoNeo9ImMkCcUu3kA+nYM8ivVMe4xnhxfKcHWPqpcPviZdZHRHhcGvf0xH8ct7u64pdd5riiHhJPzwZcgcXehzbuM0faSjgeQyrq6AAfQ3JsvtCKgKEmlvaMEvUDYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Fri, 24 Jan
 2025 10:46:32 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8356.020; Fri, 24 Jan 2025
 10:46:31 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "marcin.bernatowicz@linux.intel.com" <marcin.bernatowicz@linux.intel.com>, 
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "adam.miszczak@linux.intel.com" <adam.miszczak@linux.intel.com>, "Kolakowski, 
 Jakub1" <jakub1.kolakowski@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v1 1/4] lib/xe/xe_sriov_provisioning: Add helper to
 read VF's configuration data
Thread-Topic: [PATCH i-g-t v1 1/4] lib/xe/xe_sriov_provisioning: Add helper to
 read VF's configuration data
Thread-Index: AQHbbjd9kbveqVfWpke6D5xCtDg+IrMlvcyw
Date: Fri, 24 Jan 2025 10:46:31 +0000
Message-ID: <LV3PR11MB86957B336B9F64B73E0EBD2AF9E32@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250124081039.31201-1-lukasz.laguna@intel.com>
 <20250124081039.31201-2-lukasz.laguna@intel.com>
In-Reply-To: <20250124081039.31201-2-lukasz.laguna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|PH7PR11MB7148:EE_
x-ms-office365-filtering-correlation-id: 35a97e8a-e193-485c-7ce0-08dd3c645d7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oArFy9wU7SIx22rN94eziqTEczJM6DSPhw21mniWOfUkdNxatOLNmn8JoaVf?=
 =?us-ascii?Q?o8kbzJ/GsFxspLCm90TdsW06Hy4wgav5Z3AvcAorx0Xgh5Fnz/a2CLGRCOKM?=
 =?us-ascii?Q?TyDdYxeAxqrxndZNsIzOkh2iYIubhoZqoVE7kIoxNKLcblO/35gnrOTYvkGT?=
 =?us-ascii?Q?VQVFF8MID8Yh3zX2Gpf1tDjEmPr/zNCC1+XXWBLk3SjAspv+GYcmxSJSdas3?=
 =?us-ascii?Q?/kT+z/Uej2/Izjv6y/moEWW/I+0/jry5YN/6sZ4eF06g1YMrO1UkONMC4WVf?=
 =?us-ascii?Q?4dEfFYf7NRmjwL1JV8LxxqbDWzdmr87pFNVfhtdvXtswcAQrCkUNqb8e81oM?=
 =?us-ascii?Q?I7fH7lL6h4H/272y2D0Xp7PVY/fDS7GC96xmHEFNhn95avuPUqOxqdX+CcOR?=
 =?us-ascii?Q?GGfbWjHkpKbcdTEU7TX3lIyddv05jqo16EXAoX3d4PXRh3sXFMpO3aTwh7Bd?=
 =?us-ascii?Q?j6Hl9jfkhjnnEZqrghaaCRUE5gpbo1D5rQ+aOz3XU262VpUSJgNwh2PsqG8O?=
 =?us-ascii?Q?gYAuU4HL92jCfBg0maVEirszqhvzv9YQJKeSSG1bDJ9iiEPss+8bdRuXURct?=
 =?us-ascii?Q?24h/l+q+SmeHcY0pDyvR8klwq2X6xxAEfcay1t1fJHNN2AsMm8uESPNW7rhN?=
 =?us-ascii?Q?xOWDoZzmO7Clt8JsjdfBLmTUU5wD2CwVRaGX4uD8BUOMrHlMsntESS0y2s/N?=
 =?us-ascii?Q?Fg7dTLA+pFSzCfwAV5ntT/WFlt2Huezm07q2+1lB5JKYqzScYo850KubM+e1?=
 =?us-ascii?Q?8ZAzP9dPzIwvOGGuEZN+75s1updwVLO1Maj03Z0LCHmio2oRYcU167rmY1Q0?=
 =?us-ascii?Q?wUSIZYOBbRTHWEluAFahxxCbflqn91SMut5AdjdRlaB/lSYk4Pi1WzITs6nJ?=
 =?us-ascii?Q?wcl6IdjPQ5l2j+89dXLRiL6Rti60u713aSKFFL1zceivNOfj6AFWp/pZHqZ5?=
 =?us-ascii?Q?eJpnWyhAnoKAVCcRXbBiJbWAuk0GtoCBFI2kGD0WERDpTZ5BCkAlOh0XGpDh?=
 =?us-ascii?Q?lV2JMtPRY9ncgXQ6FE+JTvw7MCtcloaJMswrugXjh3ZG/bdB17a8vZR4SNxM?=
 =?us-ascii?Q?xF9Oy3ajF7aKji5vcKUe8Ap8OmxaaJXcUCD5zEc1AkcJUwcbesTia66lf5Eo?=
 =?us-ascii?Q?b+VvPZVzbh51kjeYGZ0Clcnn9+XP8QgL5iY8yE/uYAJ4bNWYHJG/vfBrwD6G?=
 =?us-ascii?Q?znsxn9LW89w/aUtbBU6R4YREsmC7gSTSC1Nl1qOLm2kiz1zV1QEbjAeQZryK?=
 =?us-ascii?Q?289ryNng3PCMXi405wQwcyAsKYOY71mX1pEAJFKsik7+ijvrMy0FkSuUsi/t?=
 =?us-ascii?Q?FQDvX1V/kD9nXGEFKzltwJgMo1CfFSPoOVLh4xuOuaEF9W2yd1TiP7gaszdI?=
 =?us-ascii?Q?KmEYqU00F9X3LJxPE4S3FqVLKGAvnoJwObFUt8kbNvk6KagLjjlqrlYCOLjC?=
 =?us-ascii?Q?cagkS7XcmGgOhcLck853+QIgJZqi3s2F?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z6QBrjE7VLv8lQxdcvMOYm6za8/SnWmulyirIoK9owO8LKxWt81s0fzDnc3A?=
 =?us-ascii?Q?6BQKY0+ExvTzuN2Dv1+jFMiCT9KCZL5jLBKX/xGOPqfc2R9i/sbSkC24/D5U?=
 =?us-ascii?Q?gydXdkeiLPzwSqYTe28XsBDyyjMzIAyAuCjaqKoFADXSO/Lrozu+FNFrJz8m?=
 =?us-ascii?Q?Pn3GnWXynT9//8Csnbhm+ztTBpikS3D7YfWkx1qzo6YHtrAEoeOIG0KUNVxx?=
 =?us-ascii?Q?PstbEfN8tvt+6tm9V8cED/RHo9oO2PtLsmGO9Wc2VuuuhfNsgy+2DuAPz3HB?=
 =?us-ascii?Q?gx6Q20ndu7TsG7qgjuWi9/7NA8v9UfCnw8M7PSHL3iK0LKsVE+owpQq3QA6/?=
 =?us-ascii?Q?Nxs4efcw/Q02GZ4HbLtqplP/B1FiQ0YaZpj8dRfrLGocRLE9aQzlzVeDJaUf?=
 =?us-ascii?Q?exM0MnjdeOWTxJQQ0f2R9y2+/wlg6vWlnbVJeeAJGf1UeBYm6TQ7Hey7UYhn?=
 =?us-ascii?Q?x3D849KDM+pZMmoa1VhzpdeK2P6HKjkcpQaDo0bBeTm31m3zsbkQJTqeqL2T?=
 =?us-ascii?Q?28fzFsN91cbsK2kEdWCFGnV++9kQat4mqVHs+2seQSqPiQw6wi6HM68VJGwO?=
 =?us-ascii?Q?zhP0nLGE3Z8LsnboYvysuGEUuxmJskNHoQChwGf7LqaV+IxePTVTgeSCspnf?=
 =?us-ascii?Q?i+b/DGLvwqvZY9bV13PvzcMy+t8G6fkRMol7fXUkeMfa9s7dOWo/JiSBZDg7?=
 =?us-ascii?Q?Tw4LlRKUpYfdlp0gcOyvbHj/9JwQCh+WeLZvT5d5Q7YHEtZ0Xh3ZvtwoN/FX?=
 =?us-ascii?Q?VYCKfKMAHuYp389ld66yTwK+uSDLJv9+8JQeu24wzioEeg5gge6eAj/0OBRh?=
 =?us-ascii?Q?k6L9MfQJd5BvDPyaaRMOmcrnyJJNtw55nss842FnpV/2SYZjLEZegHzAwYs4?=
 =?us-ascii?Q?IFwERQKca3He/pKiN2O1KlWx5+hLgipNXZOYndCK61oN1CyU4R+fV5/Sgu1S?=
 =?us-ascii?Q?sYh7fEMGrcOcsZyqH4oQiNU+wYv4Tc6ZWB6fUA+TeOecxAOMIptdGsF8Vv9k?=
 =?us-ascii?Q?pTodbsbk09AcoDZH66mlZEY1mK9lCInwNzo+1imr5tfUv1CHZkzhUF15Kaom?=
 =?us-ascii?Q?ZDvGlmHQm+V0qEnGLOHd7ZvKMaQ5UjVirNIWvK96JDeggr6Wyi6y7QDew1aK?=
 =?us-ascii?Q?lyLD3mNhx7TZFk/4BfGm5HQFH0qMPHITkJTuJt+fE8aOmrU96WCCpynANKRy?=
 =?us-ascii?Q?72WqGORlMaNnE6jnUHvDA/LVbXvoHyWlW032HLVQSIpuz9vMQVUDu83CZQlf?=
 =?us-ascii?Q?HgwCrTfSP3kiUYF6UsNM2uLx5niWcZ7ti/v4yRsapK1Swfz4rasEz2nqtj9B?=
 =?us-ascii?Q?VqAb6pjeWtoO66Ga2XgLW3OhzsgiIZ3GwqVVw65AFbTZ3DtRTZR0gGXv8N8g?=
 =?us-ascii?Q?fLFGIvcAtfvy4/b+kE2k27k/YEuADDgy23e5aESI0lx4F5jUCV+uc9uuZZvK?=
 =?us-ascii?Q?x6OMvpdVwveuOjDLSGp+R4LWn4KeqqCX5V3AKxMtaptZyC0kUUfuKh8xXnti?=
 =?us-ascii?Q?qvTUf5QeoT4+wmRsSnL6Bb96VmveRIN4Te0Flm3nz9huv4VGFbJOuIw+KpR/?=
 =?us-ascii?Q?ljVG7taPYGXD8AWBF3oJKA7voJkuqXuRJgaZsRR8rSfV6Ph0FFJV0Y9bC++r?=
 =?us-ascii?Q?2w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a97e8a-e193-485c-7ce0-08dd3c645d7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 10:46:31.8855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lp668ZHu/k/M98A7nWP+XeBCSLlUoS1TmfmtmflUWWAxCd4yKCHQUjIBNeJdEPWzKB79CootDDNdeUnpueqDrvLPa4PztI+9Fi5P5/bvHxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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
> From: Laguna, Lukasz <lukasz.laguna@intel.com>
> Sent: Friday, January 24, 2025 1:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: marcin.bernatowicz@linux.intel.com; Laguna, Lukasz
> <lukasz.laguna@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; adam.miszczak@linux.intel.com; Kolakowski,
> Jakub1 <jakub1.kolakowski@intel.com>
> Subject: [PATCH i-g-t v1 1/4] lib/xe/xe_sriov_provisioning: Add helper to=
 read
> VF's configuration data
>=20
> Add helper allowing to read configuration data that VF queried from GuC
> during probe.
>=20
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>  lib/xe/xe_sriov_provisioning.c | 80
> ++++++++++++++++++++++++++++++++++
>  lib/xe/xe_sriov_provisioning.h |  5 +++
>  2 files changed, 85 insertions(+)
>=20
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisionin=
g.c
> index 22035ffd8..5ba348131 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -4,8 +4,10 @@
>   */
>=20
>  #include <errno.h>
> +#include <fcntl.h>
>=20
>  #include "igt_core.h"
> +#include "igt_debugfs.h"
>  #include "intel_chipset.h"
>  #include "linux_scaffold.h"
>  #include "xe/xe_mmio.h"
> @@ -296,3 +298,81 @@ bool xe_sriov_is_shared_res_provisionable(int pf,
> enum xe_sriov_shared_res res,
>=20
>  	return true;
>  }
> +
> +/**
> + * __xe_sriov_vf_get_shared_res_selfconfig - Read VF's configuration dat=
a.
> + * @vf: VF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @gt_num: GT number
> + * @value: Pointer to store the read value
> + *
> + * Reads the specified shared resource @res from selfconfig of given VF
> device
> + * @vf on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_vf_get_shared_res_selfconfig(int vf, enum
> xe_sriov_shared_res res,
> +					    unsigned int gt_num, uint64_t
> *value)
> +{
> +	FILE *file;
> +	size_t n =3D 0;
> +	char *line =3D NULL;
> +	int fd, ret =3D 0;
> +
> +	fd =3D igt_debugfs_gt_open(vf, gt_num, "vf/self_config", O_RDONLY);
> +	if (fd < 0)
> +		return fd;
> +	file =3D fdopen(fd, "r");
> +	if (!file) {
> +		close(fd);
> +		return -errno;
> +	}
> +
> +	while (getline(&line, &n, file) >=3D 0) {
> +		switch (res) {
> +		case XE_SRIOV_SHARED_RES_CONTEXTS:
> +			ret =3D sscanf(line, "GuC contexts: %lu", value);
> +			break;
> +		case XE_SRIOV_SHARED_RES_DOORBELLS:
> +			ret =3D sscanf(line, "GuC doorbells: %lu", value);
> +			break;
> +		case XE_SRIOV_SHARED_RES_GGTT:
> +			ret =3D sscanf(line, "GGTT size: %lu", value);
> +			break;
> +		case XE_SRIOV_SHARED_RES_LMEM:
> +			ret =3D sscanf(line, "LMEM size: %lu", value);
> +			break;
> +		}
> +
> +		if (ret > 0)
> +			break;
> +	}
> +
> +	free(line);
> +	fclose(file);
> +	close(fd);
> +
> +	return ret ? 0 : -1;
> +}
> +/**
> + * xe_sriov_vf_get_shared_res_selfconfig - Read VF's configuration data.
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @gt_num: GT number
> + *
> + * A throwing version of __xe_sriov_vf_get_shared_res_selfconfig().
> + * Instead of returning an error code, it returns the quota value and as=
serts
> + * in case of an error.
> + *
> + * Return: The quota for the given shared resource.
> + *         Asserts in case of failure.
> + */
> +uint64_t xe_sriov_vf_get_shared_res_selfconfig(int vf, enum
> xe_sriov_shared_res res,
> +					       unsigned int gt_num)
> +{
> +	uint64_t value;
> +
> +	igt_fail_on(__xe_sriov_vf_get_shared_res_selfconfig(vf, res, gt_num,
> &value));
> +
> +	return value;
> +}
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisionin=
g.h
> index b4300ec2e..1a05c2c59 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -90,4 +90,9 @@ void xe_sriov_pf_set_shared_res_attr(int pf, enum
> xe_sriov_shared_res res,
>  				     unsigned int vf_num, unsigned int gt_num,
>  				     uint64_t value);
>=20
> +int __xe_sriov_vf_get_shared_res_selfconfig(int vf, enum
> xe_sriov_shared_res res,
> +					    unsigned int gt_num, uint64_t
> *value);
> +uint64_t xe_sriov_vf_get_shared_res_selfconfig(int vf, enum
> xe_sriov_shared_res res,
> +					       unsigned int gt_num);
> +
>  #endif /* __XE_SRIOV_PROVISIONING_H__ */
> --
> 2.40.0

