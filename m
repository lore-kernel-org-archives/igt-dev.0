Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C857BC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C41F10E9A5;
	Fri, 28 Mar 2025 08:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqD7x8Pg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5B910E9A5
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743151922; x=1774687922;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jl5FV0gl+Jiy+rW6mHDHz6pYn8mjO1U206xx0Cq6wbQ=;
 b=BqD7x8PgMlA6jS3nlO43XQGIavf0HE9ipHQXCH39yjwwE6WcJBwEp4xh
 dTkqTW+YKaVIjcUzcdyyu0mJIOMX5miNZ7OySBm7gCPiDfBcuNh4Cgaxe
 34neLKW/1fiFgiTfx7G4HGTFjv238OVODhgTlP1qoIjeS7+gyX19Skf5M
 19PRT4nhwNR8Mj4Bxru0pUdgNahr2rqOJ6S3TL+u0GBIcDwN604l4uP72
 pvw/F+pNVFHiQh2NfU6fni+IjH+jUGpStzOVMLAOIPWKbQZDX/h4zQbfj
 +U5lieVzpZwpTfonoiZPPW8hsdNHfDNu4ISmmgt1xZmg/u214nQEbx1TN g==;
X-CSE-ConnectionGUID: 37tJ3ki/SeiM0CTxA2B16A==
X-CSE-MsgGUID: g664c/j7SBiAUN/rAAE1mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43755834"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="43755834"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:51:59 -0700
X-CSE-ConnectionGUID: MQdYkxHnQ7CNpn3G8hlsuw==
X-CSE-MsgGUID: Rf+KStMoR9KOLHWTVIOxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="130107017"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 01:51:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 01:51:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 01:51:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 01:51:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWyFlpsCVpDEg2dmsaodHeA1e1YH/NRxqyMu3CTzzfPlflrOrq6DACav6AlrTcRIQBM955H0xxXYA6jfC5eQ/2bu5XwSFO5xkhXUkpVvmqstrbO5XRLspYDrRAH0z11MjU2SMdVPTmla636AKk4zbn40TI9GDboLKr5CP5dcvqEYBCVzq+xTnsQQMY1sFRWDlAIQfyW4nt3kL99TyOGn8J/DHOiKGqfGKm4TfkOZqtN0Q9LxtQiwtpNn+VOMalWvVLUkz2y+ZIL4tM4cJRmJXqKypDzM6yXSe72qrfFwFo+dT/+9YkWnu7qBpgVfbC4wg4DHzRp3DqEp0taG2lSNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQweoiZK2Yirww5f8RyX5ll+7aRGusWxg+gpSxRgexE=;
 b=eNRZRYQvVODU8q2oJ5AR3dzz/fFZiIRq0N8vfu4TrFCw6yycOloNr7Ftg98S4YJCBA9m3T1Q9l9DI5HwbNz13MgZRyhQnemNDdiBk2Bi/qKi9vLdN6s9Nwg3+gc6WsaV4xa01XkclMK/4CeQworzghGcj4Pu+J9TVt+7uwuz9JqaKYT0TfhT/VkAZ+/G20TSLNP36o5AMJQuuxxvEURf+W9spmmhDxu5udsAqOVyGc5PcnVjBgF5RqwYdcOLLWn/bx6EdhsoSoG0HEePRqfmtc8RXGCdP3qjteJFS9PZiI9fu6SI30UTu+NjkdK84hIc7a5CU53vnnkipAtkYIBv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CH3PR11MB7893.namprd11.prod.outlook.com (2603:10b6:610:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 08:51:52 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 08:51:52 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 1/3] lib/igt_kms: Add mode restriction check for
 Intel scaling
Thread-Topic: [PATCH i-g-t v1 1/3] lib/igt_kms: Add mode restriction check for
 Intel scaling
Thread-Index: AQHbn1pSAEO2i0D5KE2rUiQ0s5tSabOIPS6Q
Date: Fri, 28 Mar 2025 08:51:52 +0000
Message-ID: <DM4PR11MB631277D5A542425D801C0F7390A02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250327205301.3400440-1-ramanaidu.naladala@intel.com>
 <20250327205301.3400440-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20250327205301.3400440-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CH3PR11MB7893:EE_
