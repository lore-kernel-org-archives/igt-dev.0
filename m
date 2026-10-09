Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545CDCA6015
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 06:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E109810FE66;
	Fri,  9 Oct 2026 06:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnW9BKUa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6C710E04B
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 06:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791525744; x=1823061744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ivj62ySgNhpl1MDAYEojxlJtuP0jPMkwhxfnJje60qI=;
 b=JnW9BKUavwlce4gMAyq1giMf8ExgKXiNzku/FBfQVwky/hd9PHt4jsoK
 JR8oV9T2YKUeqCrh7YNmglgk9hSeKYoMVrNZpnOVwjuiucKT8eFjXHtZM
 QISFdSa771qHTW+bxMQLB97+kqE7XwuuliwdV11rgIeOPMyGlAWr4MDiq
 vhLgfbm/xRA/IzHjlUOmU0AHsuKm6YXJQi7gEg+x3GmlxvYBe5ADOcp6U
 a6t6V7pY2veflthVtfG7xC543xpPk9i2to5wexHkPvpupYwRspiaiyoxQ
 1f7kWKTkayjaFXL8/SDN/rwB4c3ZdLy2f4UsBIceHIIx/rFdu5C5XmvHG w==;
X-CSE-ConnectionGUID: tx3oK++iRBWA0bAyRtmFcA==
X-CSE-MsgGUID: jmL3e+tJQBGrAALO7UY+7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="311515"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="311515"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:02:23 -0700
X-CSE-ConnectionGUID: 8DCI3iOHTPaCqhIsppPnBg==
X-CSE-MsgGUID: qcbhZaXmRwuJAfPQm4QItg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="683817"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:02:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:02:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 23:02:21 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:02:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNBfCUp1/uqhqT0x3bTdo0utzfklwBoAsXPQa1IluZAnw8FdkepHiDiWF6Vl2koT9u5HQFfBNBmOvajscV9RDI7qTsJVWRd85FaFUm4Gy/gZcohoXqccrpI7ZRKzrr10y22AbUW+6pv835ixwMFqZkO6EkZet/+FK8j2UVT8DY7gSWyvVJJAXUOEi1q0z7fwANp8/DwwXrfOnbCbHXpjlj7LnS1XDRjZ/+FKCk0k5OTSXeFJ9AlV6GCeoscByp+I9s36uXdf2ukHC9vGcpyY6IuOAcS1sgjbnfOEWNeGoQFeDD2pmTFjm/6r9iM6SxfuneJNEdNIZZH6tpVopxYoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cieq8Yf9Ud7ts+bhHfjA0jOqIaKw4U3RCx4JMZJrm+s=;
 b=dyy+hsPWgFNnrN6ZzNXjYCnbjA3RBdRz3eMKZxDMUuJ84EH39JHUnMWhSvOylMXc4zZk5TL6PDwvMtkNmPcVEHeR+okAjpcIDyIVzFVND6tRi40XrXxuSv89nYkw2Jn14fDSbVHD0/Q4QQPH6saWW0PhARwZMc3UuAJks99cgW8ZN6G6Zf5SeoshwDioKaxETq7wFyICGyQhjP9i6nVuKHqoxuMCWmcisA/FchOmz57nNpwXqUNgyfOsfjKrmew8frMHArFV11K0YDzqAHChC539erapMoU9WIBeQR94QDFB+bTlzzxvzdvBCvKskHHfz98BBcUFL3plRCJyKpXNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by CY5PR11MB6234.namprd11.prod.outlook.com (2603:10b6:930:25::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:02:18 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%5]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 06:02:18 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v2 4/7] lib/igt_pm: Add power/wakeup accessors
Thread-Topic: [PATCH i-g-t v2 4/7] lib/igt_pm: Add power/wakeup accessors
Thread-Index: AQHdV67KRXxb/GUa002W7pukmHqQjbb0tLaw
Date: Fri, 9 Oct 2026 06:02:17 +0000
Message-ID: <MW4PR11MB577661495AD70D123EF26336DA922@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20261009052625.419259-1-pranay.samala@intel.com>
 <20261009052625.419259-5-pranay.samala@intel.com>
