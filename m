Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4CCCA6015
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 05:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F33710E04B;
	Fri,  9 Oct 2026 05:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VojCMtm3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294FB10E04B
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 05:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791524826; x=1823060826;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TUbdOtfz5/5a/76M2yaOLdZBjIQ1GX9NFUFUbVYuZ7Y=;
 b=VojCMtm3eezNKrF4l4G7yH7a0mapfwezDX4UdFle5xLExUOiR2Rq1RnD
 YMqQN5suH8XeNBdJVmVXGFdVdiVdEz/qcV2lIUHQ2lyNZBRQ/sHeNfitn
 TFxn8Z6MgXwGC24rz3j95A7FqF2AHyk2x/kcz3D9hM449MopkNLxuA4l8
 TeoBBsejuJDNn+DcE6Afmd17iXWofmWFZ25ctj87Ejr250XUkGFJEPxam
 ZJTX9Bqs1eBkQNljTDK5c7vh+C3H0n9L1Q0BuMyAdfZFXacjAypp46EX6
 AUDkHYV2J3tjCs6Gs8LEs2DCNVkZAYXxR2zLVwwavJFagajkcP3/TLuEK A==;
X-CSE-ConnectionGUID: AzARwA+sSTiMYeYHIopmSg==
X-CSE-MsgGUID: MiPM5mR/TnyukTIIK33Nvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="201156"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="201156"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:47:05 -0700
X-CSE-ConnectionGUID: 3x381YVXR8O9ABrQJ703ow==
X-CSE-MsgGUID: IXHpYsiMTxG8kHKKW1MrLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="331058"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:47:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 22:47:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 22:47:03 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 22:47:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6p0PC+XdjO+tdhpgqbbflyk3EwNNkhYC8rOOZZyPvuWfHjbUUcQmdyBqOYafeMw0cQieevoTu1K+fe2w/vsBNhNo1j9gH234TZK+tMtu+GkvpU8JrC9X6wKy/Z8jlu0wGI/LMW8PWJqA19gkOIshf0Il/c4h9Oiudq/Ho0EmyKgth5Q9FDvTqUQ4AXTFNApEoh/04UrA0GWRoaVC2lsDVx5By0+RBoPjwgIjvD5Jduv04fXc0W+0SNggHnkkuaT/fWp2ljqPtWgpODNb6ihghT7JxPeGfcuODeF7ch9KEnp6f8uzwKE+u02ERsx4c/Jvrd9rz8P4t/m2Z0HTOL/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dp8u/3fDJxkBaJQPo/ox8EX2Y8BuLMkebbrYSFdLZaI=;
 b=xUQMnEVh58zDTO165qbRD8jJHbj2//VXYwNmaFBzIcYh+tDiqNdpB78EAkIljUyD5T3FKSPjBJHpD7nh6Lg71RLpDnPi3BKqTHYm+dzQ4ZAOrxJttPWgrsBBHL9+5pYE0kig226yPFAypcCNEsbsyzCurLHU9ua5VIQoVTPKy4KvaS2li0+ySo+tt/Kwm/V9CENeDAB/yG+dI5dBLDJjh+tk8qIOKj0EvbiZYpNJG8IEQDEFO217LC5fkFr0kkdvhepwi+J10J9HHvhUZto9STqRh/DPPcPZLzPt0IowUiLZNpY0iJdceygcveQmdUADp23y29JNTNTmvLOXNp0ikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 05:46:56 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%5]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 05:46:55 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v2 2/7] lib/igt_pm: Add PCI PME capability and D
 state accessors
Thread-Topic: [PATCH i-g-t v2 2/7] lib/igt_pm: Add PCI PME capability and D
 state accessors
Thread-Index: AQHdV67I3peZ0T2fqkaFFzlOVx8iRLb0r3BQ
Date: Fri, 9 Oct 2026 05:46:55 +0000
Message-ID: <MW4PR11MB577613647A0A226857354226DA922@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20261009052625.419259-1-pranay.samala@intel.com>
 <20261009052625.419259-3-pranay.samala@intel.com>
