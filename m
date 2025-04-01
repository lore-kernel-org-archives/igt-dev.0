Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7992C36018
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 13:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6277F10E59E;
	Tue,  1 Apr 2025 13:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQpqBWEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1167A10E59E
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743512428; x=1775048428;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=crl/McwMab6AlYjzvmFXl6J8tQkEMWZpZL5a6eAC8zE=;
 b=CQpqBWEzIls9kpf9P0VJJgy5WvbXKxfrLAzjjlPqKxCBS+VKYKlE8yYa
 HU9cMr0Dved8+bTpOkgBT4b2ka5YLFmgL01JOeQYlXORkO0DADJysJ2Fx
 /lDBeDLzWId+F9xs5bqK2vLVDo3h4f7BVDA66J9w1ewSmduUwRFm9QBER
 X65oD3HpITeDUgf2PNYL4ScAkeD4ra8S54Se4Z49UZALq5aquG8STV1j7
 zb/Dexs3YPPbwCIgL2RQ+HPIZKIiXSp8G9GRDMZueZbVfCt2mytJ+rVhL
 RYm4KNUSERKPyhf0wCrzVDjBJ47rDfNVHZ6cPI9E6tM449q4LFbHrSxVV A==;
X-CSE-ConnectionGUID: R7aFEFWOT4CZbjXZ94Sm0g==
X-CSE-MsgGUID: hfv1oR12RXiY0hqQGmY/+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="47552472"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="47552472"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 06:00:24 -0700
X-CSE-ConnectionGUID: 9qNJCMHcR1OiHaTpOuVMZQ==
X-CSE-MsgGUID: MSuAGFDOTMqi2bwNC2snhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="130515021"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 06:00:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 06:00:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 06:00:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 06:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2QLLb5S+v013NSy5+LfaYdUTwZ+mWpPxNR6NezDLO2npM6Xb3eoc7jCdz3Tnrny4hFH4xWJYEeG/U3MlF8uYhjnkr0U47hx1j/uSb1flZaQi0OG3Y827AWuTujjDrpytj+QrksgBE9PFHr9t3kEtgFsW5RaMLQjwLblQR8QjLB/GQ+52SD1vW97Agj2TURrRYqV4c2yjDxUb+eVyeGlyZDFef9c7r+Yt2A8zDaqQ+Mw6Ub/wuTBxjYJwnX7HC+jUU9DZUUWXZyPe7snXSDDZ8hRBDBvh3ZfmMKUllMWmXkgLe4NW3cj1mBpTOlDvF5oZ6V4/rnPLdXrl12MljGUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpnfKqJkWGUp5+2QNwQpcESafz7+IDHvH/0f1Yt3lq4=;
 b=WIS0zzj/btpKyxvK4egbVPtYSuGR3aCApmJSzhCToTQKDofma53SiT0Wd1rlgWVP2xp6VjFFBWIXn3u5e3bc2nU4jYMCZrVZlAf67WSj9zg97vANaiR0hGs+/eNdxomu5xTxIxMJGortspJ/Q1FB6vTxNbB2kFx770MgcRX5jeRMONm7WBfY6+/EpQgy0m+mHBGFpBoIEtIHGgwunDDliW8yNGy/RYExOMTZ8GB7DNUihUW0ufv/RU8Jkyz74fzpix0REgkkFGC4cDZVkMbszFXbsiFBGjFtqO1oRm1jJrO1irAh3Z+N5GCGQjpjElMsx5XxNDHJ79Xy+mdqskgTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SJ0PR11MB4880.namprd11.prod.outlook.com (2603:10b6:a03:2af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.53; Tue, 1 Apr
 2025 12:59:54 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 12:59:54 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v3 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Thread-Topic: [PATCH v3 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Thread-Index: AQHbov2cvO9n2woxsEW2sjjRBjxHNbOOwJGQ
Date: Tue, 1 Apr 2025 12:59:54 +0000
Message-ID: <DS0PR11MB7264FED822E028577EF4062AD9AC2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250401114529.1828868-1-sobin.thomas@intel.com>
 <20250401114529.1828868-2-sobin.thomas@intel.com>
In-Reply-To: <20250401114529.1828868-2-sobin.thomas@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SJ0PR11MB4880:EE_
x-ms-office365-filtering-correlation-id: 51722ad1-c457-4530-d1e8-08dd711d1914
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?OJG4lrB9cEBkT/WhOV3cZ+1rRucLEUBNbDvcKT0LrRJZqCOovl+Dz/0GKM?=
 =?iso-8859-2?Q?SxuVYipEoU+5lWx5NMXxDO5i5UxvECsrNG/a7nxPuOCkbU8CdDIsB66tRZ?=
 =?iso-8859-2?Q?LjHL5nKX6unbxR6uFqzruhbpuGsHzb5cE+1QbJEo5mWCYjwcke5JLuSw9G?=
 =?iso-8859-2?Q?Ud8NYIhTDQH+/dtUx7QfSQsn1rxR9s+BANtj4v8skI/G0VXjyPJ2TlBz+Y?=
 =?iso-8859-2?Q?DQhY8AMvrdC/2eRDUPnZC4HkSJqPtTCeou0TPdSxXpovCO/h+unZpb/2uf?=
 =?iso-8859-2?Q?KHstqv/hRDbpr9qhs8d8zTETEgVBq9COtgelNt2A1EvJCvDS0gte3dimA3?=
 =?iso-8859-2?Q?TiomtGVocCpe9AdCWdsNMwUMTa16MOzEITxope0DzakEN0DRmvSahdD4pk?=
 =?iso-8859-2?Q?ExUjqTFD6XKHWGeltGQWqRdH7uw1MOJ94+y35lPilOfk65gLRaWsgENdAx?=
 =?iso-8859-2?Q?23P5i6XUKYawTAEUQGHDrL50XMgKa93gA71fIVLS3aLCeXplrwHM5IcbET?=
 =?iso-8859-2?Q?GjG/b3DA9tPcW+gGgE6WuvpwyNGBDqZ02teldSSojE6WJZtRBMdPO58gRt?=
 =?iso-8859-2?Q?tNMBhhQH+redsybohSR7ROG0AoN+3dUO9gBIm775C6jmL90oVQCX/lUlGt?=
 =?iso-8859-2?Q?JHWfky8naDPFvQ67KbGkdUNT7VCnz96b5mi05O+StNXRwVFzfmckWjCtFh?=
 =?iso-8859-2?Q?Xplk5xGz61goSiQNbGEpC9cUjQhlGtr01wrjwn/w0TxDGtwerpLuRMY4pQ?=
 =?iso-8859-2?Q?bRrl+xC/JWJY8ggSctjvS2NzU7I5QR2nJtCN0eCz0blKTHfPpqSnnkp3Z8?=
 =?iso-8859-2?Q?l6i+T6zuOiJF67qMwIzGUcAoEAjJunRFUWT7mFzZ/COKd/2JK0i78EdCey?=
 =?iso-8859-2?Q?saGhOZdI1KJTPauqbkb/qqkMl5KXTiU5OXXVdICyFCBteiu6YDgnvBGZo2?=
 =?iso-8859-2?Q?aXJCEwKWe1DCDK6yZvRQvaiRpaEIdCbCh2HTKb8O0wcYj7GtV6a/56rHN8?=
 =?iso-8859-2?Q?ISton6pcfxWgLPYnKVZ9AAesYcffxjZASlhQkffDWz0niqfXJiy8jV2u6y?=
 =?iso-8859-2?Q?sAcLjhTnwxf+UDaFuSrps7eqqOgtKDaTZLNnm/YECaw0/gDXSy0IuSgBfS?=
 =?iso-8859-2?Q?Op9ruOJOmb+JZoyS8UBdKeSING+5v/woakRFIUBalSbFppyWg6bv83ni6w?=
 =?iso-8859-2?Q?DiKby73/aI+5Z/eFdbQBCNCRIcTixXLvvwXaKI2440GSkrPCw+5N/ZvIvO?=
 =?iso-8859-2?Q?D8BP3snVRbs7hqYy0LDNoBCCo5GGRdzss/PDaRtlkzzLB4N78sAn+bj1iQ?=
 =?iso-8859-2?Q?lDGGsp2oFH+mB8/3GsXWpnyYhlkkduKSdeG/Mu/C/qTEfxKLYAUIruQtZ6?=
 =?iso-8859-2?Q?ZiNpdnIEMj9xQfdrHrkUmVMIY6h9BPuwtnjEC58cPKK+pw9YO2SOvjvMTq?=
 =?iso-8859-2?Q?f/94UqUbI4Wy8iowKzm/V8BwU3xe49mQWKNJdJVverVpBJfhoKa86rKh1O?=
 =?iso-8859-2?Q?H7BSQ4UBXq4OIZ7W3mqxcO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?Y49oBXTSWcX2MkLQJy2G15+3e9jOJFcesN30EIa6VlTpjCoexpMro1qH77?=
 =?iso-8859-2?Q?X0PJ2wEwiBfRNPrgGwcuESL3UtHhSIkcv5faCXkRbjUBSLZT/Z1PryeBNz?=
 =?iso-8859-2?Q?zytDqCi5yTq+hYDlTV81k4rUAV+0eDoQwAbSVKXk2j9KrRz2yjaoVwMJIZ?=
 =?iso-8859-2?Q?bumc+l+03Q9Q+krktTMK5/5L6cOog/xyAu8nUFo7s1MlQ/+qepNJyJwxMZ?=
 =?iso-8859-2?Q?Wc1x9lSkiA60/OBTJ1xhPXNhiQpD37TgQsFR7w4x6FiJmYJ+vu8nmLdntM?=
 =?iso-8859-2?Q?Yeuvhzz4r/lgjIKFM4vc8k+EBazDvcL2uAyUspwATn5CF2IGGADjHaIj65?=
 =?iso-8859-2?Q?gFcWIKY8lEyW+rO0zSW49QSNwTxeGPSRpcyw+FClav0Kfus/wPzXnD7fZ3?=
 =?iso-8859-2?Q?dCvImopywplv8shFWuu0HUFvrOD1340omPi6CqYyjTcflp2QtkbzwAec9P?=
 =?iso-8859-2?Q?mgib1F4Ggdrlw+c6kXWj81PZG8YS0ufkBMv61UOKg2Ie6NMOdSXgjqHY5n?=
 =?iso-8859-2?Q?RZ+C2pMOAdjcYh5fYKK4kvJAC5f/xqf7Kx93/L1HWSW4tTy5eFmvzpiTQL?=
 =?iso-8859-2?Q?HgCzxYvzdRnIzLNe6ph6vzyLwOrhzNqZjuKBHhxvInShTjrFnocd+cl8/x?=
 =?iso-8859-2?Q?63eQXsMT1tpULVQGQiAvJBMN4kBbZkP5P9NNLN+XjwBl6jeYWdFrdjjQlN?=
 =?iso-8859-2?Q?iEEtfQRDaIdKi/FyYSxW6RgEHix7cKSeAasDKX7jAuyWHoOuNRIGO+pImE?=
 =?iso-8859-2?Q?XzW7v+zXXt9ZODXBAr0yqHgTJ8+mtVJt1CV5+xzlETLH5tETpIxd6mC98k?=
 =?iso-8859-2?Q?XUQoqxpGCLe2z81E+UYWHdYNdPOSUL3YA5Rb2VQxB0Jyu0P6jDfZ0ZkbuE?=
 =?iso-8859-2?Q?0AaaGd5MdZjVvY2rmcMvOB1SZ5RPeL2PeCdEfaNWAt4uCs5MKwsq5JKZ/N?=
 =?iso-8859-2?Q?APmsvLb16Vo2VIrxmg7JFVgb5p9lKjjTeWFWM4+gg8w6ttJTPQRwTn7yrf?=
 =?iso-8859-2?Q?x69ZO9j5s1zvhfMQZm6kk7HGtevgL03xGohBIWMdDxvR9zXVgatPSDb0dC?=
 =?iso-8859-2?Q?FwdzIo1VmnrJABDELQ1hrcF2fSr1KMgh/XzzAC7Q7xjcWu+lDviWMOUIdo?=
 =?iso-8859-2?Q?JH2i+xDq4DDJYIs3hy04wfGkEO7m/EmX5eMc5elHKSDH4QAflLlX3wQ1Yk?=
 =?iso-8859-2?Q?vgxw00Z5XHyTnx2Zt6YVl20UuctRI8az1MRky0XXg5STtok+dEJMlbcjrt?=
 =?iso-8859-2?Q?uLcFuxtOFD4Tirnsgf0Q3hgg6G+eLpvbuuJkZib9cbcbv+qTZIIiIlNh/A?=
 =?iso-8859-2?Q?Wf1D32udU+VmSGnhZCl/4zYvYbs+7CQdpajtWLX1GKQJay6Zy/SOJQRznD?=
 =?iso-8859-2?Q?9kD4bJfKiC75KFqTsn8QHKsAIrmm8fswxrVRr5wFdvWr3Z83Ikk/0MU5ze?=
 =?iso-8859-2?Q?lNIxdAHY0FuCGWUebKVSj9hL/zLp+i0FWYwWtYo7QDJbFWpvUG6cAbBCYd?=
 =?iso-8859-2?Q?6PH6BD5vqrXokd/DMsiT/oqXUbxVRbZD69uDD8RzPo42btoWgYsIKZBpPQ?=
 =?iso-8859-2?Q?y8Jd5JzdDMLnNGSfuTRvJpAr+JKvN/lc/Y05UpsIuuZKKa3V8LmJFloOpU?=
 =?iso-8859-2?Q?6Bt0oE0THlsX3wTzSoH3f+UvdWHm0fXankfFvTqbKI7BoQlaIzoyEKyw?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51722ad1-c457-4530-d1e8-08dd711d1914
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 12:59:54.4695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYRS/suc7ewGT5XHSnxbqzmGwQhtoDyJMxjr7lg9CzwhES+OOH0n0zZxx14vxcjMymREunhVVn8r71ziwgeGEuWAYXDy+/EvbQrbps+WGDr9ZwdVKK5XvyUK8hxbaQrL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4880
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

Hi Sobin,

> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: Tuesday, April 1, 2025 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>
> Subject: [PATCH v3 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid=
 string
> test for engine sysfs properties
>=20
> From: Sobin Thomas <sobin.thomas@intel.com>
>=20
> This test validates that invalid string inputs are correctly rejected
> by engine sysfs write. It ensures that the property values remain
> unchanged when invalid inputs are provided.
>=20
> v3: Fixed the test logic. Fixed the tabs
>=20
> v2: Added error check for return values for igt_sysfs_scanf and
> igt_sysfs_printf. Removed the changes for fault injection in
> tests/intel/xe_fault_injection.c
>=20
> v1: Initial changes for checking error string.
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_sysfs_scheduler.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_sche=
duler.c
> index 4fc764f82..eb95d0d6e 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -10,6 +10,11 @@
>   * Sub-category: SysMan tests
>   * Functionality: scheduler control interface
>   *
> + * SUBTEST: %s-invalid-string
> + * Description: Test to check if %s arg[1] schedule parameter checks for
> + *		min max values.
> + * Test category: Negative string test
> + *
>   * SUBTEST: %s-invalid
>   * Description: Test to check if %s arg[1] schedule parameter rejects an=
y
>   *		unrepresentable intervals.
> @@ -121,6 +126,28 @@ static void test_min_max(int xe, int engine, const
> char **property,
>  	igt_assert_eq(set, default_max);
>  }
>=20
> +static void test_invalid_string(int xe, int engine, const char **propert=
y,
> +			uint16_t class, int gt)

One tab disappeared from this indent, it was present in v2, please fix.

> +{
> +	unsigned int saved, set;
> +	char invalid_input[] =3D "999abc";
> +
> +	for (int i =3D 0; i < 3; i++) {
> +		igt_assert(igt_sysfs_scanf(engine, property[i], "%u", &saved)
> =3D=3D 1);
> +		igt_info("Initial %s: %u\n", property[i], saved);
> +		if (igt_sysfs_printf(engine, property[i], "%s", invalid_input) >
> 0) {
> +			igt_critical("invalid value %s can be set to property
> %s\n",
> +					invalid_input, property[i]);

Please replace the last indenting tab with 5 spaces for perfect alignment.

> +		}

We don't use braces for single statements - please remove them from this if=
.

> +
> +		igt_assert(igt_sysfs_scanf(engine, property[i], "%u", &set) =3D=3D
> 0);
> +
> +		//Check if the values are unchanged.

I believe we prefer /* C-style comments */
+cc Kamil

With mentioned changes,
LGTM,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> +		igt_assert_eq(set, saved);
> +	}
> +}
> +
> +
>  #define MAX_GTS 8
>  igt_main
>  {
> @@ -130,6 +157,7 @@ igt_main
>  	} tests[] =3D {
>  		{ "invalid", test_invalid },
>  		{ "min-max", test_min_max },
> +		{ "invalid-string", test_invalid_string },
>  		{ }
>  	};
>=20
> --
> 2.34.1