In-Reply-To: <20261009052625.419259-5-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|CY5PR11MB6234:EE_
x-ms-office365-filtering-correlation-id: 36d1a833-7a35-4b1c-2713-08df25cadfe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|10067099003|22082099003|5023799004|11063799006|38070700021|4143699003|56012099006;
x-microsoft-antispam-message-info: p8jea0/RLxtOuI7T3UvapQeho/rhywbYoVIJMmtHSafns++kFptcVoFTEJ1IlqJzwNyQSLnt4dQ3enbVAQI/fggbqfIOacxAOHi3M6LLpttxawl1WLlfghcnK4RffXL+z89BvoNjO/H7zzYt7arTbyesz8ffU44pm378cxwevZmt31oIfgoFoPliOxIuA6SlJc69K8mF+mwaFQEe6bCtyeNWIvnwQ43A3a1xoBAWiu1eAD6kspcWR2ydXGi0bCLUfmEZ7UpWboE8MS/RuVdVCjW0l95tc7EwwiQvJVmSPQqsgZY70IVn0emQQUcEiw3oMN3PtqJc2vQZgxnh9yVghaFivnpvX/KitbCKIJAvdGNtPZ2vVsWrCw7bygCsvgfjH7zIl2uDiC3iqGMCtj2oqIoSEs2KL1TkVUFJ0Z8Rvj23xr/+tmPCLLyL0CsPX6+kX/0kmOarSK7G3hj7RTvTK2yJ+ALraGyh6skT32oWC955jYRFIOgUXgPTJoRej1lvZvJp+lrz0VhhAoGQ1Bq5A08uZLpkiZQHAnhE8lseD8NThhBx6Xv94/nrierXU1TqArEVcwolDVx4XB9esOvc8DGDDU0TGEBtnS0+reb3o29GYfiC60/rWSlR43P1OPsdCkBkue8DJALnvrfYsWktteSZrOrozze6ZGdTynrld7oLWIl9K/wTT2dQliO8+sZPljPGpNwqj8eNHNxp286E+zIFooWSFfG1roHtbB6vudA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(10067099003)(22082099003)(5023799004)(11063799006)(38070700021)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VSdXDr/2VVe8DxZXVVH4YwnNSCsAIDOFHCVZ8bbUWrYbW1jbjNpNHVmfD1U1?=
 =?us-ascii?Q?xqPpEcMtasj11LmU0yaPWCqTIgvIq5/qgTGMDWwS7MMY2XXXA6/INca4/4kQ?=
 =?us-ascii?Q?pb/Y7mDlhWSlichEddYeXq6c0r1C+KH4MEwhkyu5ZGy9YYJ2q3XpRilZThSx?=
 =?us-ascii?Q?H/O8HeMCngTezpHaasoKeUo/OFnI2yn4RIW6MwZU9wPF1Gll4nblt8tVX6nv?=
 =?us-ascii?Q?jHlbtTeeEL/KBjCM342yD3cOTcKVlSxXFHUoQXvoKH1h/gKVAGbfmefkEtPK?=
 =?us-ascii?Q?xv/pbLK29CqB1K8z+MNouhllgmH/4MpaIIc7tJ8P26holIkhCoAco4kzaRSR?=
 =?us-ascii?Q?1tz4ET47i61xBegJAhr2KXyrh2k1CNQLJQd5eUHtBWqxpeAlce5p6w2kXzi0?=
 =?us-ascii?Q?jZfbWzRyt+3TAVDmhaJ4r0dUyFYJaEBXhsLGEKVX6tAFdQWwxy8heAZy8H/j?=
 =?us-ascii?Q?lw7j6Xto8nnKWUq5D04B02cLeGikGZM9oBL3p8Q+998YmT+0w54vklyIIZ5q?=
 =?us-ascii?Q?5JimXZ/70nX1lPx56qHJ9vxUE1LR6eIUcgtJaJ7TKEHeqsZ1Yn2kSMEILdZm?=
 =?us-ascii?Q?Y9lRqEuRT4tvx9PsFylY6gneKtK5XNNC1V4lGcEcq+zQXVaLkQKrpvNI6cO2?=
 =?us-ascii?Q?kagmsiWGUWA84rnAtf8+czT1mJg/Clljv6WVDeRA73BHS4deJLLyYH9Zfmqy?=
 =?us-ascii?Q?K7WaQlxI/V9HyAmToZ782X+zmnbUqjPToKJNP4kebKKMfZ39wpIMJ/+/B5OM?=
 =?us-ascii?Q?ZGrg77RQSZY9rEpF6+bhvJqg6S46hnqumbwYNBIlAvy/kvtPQJOn6BSU/2tp?=
 =?us-ascii?Q?fG6aDUDPKvV32ya17GkGL8DJ5YccJ9lgCWhzNi06xiEMXSI690C0X901Ka86?=
 =?us-ascii?Q?1ZWlobFnVWNj3k5AweSFmkCnLg3lsLFgv+5gHbgCz6CpjFu/C9hl96ReACiI?=
 =?us-ascii?Q?7qsO5PZjelUOSTKfAVuMQgpD7FTc83sV0lYl4rwI1yf03Pe2Mdtveh4EMCHv?=
 =?us-ascii?Q?KHFnAzHm0cxZtcNj6IE4bArkVCHBw8EBNGk2aIm3xdrODOqoxKzijmbIDPUX?=
 =?us-ascii?Q?IeXai31s3dvmNFWk95GznwlJdPunFd+B3kaOYyA3vq8u9SzgfWtnF2ATOCpO?=
 =?us-ascii?Q?lmCFbObgORl++Z9Rmb6YAUHmz0Z0MEbhyq+Vq0kfgANcX0euPLBg8fc0bACb?=
 =?us-ascii?Q?+pts5BScixKyMxtfwpkdwuhyw5FxvPEQM5ec6NKGCaKnjkL6lfaEHywEL2d+?=
 =?us-ascii?Q?PZ1LN9HGWvlOA/LO71HUcUTAHUWdP17uJVyvSTBXn+o8bTjhwSGq8z6Qaxo6?=
 =?us-ascii?Q?U4lHB4qJEdk0lZn4cO9i7OFWxeWk/Kd0q9Vcy1/M8LSRhCWYWvLXLtKhhS0X?=
 =?us-ascii?Q?FrRfNXa4dOOb9qPdC30T77X6+gy7pY8SoB1mj61MDBQlDKWOun19POEFsekq?=
 =?us-ascii?Q?EmTeh22fsFIdsbGPQbNMvjstJtoe6X4U3DtqqVy8FkbBWKRRbvb6nneJkI7Z?=
 =?us-ascii?Q?VbGXNvOfcj7wfq7fBesQv2JVn5FajES9pEmNal4DOo9kMa5s8kL5CW/haD0h?=
 =?us-ascii?Q?H5iFGZ+4b2DmQHHzd6h5TeSwAOsj6B6I1Tmq5mPOYORKJ88/wzqvnjkqCw/J?=
 =?us-ascii?Q?3quP8ewqVOoPYGZR9jZhB5U8ghMlfu9O0PQdegewaHMHDH6tHvQ5Bilrwt/a?=
 =?us-ascii?Q?O0b5Gkq4hdtVi2sa9A64HrMWzPhl2UEMoY3WoY3tBC8lRjPs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UAw7s9GqeJOT+0x/ebdDc3qsmhnVq68Y353DVbPFA+fg4jW6HRlWAYnx65ZnTmvfYH6ogQT0ACpruMkwu/3vUFX5BMLnacoJAT/30w9LzBGQNJKtFHWAgrRAW/quC5IJZdVNTSwaZxbPKv/6jLt8k8MQRYWxlU8wWAMG4cOrRTLD3oWHuYWJvW6fmYDIv4sxgC/6KxoGLFfH5OMOm4eRrEvW/MtrfO3cSpG1vrYq07/y04a8B4WizDzRveqzfV0GfLpLZgNtSgiLwSqoDKFgKL/vZ/Lombkw8uwB7SBYncrTWNM1EgihHMsqKXZskJ3otwEQEIYGdd9jJ6c9K1kodQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d1a833-7a35-4b1c-2713-08df25cadfe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 06:02:17.9623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xIfl2qJyH3AW49Y/d4p33vVuqnXM8lPNaXXGEdsk46wCoh7kaEArb+VpFFvfI1iDL6F8Ec4vYd+5qcxSUz6Wrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6234
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
> Subject: [PATCH i-g-t v2 4/7] lib/igt_pm: Add power/wakeup accessors
>=20
> Add PCI power/wakeup accessors for igt_pm:
>=20
> igt_pm_has_wakeup_support()
> igt_pm_set_wakeup_enabled()
> igt_pm_restore_wakeup()
>=20
> These helpers expose whether the device supports wakeup accounting and
> allow tests to enable/restore the power/wakeup sysfs attribute. This is
> needed for PME-based HPD tests, where both device wakeup support and
> the PM wakeup source must be enabled.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_pm.c | 133
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h |   3 ++
>  2 files changed, 136 insertions(+)
>=20
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c index 7ad56fbce..b8b66e120 10064=
4
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1498,6 +1498,139 @@ int igt_pm_get_runtime_usage(struct pci_device
> *pci_dev)
>  	return usage;
>  }
>=20
> +#define IGT_PM_WAKEUP_ENABLED_STR "enabled\n"
> +#define IGT_PM_WAKEUP_DISABLED_STR "disabled\n"
> +
> +static struct {
> +	struct pci_device *pci_dev;
> +	bool orig_enabled;
> +} __igt_pm_wakeup;
> +
> +static void __igt_pm_wakeup_exit_handler(int sig) {
> +	igt_pm_restore_wakeup();
> +}
> +
> +/**
> + * igt_pm_has_wakeup_support:
> + * @pci_dev: PCI device struct
> + *
> + * The power/wakeup* sysfs attributes only exist for devices the PM
> +core
> + * considers wakeup capable, so their presence is the check for whether
> +wakeup
> + * source accounting is available at all for @pci_dev.
> + *
> + * Returns: true if the device exposes power/wakeup, false otherwise.
> + */
> +bool igt_pm_has_wakeup_support(struct pci_device *pci_dev) {
> +	int fd =3D __igt_pm_get_power_attr_fd(pci_dev, "wakeup", O_RDONLY);
> +
> +	if (fd < 0)
> +		return false;
> +
> +	close(fd);
> +
> +	return true;
> +}
> +
> +/*
> + * Read power/wakeup, i.e. whether the device is permitted to wake the
> system.
> + * Returns false if wakeup is disabled or the device is not wakeup capab=
le.
> + *
> + * This gates two separate things. It is the device_may_wakeup()
> +policy, which
> + * the system suspend path requires before arming PME, and which a
> +driver may
> + * also consult from its own runtime suspend hook - xe does, so on xe
> +this
> + * decides whether PME is armed for a runtime suspend at all, see
> + * igt_pm_pci_pme_enabled().
> + *
> + * It also gates the device's wakeup source object: writing "disabled"
> +makes the
> + * PM core drop dev->power.wakeup, after which wakeup events are not
> +accounted
> + * at all and the power/wakeup_* counters read back as a bare newline.
> +Tests

Same comments as on patch 3 for xe part.

Also please mention that writing "enabled" again creates a new wakeup
source, so all counters restart from 0. Callers need to take a fresh
baseline after any toggle.

Thanks and Regards
Kunal Joshi


> + * that sample those counters therefore need wakeup enabled, whether or
> +not they
> + * care about system wakeup.
> + */
> +static bool igt_pm_get_wakeup_enabled(struct pci_device *pci_dev) {
> +	char buf[64];
> +	int fd;
> +	bool enabled;
> +
> +	fd =3D __igt_pm_get_power_attr_fd(pci_dev, "wakeup", O_RDONLY);
> +	if (fd < 0)
> +		return false;
> +
> +	enabled =3D igt_pm_read_power_attr(fd, buf, sizeof(buf), false) &&
> +		  !strcmp(buf, "enabled");
> +
> +	close(fd);
> +
> +	return enabled;
> +}
> +
> +/**
> + * igt_pm_set_wakeup_enabled:
> + * @pci_dev: PCI device struct
> + * @enable: whether to allow the device to wake the system
> + *
> + * Writes power/wakeup. The original value is saved on the first call
> +and
> + * restored by an exit handler, or explicitly via igt_pm_restore_wakeup(=
).
> + *
> + * Callers must gate on igt_pm_has_wakeup_support() first.
> + */
> +void igt_pm_set_wakeup_enabled(struct pci_device *pci_dev, bool enable)
> +{
> +	const char *val =3D enable ? IGT_PM_WAKEUP_ENABLED_STR :
> +				   IGT_PM_WAKEUP_DISABLED_STR;
> +	int len =3D strlen(val);
> +	int fd, size;
> +
> +	fd =3D __igt_pm_get_power_attr_fd(pci_dev, "wakeup", O_RDWR);
> +	igt_assert_f(fd >=3D 0, "Device has no power/wakeup attribute\n");
> +
> +	if (!__igt_pm_wakeup.pci_dev) {
> +		__igt_pm_wakeup.orig_enabled =3D
> igt_pm_get_wakeup_enabled(pci_dev);
> +		__igt_pm_wakeup.pci_dev =3D pci_dev;
> +		igt_install_exit_handler(__igt_pm_wakeup_exit_handler);
> +	}
> +
> +	size =3D write(fd, val, len);
> +	close(fd);
> +
> +	igt_assert_f(size =3D=3D len, "Failed to %s power/wakeup\n",
> +		     enable ? "enable" : "disable");
> +
> +	igt_debug("PCI '%04x:%02x:%02x.%01x' power/wakeup =3D %s\n",
> +		  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev-
> >func,
> +		  enable ? "enabled" : "disabled");
> +}
> +
> +/**
> + * igt_pm_restore_wakeup:
> + *
> + * Restores power/wakeup to the value it had before the first
> + * igt_pm_set_wakeup_enabled() call. Does nothing if it was never change=
d.
> + */
> +void igt_pm_restore_wakeup(void)
> +{
> +	struct pci_device *pci_dev =3D __igt_pm_wakeup.pci_dev;
> +	const char *val;
> +	int fd;
> +
> +	if (!pci_dev)
> +		return;
> +
> +	val =3D __igt_pm_wakeup.orig_enabled ?
> IGT_PM_WAKEUP_ENABLED_STR :
> +					     IGT_PM_WAKEUP_DISABLED_STR;
> +
> +	fd =3D __igt_pm_get_power_attr_fd(pci_dev, "wakeup", O_RDWR);
> +	if (fd >=3D 0) {
> +		igt_ignore_warn(write(fd, val, strlen(val)));
> +		close(fd);
> +	}
> +
> +	__igt_pm_wakeup.pci_dev =3D NULL;
> +}
> +
>  /**
>   * igt_pm_ignore_slpc_efficient_freq:
>   * @i915: open i915 drm file descriptor diff --git a/lib/igt_pm.h
> b/lib/igt_pm.h index ccb000998..d15b01ec9 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -103,6 +103,9 @@ bool i915_is_slpc_enabled(int drm_fd);  uint64_t
> igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);  uint64_t
> igt_pm_get_runtime_active_time(struct pci_device *pci_dev);  int
> igt_pm_get_runtime_usage(struct pci_device *pci_dev);
> +bool igt_pm_has_wakeup_support(struct pci_device *pci_dev); void
> +igt_pm_set_wakeup_enabled(struct pci_device *pci_dev, bool enable);
> +void igt_pm_restore_wakeup(void);
>  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);  b=
ool
> igt_has_pci_pm_capability(struct pci_device *pci_dev);  bool
> igt_pm_pci_pme_supported(struct pci_device *pci_dev,
> --
> 2.53.0