In-Reply-To: <20261009052625.419259-3-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|IA0PR11MB7306:EE_
x-ms-office365-filtering-correlation-id: f22b7383-dae0-4a6a-e825-08df25c8ba4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|11063799006|5023799004|10067099003|4143699003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: nhT74nYAc1iy3dy8o5GgW6Zynd/DWDoV9TJtGLLCbBq8jyjRbCQM/CHKw+cVe3TePi1AayzejXU+MEWg6sikUt6bsNs0QST2Iz0Cy99yoKWwcZt0FTIy4eGNNR+pENvyqFMefSbXMinejOdzXcYeDR7Qkk4MuBCHYQseZCHUCG2gQHY0N1A4ARvmE+2SvARk3y3FUTVvrZ9ZFbYHGahKVyhTlcnvhOpwkQvgxkG7kI98vuThZUBwKPzuCJyqfJuOrOD4pHhdsoQ8uxq3TnILrbQfC1iY+gn9UvrVUT1RBLhVhm1tU6cGBs1aRB9DPLt9FHF07r11ROOt7qnsdiJKDdXzSFAYJ0G87NbSBR7in5EPr5rjWp7wlIIJsBquJOzbX3xr2Lz5ZnV9r+Lv3irBXo/Rc2MiTPXqhSI+Zu/DQND/aWm4KhXWKyuej+GEHCGjl1cYnr6S5g/9i7WjXKVKASvQUJa1mczfRKNIH0Zld5qN4v884yeMJkwV3ZfdpPIb43Hv5M0mnf8PSFW73FxFKKJBQfzO1wNAUzTwbWQ9teWrq/UFB2o/jYcVZVzY74TpeE7keorJNhcEUNRx4KFqEut2VjWJw7D+yYvQq0GDRmGmOtheGhgOSkbtoS4T633n5/SbbzBN4fcHAD78XsRi2wkpZVtgtQ/t/aoSU8iQTfzkRHMcahBV3EJ0NOqfv1AzPyLnChR9/f9ndTr8KJcsooJqcdXSaBmv6Zh7fNWHVQo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(11063799006)(5023799004)(10067099003)(4143699003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1+QAwPZwgQoZ190nmhvUgQBTfA7hLqPpso/AfhcC4e7OktN4lIIDYW8Nrcvv?=
 =?us-ascii?Q?qxHS9Q4B82e5oqvT5iMyIKOoyBxA8BIV2GIzzV7AkonHvhtIm9vIfNEau0+V?=
 =?us-ascii?Q?9BBSiHy24vl0ITn/Q8EOAAfJgTyHud++PX5D/3bgwhOWNR/9dJUu5VYSNMB6?=
 =?us-ascii?Q?OGrQ+5XgOaau5lulK2pq+nI62HtR58WZTKcvdo09KMfFIoKcmCQ/IkPAQWl0?=
 =?us-ascii?Q?+Jz9g9j+ibbhr8etaHuvxhG6NEuJ3MqunFTvY6IEaGflUb/almCuqtxfqoqr?=
 =?us-ascii?Q?apw5iq5hPKzf3qILIK0MhDL17JjIsd/I2xD9eybvhFh0ZWlYrtrj8zYw00BY?=
 =?us-ascii?Q?+PS1wXq4LIEz3QA88j3wcuTz9lS7epJ8c8Tdrgs1U7S7rmI9uo0bQ8CyUWLB?=
 =?us-ascii?Q?AdYzCt6UYvBBNJ14q+zhnNoNbrUz6B2t9uCQRbT7kclFtJEh1Hc9HkXIu2iE?=
 =?us-ascii?Q?5i3fbn+Xje1atA3u9jqnAn14TiOYJVvVx1U+ML6VF7faCPAXLZ88YCg1RSFy?=
 =?us-ascii?Q?CASSO4M0QGWPFUOxt62qmzmI5gOVEXWmVk6HNexSTQ5+R2Uq4HkEQ9Q7/OP5?=
 =?us-ascii?Q?EexpBobLYvTumTkCw6p7+DCzvUz0t/yD+CA4WwOzI70fAa+/BNrtFIc9pfIO?=
 =?us-ascii?Q?e33ViVrbUs4eheCRwEPtObyV34s+Rzp2NNi2Sv9rR4bPH1etuVi43L7E0GxU?=
 =?us-ascii?Q?0L4sFK20DdRKkUGv/7JEzTvnKuYu4IjYfOg+0V3IF9i7UGIq7nYq5kDMIswu?=
 =?us-ascii?Q?CU/ULZdDHL8APwFUmjSx5HNCUC+rK7MEMWLCqvAjzgsjTsN1ZWNHOQQkVfPz?=
 =?us-ascii?Q?lVYHmHiCpZn5/6iRIlPgsuZtBhJq46ECPSOefgRkkvlgALyelx9QZTpAxOQU?=
 =?us-ascii?Q?APf4KgITSIIlrU9wABz4TLVp8tYabSzaMJO2KhH8jVg9AwrusuCYDDBluCF+?=
 =?us-ascii?Q?etelh+lqRVzlDySja1nGycsZjGdm8Ih1PHjZlgJkxcFM8/APRY90XjhixnfJ?=
 =?us-ascii?Q?kfI6nMFV4EOJ1AsPEjPgHEtN/PHHQ9VWvBM0IjLa0FoYAIMXhBd3khm0dnmp?=
 =?us-ascii?Q?gNyelic5QeoUEiIbNQHkyt4d1dK/+7AZyEcdiyT859//ABAZ2lJ3OhVxBjta?=
 =?us-ascii?Q?qbqVHP6tGZiwgzsWtosL3AicvccBAh8223VkajOG26qRPM5GaJKP1Sew7etj?=
 =?us-ascii?Q?JWrV4VUXFbaT/jCR/8dooZWNzKkXGg0NDVZMqRP/NiA3KcuuM4mue25pMZsP?=
 =?us-ascii?Q?/9WeD4BBmcXPsCEPzxnVtYrkcz6PJIxLfFHWj/ukLq5w/Jb92gDiz33Yz0qu?=
 =?us-ascii?Q?KHkKyv2ShLixk9PEihfokuD4coW4XRAv2upQ065xWs4GZ6RV8VXcuKlRhd7K?=
 =?us-ascii?Q?1/cObIWabAC3iYwRJ+aT4znfZqoqHK8a2EJELSgDKTCXRw7P0nSlFM02y8US?=
 =?us-ascii?Q?zv3jCuv40K1LLGhTBFHCWyMKflPOg9om7N+EaoOMNiYTJArkUEJ9zSSGmuGV?=
 =?us-ascii?Q?XD6aJLBEDOx+tab3yNcfvhqSrUpYZGKjc4v2t/XIuF1W2VB3oCwdAolNfFK9?=
 =?us-ascii?Q?2De4LyfOV9JD2NO+Rk9NVpg0LaCknnfzwi+Cjk8sRXG8fC2a4OiOb3YpfoaF?=
 =?us-ascii?Q?9zF4MStPhP9IPMfrYWvOSniAq65Va+xxlfSghjKTtRVaKYDHYsKRT5/YvWcM?=
 =?us-ascii?Q?E20NcvszgeY+nxXWqRjz1G0a+FpF1XwcF3PxUOVkxNLjpIXP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4sPC1kqqkqLmARoiyMXmBA33K1f0Olqaekgg/Vhw7LETQcMIF5fy3iA++4QV+LJRUC6Pb2x0nIE/ZHYXr0dHgV3kEoftTNOzR9b8U901jke3v5ST56c/jE9L4K2dYVi2NyB/wOpyqgMBK5mzY7CheyGUS6tSjf5eDUI/2TWYJPMjYF0SsrGV9/rK0ehT/3wCemHdsd9AoVNQD/E0pkmLa+ZcEhH41+o2Gj1er9UW2WAeM5NlmRMsSRFJ9HhzSXCgzUNlPOTRAcHX3Dd/QUAvpjaqzFBJjp+XJWVvOm6aSk6/rEN+iGNltwIGZyfCjMGIb4e/PpDi0oDET7WIso3XeA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22b7383-dae0-4a6a-e825-08df25c8ba4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 05:46:55.8781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+EQz9CnzEkOprEYaitIGqbaOS0TdSBCofAJCPJSL9h+wOJunad1giq3Adz8FOFKkPV3XyvxiQ6zYlmyUI5MUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
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

Hello Pranay,

> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Friday, October 9, 2026 10:56 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v2 2/7] lib/igt_pm: Add PCI PME capability and D st=
ate
> accessors
>=20
> Add four helpers that read the PCI Power Management capability.
>=20
> igt_pm_pci_pme_supported() says whether the device can send a PME from
> a given D state, by testing one bit of the PME_Support field.
> The state matters. Intel graphics devices support PME in D3hot but not in
> D3cold.
>=20
> igt_pm_pci_pme_enabled() reads PME_En, which says whether the device is
> armed to send a PME. Its kerneldoc notes that a driver may arm PME from i=
ts
> own runtime suspend hook rather than leaving it to the PCI/PM core, and
> that xe does so subject to device_may_wakeup(), i.e. subject to
> power/wakeup.
>=20
> igt_pm_pci_pme_status() reads PME_Status, which says whether the device
> has a PME pending. Because the bit is write-1-to-clear and nothing but
> software clears it, a test that expected a wakeup and did not get one can=
 use
