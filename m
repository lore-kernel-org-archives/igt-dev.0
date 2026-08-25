Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD49AC5DF94
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 09:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F98810E98F;
	Tue, 25 Aug 2026 09:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hj9qsjAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D0D10E168
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787648482; x=1819184482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kTlkF2sr16R0rNylII7CzWf6exb01OA2SdtlwCLmMb0=;
 b=Hj9qsjAh0tDe0LqemO6+2MX8IZ3ZVpp/oPoTtHsoFg4KFsa4M1Aq6kqO
 XDDNzsOetnbf1vhNASFXazX50SojMw5hUBLUtn8tPZtNqMUcOv+Nqqxv/
 smdPhg9+0azSgBKzcVhtXNWvHaR3Op6nCxffBSefygRzgX+5zpqVanUpW
 r6x3D2Hqy1hFLYEOqQ8/hNkEFlXVjiG8zv1viPQhHnM8h2QopkXWoJZRH
 BiALDGPo3LBZ98/OkzD96ejwEFkQTKDfPWO3PUmW8yrvyONvMMHGde5Eh
 pqd8/+It1UrkGsE0zf1xLF7tp58n1M6kWGZGjx5cZToZ17yIWCgUPPr3F w==;
X-CSE-ConnectionGUID: fWy4VdH4Tt2lEfPGN51kyQ==
X-CSE-MsgGUID: Jv1UOkEvT+2ibz53prQuUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91792350"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="91792350"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 02:01:21 -0700
X-CSE-ConnectionGUID: u47LLpBwSdemESFvf/c/HA==
X-CSE-MsgGUID: cqlf9joPSFWxA6+hA9Qn8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="269178122"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 02:01:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 02:01:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 02:01:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 02:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5v0L8b75NaAPxQpDZQxqKw0MHHZb2I8jAx8kbWee/llgNWMS3fEqswzIrnzmx4G5LUuwyR8KU0DZUmdxhQ9nNPpg9P54EpMSFu9PQIw7BrgxgtwJg4BR/3Cw/9JWKd9BdxoJcY89AvBErTfyWaP6JNO4FL5UDUm2qkQ1PFIkqrMmpsgtJNc1WWJTvTjggU2BCBKyAEkMY4UpuX/HfFFhTcDkL2XhGbqsyfDztlTYS0mVV+zliU6I7m7Hv11m3urjblwiFyxipub2wZFRJDahdLJGOmYahx9MxUBHXbTHNE3ptYwRgcr6Zu9BH+W5lA2x+q8ozRXb/GuxClDGO28Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4k7IlNzBRx9h7httnPmufryEiB1sZKoSgnaDGBYtgkg=;
 b=G8jItaUpuV4+dbjF02aMesB6ntqSBvlHTyP2UqrFwwqgZPcvVyJgCqgfLqZY1xistKyq2CtIxHARvE0usq9shpHyH4v46+um8r15b4GcPDeH0iu+2ve3p12Fn831LV854fg/K4zEYOBDTxDKsFqeayr1Rodkw086LAan9VczO6laUzgaq1o/0haRnjboB3TvwDM8dTk55M1OiRYcqige3D+mS8i2YPKKvnQnjNbkfz/X+XqlbqED13bctxEAl9uX6lG7OLqYXEftDFcaCfzYFN/C+9YoXE7eZltAwZ1N6VDbMFtqFdwyawZbc6FW1YfYAEODUXUfmYa5rzarZqHCnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by DS4PPFFF98E87FA.namprd11.prod.outlook.com (2603:10b6:f:fc02::63)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Tue, 25 Aug
 2026 09:01:17 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%3]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 09:01:17 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Chauhan, Aditya" <aditya.chauhan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Update CRI Core blocklist