x-ms-office365-filtering-correlation-id: 02da6e5a-484a-4364-31ae-08dd6dd5c91e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xreKelRJXnXW0UQf00kvlbe2zwWx5rt38Ru/GC1nYATWvZLmoCncgHScV2u/?=
 =?us-ascii?Q?8X5WoXmBuw7vfqZqoUd5itzdynIOSPF4uO1TYjYRQzCsQnk4FIbEqCR04Pjl?=
 =?us-ascii?Q?3PP1IEkx/5mK7oewatOpnmeZTaqxCg32DbsqyTyfRF1INCk021lm/D5eJ+ez?=
 =?us-ascii?Q?k0E/Xv5Z+QpkdQpZTnJr7Vn9XJhS7xZbqDangjMXBZNth4XeoIaoIwEjwPJG?=
 =?us-ascii?Q?F7zDgUVmlTw/e58zjODLuZVX73wus4K4xxlOne/8OsjysxQ3uZ6lUC/CS2Xn?=
 =?us-ascii?Q?7gHXOnKlQ0zEAORT2dG7biL6lxLn8ElcxPEpBErEN6DI5LPdkluXl7RCeqxO?=
 =?us-ascii?Q?R2uCO+qraczaJlRi3VgfEP+Z9Uk07LL+dzwVFb5EQzIZwKH3qPrby/+G97rg?=
 =?us-ascii?Q?rCgF+qW8g+T5r1CuW6HBxm9vDIPAKCUACFzNbUHzeyJksGNRGlB3Eoo7nIGJ?=
 =?us-ascii?Q?5GkgU3bGH75gG5YZfHK5JPMMe7o9y4RtYr615c1nejWJX8Ebc5SwGJSuUB0j?=
 =?us-ascii?Q?dUN+iJnFaM6Sn3fzI5UkQqDoHviL8t5iTTmRxdi+4stMZu9RuQu+ziGJKNc3?=
 =?us-ascii?Q?TFfHYNO4PesR3rCIhnpuypVAB6sR+cl28k3w7MODxvI5jFwQEWjjyO4xRJlg?=
 =?us-ascii?Q?thtLtKLD3lya/qJbitNhQ9dyULNpC3X/kxsmh8XXDJQ6q0X3rxEGVWknbpzn?=
 =?us-ascii?Q?IMxVFIiDBrzWIIWFKAzTSxt7o9zEYl6M2bFtX2J6n20rSdAV2yRPx8LZddyV?=
 =?us-ascii?Q?tCM4Qz26Ht+322SD8pLzNKp5s7vDSUtigYvrF5sdA+836zN5rrLi4ROEvzh+?=
 =?us-ascii?Q?eLY4XpZMWB6uVgfkiL/tAy32AZ1goa8YPkvuu0p4auuSKTEpdstsvfFYqRhm?=
 =?us-ascii?Q?OnI/Bg1WBtaLud1uSgPT9KkqcD6rA8pXnzIjwMkb4OwBJpaTzNYuoUurEslz?=
 =?us-ascii?Q?h5lvFvyjaZmQ9MJNj7UoYlKOHy0TwUzYh0KujoWnQD00/r+VBjQkBN8RaXvy?=
 =?us-ascii?Q?R8KKzSM6dgQtJbpNnbwdUzoV+AyWSsuM4HnddGXQjWRbT/1jZ+OKdJdh7Y9L?=
 =?us-ascii?Q?U+HToLxmSdTBuZJNi5+HN+Ee7K4SVr24hm4os3Wv4JDocqvL4cnWkdBPYk+J?=
 =?us-ascii?Q?Wt4OSXgCPkdB8VVwVkWnI4cCM4nyuibyEWvQ30V+FJWFX4PlTW/8MP/fHD5h?=
 =?us-ascii?Q?dm4UbY8+RBBuyGhd8RgzTBJqjTFk6KUDtB4082KBtXx6+1qHDQkDEwiGoymr?=
 =?us-ascii?Q?bxBPOylwVZzk28Ex+6DEdpYWBkaRoZzXMn82hNJpOFi6pnTv4gaFW9Q+/HSL?=
 =?us-ascii?Q?fLm48UmQexPZBzCUBzR2TPCo5Zh4pueWX63YXDkdSNyvpxTFtnUshqtKmZ0A?=
 =?us-ascii?Q?v+ltZFBm4kNWYTrh4aYqDKZzbKlLFFvK6Fro6JQTu4iA890/BCMHjlYP/vui?=
 =?us-ascii?Q?61zosaFRnCvfDcVmKCab0SH78STbh1r5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?02lV51UqKA94iSjexPCOHh7H23FwRh9hOHrabz9qiyyKgcl1uqDHagoDQBVe?=
 =?us-ascii?Q?R5mhZsB8XLlswJIf7WXY1RkfFBGF3cXCAB/o2vitOt2Obu3yRN3VDWXufOpJ?=
 =?us-ascii?Q?yWqYaPGRWu90sd8wI1N1rynCy+0WsIbvnbiFvUwxjZAOja5WxUYRiU6fpjpx?=
 =?us-ascii?Q?jTK9Oh9QUscBneoY6GgsEVRHS+83AUelaIjxVAALFP1VH0Lf1+UO46v9uWJp?=
 =?us-ascii?Q?zRHbktv+VJJL0FOLbgrIrFlYUs9SOVhL5XGHTLWenLt+LK8rM4J9MIA3w8Ro?=
 =?us-ascii?Q?/II+Qhly8skftp+RxiYSNHgpq2jRR9ioVUXErVXGIeL8MDB8Cq0BL6n/iK0A?=
 =?us-ascii?Q?4OZhvMpEvv4axrgzyHAZ4RnNlla/u+81Bl4Ed+ZM0CUmwr17BbiiFl9F75Rd?=
 =?us-ascii?Q?KZVgOx05YJBNCESMhXUdreiZqH+UvQY0+pug44BGxxplqvWXnM5hVSSd90bz?=
 =?us-ascii?Q?PJnrY5yUII6ACxMNMqwPb9kSY2e93rSpQWEwWCaqX+d5PT+xCTNuUzGGNl2b?=
 =?us-ascii?Q?AEHwE3VlnPujhQhk1wlCiEjhp8ikiT81zd6eZX8/SRxDVcvcOS8Boz5ZI/++?=
 =?us-ascii?Q?UcGOyFmKNaEHEQAoyEeDD+uFE05V/qHXZ64RldaWVvl0hAkNkML7el0It3eI?=
 =?us-ascii?Q?8ziD0vHpChWkFctkFC7ArF+wDSk51XWCQUBtSMkkCAY9Tm63kE++qK0BB+E3?=
 =?us-ascii?Q?DSzk2AZ18Z8rOZUQ+bnDUAKyWS+5ekJo+k4EjUndEWLYeCJ9T2l9B2B+OM9I?=
 =?us-ascii?Q?J2Qs0J/uEaMx9q8wCL+x8KInx+SjNs8wZNIR/PsWSJieElA7YVY70x54vyls?=
 =?us-ascii?Q?VBmk3CCHEzQc0u1w0wY4SDV467fsbkTGFoT6WLzYrRf/hzGduMoVwKaGK6dK?=
 =?us-ascii?Q?UearghyGk0eW6wXllphqPT6INYnEEIjg3BO8Sfcp8w7gEZjVujFOPHyu+xAP?=
 =?us-ascii?Q?5WGY7K71tn3uCJX4taXmyLyJO09UPe/L4aUFja0u/EflaILvn/SgL6rBLGma?=
 =?us-ascii?Q?I1IMgJW6ExZpusrq41XFwsj4WMuuvTSPsI6UUjIhI8E3Hwg8zPD7yhFPgWna?=
 =?us-ascii?Q?3+wyydlSLDTZu5A1HLWELc7RadMV6DvjoH1vhkUSiaGR+Zeim4kx7sJYUxnF?=
 =?us-ascii?Q?UeeT82zof01C3T/p8Nt9mgvoxCBo2QCY8qBTXjj8mTH+ghxr2p2AUCZEjTQ3?=
 =?us-ascii?Q?w8cM7szkAwtgSFn/QP1fDbgvO8B7PxdoZQmZ+3U9+bY6WserllbLv9lCbVQ4?=
 =?us-ascii?Q?FdN4lbk2D4cHPT9YeY7T6aXBvGD+MLtCkpriauSk7VuMHyhoHywXf+b8gMY0?=
 =?us-ascii?Q?BiC/s5Wu6ii1/D+DeWCW5kk8ZoKuPEp/HA+c2Yv8b1hkhqvjlKEePD2L+rkm?=
 =?us-ascii?Q?Z5/RfKplcBcVFsNQM3IsHsBUkszTszzJidQ4SxWUIHatneTOU5gmJ5ZpIsZ4?=
 =?us-ascii?Q?1PsRX+f467Q5Yf7o2EvhCGqICcW9Ntho6vuSUFY1KtirOA0SsHdbqEEhLtoV?=
 =?us-ascii?Q?sLciCcRYcaCXguEgYOYkbRwMTFScW6SGc/5gB4J9a4cj65rR/FoBT6MDTE4d?=
 =?us-ascii?Q?0g1Cuy5pFMtfVLel8RI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02da6e5a-484a-4364-31ae-08dd6dd5c91e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 08:51:52.5818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vu9eu5WhyvbUWwRcXg3MXgtTzp2MUp+lqf7j6xmirTgrek9IfWn7LfJrp9WvM0KMh3JleU98KGTPLt3lc1SDPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7893
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
> Sent: Friday, March 28, 2025 2:23 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 1/3] lib/igt_kms: Add mode restriction check for=
 Intel