> this to tell a device that never signalled from one whose signal was neve=
r
> delivered.
>=20
> igt_pm_pci_get_d_state() reads the PowerState field. Its kerneldoc points=
 out
> that PMCS can only ever report D0-D3hot, and that it cannot be used to
> detect D3cold: config space here is reached through sysfs, where
> pci_config_pm_runtime_get() resumes a device in D3cold before the read, s=
o
> such a device reports D0.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_pm.c | 162
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h |   5 ++
>  2 files changed, 167 insertions(+)
>=20
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c index 1e3cc7757..b1f9868eb 10064=
4
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1524,6 +1524,168 @@ bool igt_has_pci_pm_capability(struct
> pci_device *pci_dev)
>  	return (offset > 0);
>  }
>=20
> +/*
> + * Read a 16 bit register of the PCI Power Management capability, at
> +@reg_offset
> + * from the start of the capability. Returns false if the device has no
> +PM
> + * capability, the config space read failed, or the device did not respo=
nd.
> + *
> + * Config space reads do not resume a device suspended into D3hot, so
> +these are
> + * safe to use while the device is runtime suspended. They are not a
> +way to
> + * observe D3cold though: the read goes through sysfs, where
> + * pci_config_pm_runtime_get() resumes a device in D3cold first, so
> +such a
> + * device answers as D0 rather than dropping off the bus.
> + */
> +static bool igt_pm_read_pci_pm_reg(struct pci_device *pci_dev, int
> reg_offset,
> +				   uint16_t *val)