Thread-Topic: [PATCH i-g-t] intel-ci: Update CRI Core blocklist
Thread-Index: AQHdNG70E7RNzbA3AE63L03nmhD//Laud2kA
Date: Tue, 25 Aug 2026 09:01:17 +0000
Message-ID: <CH0PR11MB556418CFEA9819AE9B4531FB98AF2@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20260825085134.2071258-1-aditya.chauhan@intel.com>
In-Reply-To: <20260825085134.2071258-1-aditya.chauhan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|DS4PPFFF98E87FA:EE_
x-ms-office365-filtering-correlation-id: 1def5dff-988a-4993-66cd-08df02876c5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|38070700021|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: M/J8TiP81z5Xva8w71ykTtaDcd2zN0QRbL22q/eLud5eFK4g3QzKG8MUhgkdc2sRVVsOH8eW3tOWDpOREV1nAr4gK2/4ZRgC19f/NAcfPDgniBug71OduLWJjd6b1q0sz9W2lf4usEwa2zSFvUKVZtf2Ly2ZnUHPd6mNOt38TuR4jxmRoxvRmmdbnjHxfvliJ9JcRrzGP1U1Z5+vmU728r46LuZvYg9KOsO5Dnz31gJNuiNx2Z8l1I6pmrWU7781DwFONRGPhNZ3qTunW2XSPvDGMjQNN7/OV6BmVczHozM+N0WYj4WRMiCWLzyunqcB1S0VhiFnYv9bPrbrQYZXPKWkEmTiy9FOMiNwvgVv5rqrTrRVenN1DNKaSyTMkZL6abirpVVXfo4WvBuuazheT5HppI3h5o1ALRsK3ITDIhGhDs6GFPyol2i6+nbdR1pAwrp6q1d4g1FjupEMXEB5Y5hQqNYvYFJETZf5SXLXUmvFdGZuOo+bYYVuT9VLM6WNzs0byj5cGB06bQxh6KCaIRAatVbNjqZOP3kMC85e5A6JsdMhXo8ME/urdIOlEKJ7Spqd2JuC2z+slU5Sgkx1w4TCJjPQUelYk8neZ5tc8XqqcHZVpnvhE1JkUd4f3SKiSthhljQ8CB3q2YNbj57JR8LaWkdUf+Anmp1EY473ay2lDPpYJkJcWxauidIh+SeOyWMewPtG6Ph2RDXjpFeV+uv5dKXmLvzxS6/WJGlA6Bw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H5SENlpqXFAG9dwJzL8inHN136V0P0DvfrBxwB4KxkLRx/koQC7rcSUBfyMU?=
 =?us-ascii?Q?ikK66CN3AvVu4Wq8LWI2Hh0WNljE31fQ8kap0vovHBqXGNOXTu951p9eM3QM?=
 =?us-ascii?Q?MeNquOfBRqBs83aLLXA187n+IJ75cvdrhNkneTUcRhN3FuYgl7ULh/wDeAQI?=
 =?us-ascii?Q?BWfaDszs1YhODNYZzJYi24xrOtpbgGiFyvInl68/AEuy9mxe26gIjW1Fh36x?=
 =?us-ascii?Q?41yPQ6y41gKJM+yAyfsk8gMSmdZUiwhSSBV2QX17pSHeTO7ENrLkZ+fjYaN2?=
 =?us-ascii?Q?haFK+p14g0LoBI8HsfOEkpH7ONTNLeYN84/klRQDnpZRdeGM9gWhCL+bikpW?=
 =?us-ascii?Q?z6KTfkLUWj1Q7m0/+EP5pif3OE9WWlgqoy2hxO7eulIHrpx+KLLhgv4qiLv1?=
 =?us-ascii?Q?qBpVxaG2tSHHpMZIlo+SglEeOUA1V98wv9EKyBc89PxYueRrozE4c+z+C9YF?=
 =?us-ascii?Q?VGdH5pE60hg7+uZ9i53UVEcyVKB/9t5FtzCJD4c1T93PQU3dXd7JqTGikL9R?=
 =?us-ascii?Q?62DIZjJydYHE95bigXKti4ab94GWz7C73f6bjFxnwTOTrG0q26q5o2neJDvE?=
 =?us-ascii?Q?997AlIZ3zrndoiQWe3GI5/XKmE2IuwoKx3T1mt8Wra+PMh/NU5l/H9RzkyP5?=
 =?us-ascii?Q?iWBdnarwVkclLDI0r7cJ7L95QCNcLBSP43RAf2U3IQ+XXzew5W2O0EqxEe32?=
 =?us-ascii?Q?bOVl4JtypN8uQBWDcdW9oQhobnDNbRBvqNl7aR4rPRZHve4iBZ9l1BPZzicd?=
 =?us-ascii?Q?kWNDGOc/jLw8XwYF8aqdqUaUCegHnDb1wvVmi0rmWsRVwql8uA9+e95B5L2B?=
 =?us-ascii?Q?F5XUTJjkmm2jns3tfFofOTytycOr3tPUJTwYFuAGOS7olfXg88rn2yD2ycWp?=
 =?us-ascii?Q?f7xfzkhg1qsQ1mf1jm8Y166FL/6yxIK9weADbXaHP3HOmaba1GmiCj2Kc/fD?=
 =?us-ascii?Q?yz1bZ5KhvkycwrM0nE5hAOUuoHPsmcZYmsxx9rchTQ6WPT3NlG9oxYuvvyDi?=
 =?us-ascii?Q?xza+dL3ANNRFKFKKtHfahZFR82AON5DKWO+5dClzzdj/7hOh6/piFAJCgzJR?=
 =?us-ascii?Q?KGKq4J0VciYBT9/S8hL6kl81M1n/zPj0EOwP6sRZ2giuTslc+eeiDduU6eZy?=
 =?us-ascii?Q?BZ41K2DIeUnruzVNN3akJH/RilwMSU1i8nTFS/5P837ZHkmdHSpY/K7F3s7K?=
 =?us-ascii?Q?CyTF1oXMBGrJwlStIgHpnsk4Y4Ex/ugsJdQPoC3E+Eoq0Zkpnx+nsNM/LqB4?=
 =?us-ascii?Q?wKJN65s9QyrJJRbJMFkshZSRNuHeryWTnYXKQNM+1H/FmLLq0D+1Kz01Omsn?=
 =?us-ascii?Q?4lROd2wuwQrtAwFGvWABqNpih4p5cy4nMgPXaoyd1lBHl/GkFv1uXARvkYoT?=
 =?us-ascii?Q?Kv9el3x+Y8Skr9g4eHKf2IPz+l7eurzX2o6qvdakZBzb1weRWcZzjGpnhI4B?=
 =?us-ascii?Q?PdBBqGAg2SWftUVMLs1fLFRZJKz89sxf49TnM2aW80yEIc/v4mqvbYlxhG93?=
 =?us-ascii?Q?gqfxS2vd4J9tOD/TzyqyeBt07eHRHYYNN1gS7hl68kAN5eNJzet6HXG64xuh?=
 =?us-ascii?Q?2N7R+CROE65VAN+11JgPeZMXQNe9qEckrJxvGc9KBo8akTThrsUBwT4vCNwh?=
 =?us-ascii?Q?A20qx/okmdN8+hFdJvc1xfgcw9dInLTT8Y3jinkOqNwXyTeQ1IoeRukoEsZL?=
 =?us-ascii?Q?sbz5fOvZbY692wr68dZiSj504PexdAhoGHxwoqurDStB1AxlOFZfFLYsZIOm?=
 =?us-ascii?Q?FAzSFoYV5w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Bw9evc0//P3VFlH2plOTfSnKB13jXMGO0HLz1wONEYKrKXZAoWLBzp3LuJJdjnopti+S53RXrocQO3SD2ZPd3UQYeNL+UlAbIv1kdQZLCR1Dnb6xnNizizg6io9hjN4M6OFNunULgQM6NwtvKtIqhXQAPRZUM+G7YAFZJtOaMstiwKMqMK362wwHUXAr5CavSAm+j5wrCeJXjCRV+oq/lQ2wXelMpYBZYYHLasvtkZmN2Bap0aHmlCakQ2OF+mICqbWNr09FZ5lbJZY7bQeBFdED3U1qABV6iBVxNxwrg03++8R9mHMMtawxAgeJk05/o6uMNdMILkxzFAv/8XBYRg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1def5dff-988a-4993-66cd-08df02876c5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 09:01:17.1701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lkbAwMaukKshqC9W4uoM07VNN2jl44Axwqyh3Yg5wzbnj//fQFkBhRBdbB47C2d6mqVGHz3juqBQg9IXEmvZgF3zBuzTeRr5jR6okv4fxXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFFF98E87FA
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