> scaling
>=20
> Add function to verify display mode parameters (horizontal resolution, ve=
rtical
> resolution, refresh rate) within 4K limits for scaling operation.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  lib/igt_kms.c | 23 +++++++++++++++++++++++  lib/igt_kms.h |  1 +
>  2 files changed, 24 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 99c8707c7..332f6dbf3 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -93,6 +93,10 @@
>  #define MAX_EDID 2
>  #define DISPLAY_TILE_BLOCK 0x12
>=20
> +#define HDISPLAY_SCALING_MAX 3840
> +#define VDISPLAY_SCALING_MAX 2160
> +#define VREFRESH_SCALING_MAX 60

Can you please mention the spec number or Kernel patch where we have this r=
estrictions mentioned ?=20

> +
>  typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const =
char
> *value);
>=20
>  struct igt_connector_attr {
> @@ -6998,6 +7002,25 @@ int get_num_scalers(igt_display_t *display, enum p=
ipe
> pipe)
>  	return num_scalers;
>  }
>=20
> +/**
> + * is_intel_support_scaling:
> + * @drmModeModeInfo *mode: Pointer to a structure with display mode
> information.
> + *
> + * Finds the display mode's horizontal resolution, vertical resolution,
> +and refresh
> + * rate are within the specified maximum limits.
> + *
> + * Returns: true on success, false  on failure  */ bool
> +is_intel_support_scaling(drmModeModeInfo *mode) {
> +	if ((mode->hdisplay <=3D HDISPLAY_SCALING_MAX) &&
> +	    (mode->vdisplay <=3D VDISPLAY_SCALING_MAX) &&
> +	    (mode->vrefresh <=3D VREFRESH_SCALING_MAX))
> +		return true;
> +
> +	return false;
> +}
> +
>  /**
>   * igt_parse_marked_value:
>   * @buf: Buffer containing the content to parse diff --git a/lib/igt_kms=
.h
> b/lib/igt_kms.h index 0381c82ad..0e3d1297d 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1279,5 +1279,6 @@ void igt_set_link_params(int drm_fd, igt_output_t
> *output,
>  			   char *link_rate, char *lane_count);  int
> igt_backlight_read(int *result, const char *fname, igt_backlight_context_=
t
> *context);  int igt_backlight_write(int value, const char *fname,
> igt_backlight_context_t *context);
> +bool is_intel_support_scaling(drmModeModeInfo *mode);
>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.43.0