So this helper itself wakes up a D3cold device, i.e. get_d_state()
changes the state it is reporting. Any D3cold test using it later will
break silently.

Can we read /sys/bus/pci/devices/<bdf>/power_state first? It only prints
pdev->current_state, no runtime pm side effect. If it is D3cold, return
without touching config space. Then get_d_state() can report D3cold
also, and the test doesn't need the "D3cold reads as D0" logic.


> +{
> +	int offset;
> +
> +	offset =3D find_pci_cap_offset(pci_dev, PCI_PM_CAP_ID);
> +	if (offset <=3D 0)
> +		return false;
> +
> +	if (pci_device_cfg_read_u16(pci_dev, val, offset + reg_offset))
> +		return false;
> +
> +	/*
> +	 * A device that has gone away reads back as all ones, which would
> +	 * otherwise decode as a valid register value: PMCS 0xffff means
> +	 * PowerState =3D D3hot with PME_En set. Reject it.
> +	 */
> +	return *val !=3D 0xffff;
> +}
> +
> +/**
> + * igt_pm_pci_pme_supported:
> + * @pci_dev: PCI device struct
> + * @state: D state to query PME support for
> + *
> + * Reads the PME_Support field (bits [15:11]) of the PCI Power
> +Management
> + * Capabilities (PMC) register and reports whether the device is able
> +to
> + * generate a Power Management Event from @state.
> + *
> + * Note that PME support is per D state: Intel graphics devices
> +typically
> + * advertise PME support in D3hot but not in D3cold, so a state
> +agnostic check
> + * is not sufficient to decide whether PME based signalling can be used.
> + *

Please verify this once, Also we can leave out intel specific comments in c=
ommon library.

> + * Returns: true if the device can generate a PME from @state, false
> otherwise.
> + */
> +bool igt_pm_pci_pme_supported(struct pci_device *pci_dev,
> +			      enum igt_acpi_d_state state)
> +{
> +	uint16_t pmc;
> +	int bit;
> +
> +	switch (state) {
> +	case IGT_ACPI_D0:
> +		bit =3D 0;
> +		break;
> +	case IGT_ACPI_D1:
> +		bit =3D 1;
> +		break;
> +	case IGT_ACPI_D2:
> +		bit =3D 2;
> +		break;
> +	case IGT_ACPI_D3Hot:
> +		bit =3D 3;
> +		break;
> +	case IGT_ACPI_D3Cold:
> +		bit =3D 4;
> +		break;
> +	default:
> +		igt_debug("Invalid D state %d for PME support query\n",
> state);
> +		return false;
> +	}
> +
> +	if (!igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMC_OFFSET, &pmc))
> +		return false;
> +
> +	igt_debug("PCI '%04x:%02x:%02x.%01x' PMC =3D 0x%04x,
> PME_Support =3D 0x%02x\n",
> +		  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev-
> >func, pmc,
> +		  (pmc & PCI_PM_PMC_PME_SUPPORT_MASK) >>
> +PCI_PM_PMC_PME_SUPPORT_SHIFT);
> +
> +	return !!(pmc & (1 << (PCI_PM_PMC_PME_SUPPORT_SHIFT + bit))); }
> +
> +/**
> + * igt_pm_pci_pme_enabled:
> + * @pci_dev: PCI device struct
> + *
> + * Reads PME_En (bit 8) of the PCI Power Management Control/Status
> +(PMCS)
> + * register, i.e. whether the device is armed to generate PMEs.
> + *
> + * The PCI/PM core sets this on suspend if the device can generate a
> +PME from the
> + * state it is suspending into, but a driver may also arm PME itself
> +from its
> + * runtime suspend hook, in which case the driver's own conditions
> +apply. xe does
> + * exactly that, and requires the device_may_wakeup() policy behind
> +power/wakeup,
> + * so on xe this bit follows power/wakeup even for a runtime suspend.
> +See
> + * igt_pm_set_wakeup_enabled().
> + *
> + * Returns: true if the device is armed to generate PMEs, false otherwis=
e.
> + */