LGTM.
Reviewed-by: Himanshu Girotra <himanshu.girotra@intel.com>

> -----Original Message-----
> From: Chauhan, Aditya <aditya.chauhan@intel.com>
> Sent: 25 August 2026 14:22
> To: igt-dev@lists.freedesktop.org
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Girotra, Himanshu
> <himanshu.girotra@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Update CRI Core blocklist
>=20
> From: Aditya Chauhan <aditya.chauhan@intel.com>
>=20
> Add compression related tests, page reclamation tests and NVL specific te=
sts
> to CRI Core blocklist as they are not applicable.
>=20
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-
> ci/xe.cri.core.blocklist.txt
> index 1cfb1d587..12085c4df 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -39,6 +39,8 @@ igt@xe_media_fill@media-fill
> ################################################################
> ##
>  igt@xe_ccs@.*
>  igt@xe_evict_ccs@.*
> +igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads
> +igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-(single|
> +multi)-vma
>=20
> ################################################################
> ##
>  # Valid skip: Threadgroup-preemption not supported on CRI
> ################################################################
> ##
> @@ -51,3 +53,12 @@ igt@xe_compute@ccs-mode-basic
> igt@xe_compute@ccs-mode-compute-kernel
>  igt@xe_compute@eu-busy-10s
>=20
> ################################################################
> ##
> +# Valid Skip: Page Reclamation feature is not supported on CRI
> +###############################################################
> ###
> +igt@xe_page_reclaim@.*
> +###############################################################
> ###
> +# Valid Skip: Test is applicable only for NVL
> +###############################################################
> ###
> +igt@xe_pat@l2-flush-opt-svm-pat-restrict
> +igt@xe_pat@xa-app-transient-media-(off|on)
> +###############################################################
> ###
> --
> 2.34.1