Lib doc should stay generic, please move xe details to the test.
Also verify this once.


> +bool igt_pm_pci_pme_enabled(struct pci_device *pci_dev) {
> +	uint16_t pmcs;
> +
> +	if (!igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMCS_OFFSET,
> &pmcs))
> +		return false;
> +
> +	return !!(pmcs & PCI_PM_PMCS_PME_EN);
> +}

A read failure and a clear bit both return false here (same in
igt_pm_pci_pme_status). So the test prints "PME_Status is clear" even
when the read failed. Can we return -1 on failure, or at least
igt_debug() the failure?

Thanks and Regards
Kunal Joshi

> +
> +/**
> + * igt_pm_pci_pme_status:
> + * @pci_dev: PCI device struct
> + *
> + * Reads PME_Status (bit 15) of the PCI Power Management Control/Status
> +(PMCS)
> + * register, i.e. whether the device has a PME pending.
> + *
> + * The bit is write-1-to-clear and the device does not clear it itself.
> +It stays
> + * set from the moment the device signals a PME until software
> +acknowledges it,
> + * which for a runtime resume is pci_pme_wakeup() on the way back to
> +D0. So
> + * finding it still set on a device that is still suspended means the
> +device did
> + * signal but the platform never delivered the PME, whereas finding it
> +clear
> + * means the device never signalled at all.
> + *
> + * Returns: true if the device has a PME pending, false otherwise.
> + */
> +bool igt_pm_pci_pme_status(struct pci_device *pci_dev) {
> +	uint16_t pmcs;
> +
> +	if (!igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMCS_OFFSET,
> &pmcs))
> +		return false;
> +
> +	return !!(pmcs & PCI_PM_PMCS_PME_STATUS); }
> +
> +/**
> + * igt_pm_pci_get_d_state:
> + * @pci_dev: PCI device struct
> + *
> + * Reads the PowerState field (bits [1:0]) of the PCI Power Management
> + * Control/Status (PMCS) register.
> + *
> + * PMCS can only express D0-D3hot, and it is no help in detecting D3cold
> either:
> + * a device in D3cold is resumed by the config space read itself and so
> +reports
> + * D0. A runtime suspended device that reports D3hot here is genuinely i=
n
> D3hot.
> + *
> + * Returns: the D state the device reports, or IGT_ACPI_UNKNOWN_STATE
> +if the
> + * device has no PM capability or the read failed.
> + */
> +enum igt_acpi_d_state igt_pm_pci_get_d_state(struct pci_device
> +*pci_dev) {
> +	static const enum igt_acpi_d_state d_states[] =3D {
> +		IGT_ACPI_D0, IGT_ACPI_D1, IGT_ACPI_D2, IGT_ACPI_D3Hot,
> +	};
> +	uint16_t pmcs;
> +
> +	if (!igt_pm_read_pci_pm_reg(pci_dev, PCI_PM_PMCS_OFFSET,
> &pmcs))
> +		return IGT_ACPI_UNKNOWN_STATE;
> +
> +	return d_states[pmcs & PCI_PM_PMCS_PSTATE_MASK]; }
> +
>  /**
>   * igt_pm_dpms_toggle:
>   * @output: igt output for which DPMS toggle has to be performed diff --=
git
> a/lib/igt_pm.h b/lib/igt_pm.h index 328875f9c..ccb000998 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -105,6 +105,11 @@ uint64_t igt_pm_get_runtime_active_time(struct
> pci_device *pci_dev);  int igt_pm_get_runtime_usage(struct pci_device
> *pci_dev);  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bo=
ol
> val);  bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
> +bool igt_pm_pci_pme_supported(struct pci_device *pci_dev,
> +			      enum igt_acpi_d_state state);
> +bool igt_pm_pci_pme_enabled(struct pci_device *pci_dev); bool
> +igt_pm_pci_pme_status(struct pci_device *pci_dev); enum
> +igt_acpi_d_state igt_pm_pci_get_d_state(struct pci_device *pci_dev);
>  void igt_pm_dpms_toggle(igt_output_t *output);  uint32_t
> igt_get_dc_counter(const char *dc_data);  bool igt_support_dc6(int
> debugfs_fd);
> --
> 2.53.0

