Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708FACA6015
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 06:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF96E10FE66;
	Fri,  9 Oct 2026 06:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaMNe0RJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A90210FE66
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 06:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791525929; x=1823061929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L2bJ5eZnD3E+BS760kZARHtgnAWSfrJnysQMrmV+Uho=;
 b=VaMNe0RJZrYOP/T50sUaIPp1QKdzpAHKJiBQjgw6nxpNLmQIEOAJZXPb
 EvHupbeENDqFHymOtRE4k72yBFFkdM/Cds1LQqv/UoURd2GCL0YvI1wQC
 nt/7AEUwKuFkt5go3LkSJxWaCR+Dpdjdl1l8fiFCJRPdT4irkr5aezzjO
 NSb+tfIPzrEK7QYgBsE8iZXDTT+ONwpB26xreL91ByR6snyEJKAhcAQUF
 1kBASgjwhDGa8aTvAOliyZbsbtDeO20A1v/IaA54ZXfcfwMy7XBTolD/0
 61axAQewLHvM1wTG57p22zPNORm7jjRBVSdh/aekUuiMHIpBPH8MkZani w==;
X-CSE-ConnectionGUID: BUVijBjvRh+zcr3sUHFF7w==
X-CSE-MsgGUID: 5QvdQsm7T8etfkMASYZUCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="329366"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="329366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:05:29 -0700
X-CSE-ConnectionGUID: 2atR87kYQjiAN0/BxKIGJA==
X-CSE-MsgGUID: lBOZk6qMRB6jqxnBsZK5EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="684461"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:05:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:05:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 23:05:27 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:05:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkhwXGk3bLNDqj/427b0sMjW9O5mRx7ddmWzpBENHMqeeEctxRFofjqU4kUvWMIy07v+nOmJY0qVBkGo+R+V1a1kkvzBkKCJS6SwnyfzKvE/ohruytRB/muc/DZIPAvp2ZZNku/qK+/J/bXA63TRJGoUX4QTl0sh0kCVNosibglX98BSzEXOvVlRcQMrFWaloAHM7hSseFO084ObcE0l6K94QUBKX6fRLAS9ydv/zaJnZ5RVVstM2XQk09xD15K0xTqUfTphVMRdLHvDjoz944zXA8gfqPrJw3AkGi5k2Wj3XEj3cvH0RQnR0bA8zKeVmOX7HxQMxWuaANGV5wM96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=372JDVKXqbPc1T+jpCKWlJORPEoMOH8eB+AtXoRXtTA=;
 b=Eb8tEpkyYZFvNf5EKiIOb3C96QGViQnRZfs/etdrpsNntQRlm26vilJxk5eL1+sc2IOQPIBGO6C1hOA2rMc+hxL3uA6PAuFFf/V92i/li5FziYabeyP8bTETnJW407kVGv8DrCy0NLIW8tF1MWFDcooLh0YBIpr2UHxabHsLX2VBPCV5gCk9D6aBYi+7rff5+FBvtPxYN1E7LnKX/4FGEcQGEOvZ4+wYKntLu6xSbzvvs9D4jlMUQQP7uAvCTfLZntBufuvq7jok7Q9vkEmD8vD0BGLS7GnmeKzVWsXE5b3yiKSaMgExDl5cv0rZRP3+tS3aQHXO+qHKaSZe/iT0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by CY5PR11MB6234.namprd11.prod.outlook.com (2603:10b6:930:25::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:05:24 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%5]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 06:05:23 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v2 5/7] lib/igt_pm: Add power/wakeup_active_count
 accessor
Thread-Topic: [PATCH i-g-t v2 5/7] lib/igt_pm: Add power/wakeup_active_count
 accessor
Thread-Index: AQHdV67Ousr1if6LiECvXErzG7CSc7b0uE9A
Date: Fri, 9 Oct 2026 06:05:23 +0000
Message-ID: <MW4PR11MB5776F0482F07E80897220AF3DA922@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20261009052625.419259-1-pranay.samala@intel.com>
 <20261009052625.419259-6-pranay.samala@intel.com>
In-Reply-To: <20261009052625.419259-6-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|CY5PR11MB6234:EE_
x-ms-office365-filtering-correlation-id: 7b53962e-473b-454e-3d39-08df25cb4eb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|38070700021|4143699003|56012099006|5023799004|11063799006|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: RUM7bpE78bKGkG5p+Uo+mltJBda3VHsgP96EJHWkZ0VQj2426P6NCgVfmKdejxDGZ5ie+hmo6lp5SvdaDeMjep3+QgMnrHMOZH+Ke0jDpUS27Zvw0V/6iHQWUyp3IGe2wSItA9+jWL0+w9SGUUYz0IT72sHdGoMOFfWIQNLDJi+wAyFO2oIu0vmsQBD4ERAlOhkOYK9bw+iqkzn7V06A6MSZCaYGje8RKKOqzvY9p2DyItaR9rFrDWkv11TlgW2OSnibNJaEF52uzdbYY3Rfzw/NzQtMMA/uwGpKdfyZxrfXhboEmvDzHXWRQvgYRMTy5YIbmTP5mYpcHsE/PetoV88+mpy/17r0l3bVALtQTWewnPLHLmY02g3Ai6VxjnrW2IZd5yGyRSdaq37fmUvFqrSWVNXedX9XLL+8GbTdjRAHC4gHOnGvWEHMBxtGmM4+5cEPguc5vF1RjRlHzyRLUcYw/qJag8ItNJgd6KeVPMEnLFXQ0rTAplTTi2ZkEurBDntOxfrTIu6e68GXOst0Ia/1x71e7zMH/6HmblkvkIxT3eHtw2f3FtljJuMz+6M0lh4+sleuKWvioVZ7XphnC4xC7hVZeGvloq9ae+IBVTB+i4I/dquy8SYLHWfqe4DTskEky6SKpWop/AM5JDkFDO+vwjrGT6K9cBKRy50NZBmtQZgNiLc4ws/UZTiLvlWsUmPtJnamC4QxNgYBO28829oO/rJvQCfhuftkgeZ9lOY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FIChIH6ZfZDKt7Ms444ELj262f/YpbcEkejw3MBxXe7da2jdOIGpiSsgMbQB?=
 =?us-ascii?Q?xO2HqaZBAF0vz/q6GFChe6c3wm4trpfMGeGJ44hVmWq6TNAU8O4p2Xkk3oqS?=
 =?us-ascii?Q?uOxkHhe+Zgf2vKXZmYyBinTGXDzicMEwzXsD8PSFN5C+a08Yu1dv6IT82e9f?=
 =?us-ascii?Q?nu+f9mRjQnFybZvcUj5TQysZp3gaj+7FXFuvMyfXyHfY8KRTMKm3gZgfzMIJ?=
 =?us-ascii?Q?xjzDa832b3o0vH5BD6woM9uuWKNiDwTXXb/sFLt4ljshxw8apruwWobZyIqH?=
 =?us-ascii?Q?5I+EQqjQnOUqT9K1UCPDmzwE9Sg3C/IXXcLA+dJ9soLA9r6xSETcv6BxWFGi?=
 =?us-ascii?Q?CuM5XU57c5SRWhJypXS70DMtrmEkc3PEpU6WQEN0yghGogG/qwhwfXYkAfMp?=
 =?us-ascii?Q?Jsu3Z3FpPMMbHD5fZTOt8LK2q80uhY5JxsHT96MfXqnND3kniQF1JQ3cjhGr?=
 =?us-ascii?Q?eH7lxAkpae7+9rSeCW8C/J1j+vOHRZFYAgKf6dSN+/FQ55RrgNdk8EGx7JFn?=
 =?us-ascii?Q?YRoppR6uiFrKcT/0xVlryy7ozGrIxepgEby3dTQiOk07SUmzs2r1P9ctMLc3?=
 =?us-ascii?Q?13MnOoHgcI8HIZ6tlzrrtZuGuCWYuARvVfgTSmV+QFIIxn5FD7x1ATVXYGrj?=
 =?us-ascii?Q?HQXYVDoWBUpCR/i9/t7k9NICPGwWREZ34WhcmF15erne9A04OgU1hkTP5qkf?=
 =?us-ascii?Q?kQ3W5XBrCmxDdFv31b4TFO2k3pFxpUsgdWYzm66RDWRR+3s9dALa9CFTXPpp?=
 =?us-ascii?Q?zUijquxnajgRvnuq6wP7ifonkBFM4qYeEHY5wEJqNh0tjt0CLLG0NEAaUJeu?=
 =?us-ascii?Q?E020DMtxxM1cV/gXX7Kiqcmnnizj0Fdl6cw6VI/nsHHlCuTnEdAIpk/baVUZ?=
 =?us-ascii?Q?BjsIh0z26Z2d3BzMFgT6nf7W389v6ERJOTBOQqWwQljkJ5sFzs6ma9v4hXsQ?=
 =?us-ascii?Q?atD/vI6VHQY9PAGBE+xC45sSv0RktxhZDqgKP0U9BLvb6NVzWE2ug9iKRzcW?=
 =?us-ascii?Q?Pcqv9CmijB+GFwB0pHi0bX98wUe518rF3xceELjkhN4WjjHFEKbABEQSb1nt?=
 =?us-ascii?Q?wFVcvjFO7YNgNYiuylqL45EMb99NqK8TnXOUqHNDzRkIPyK2SeNS9utee+LM?=
 =?us-ascii?Q?+m7hUnlM/V78cZFoMiqzwxGFiaq4IJa0BRKevsrfG9K86ALjn9lzpcoic5ct?=
 =?us-ascii?Q?RO2FFlJ6DfOTwHKWwZ4vLovG5uia8kEj4e0UuzQENvaiYh8DTQ85k5VH3XfQ?=
 =?us-ascii?Q?oPzo5erCkIXmIlWj1KUDy2L3+1TAJ3Z5d+LSPAxftNv96sKgL4T1huCqfi3r?=
 =?us-ascii?Q?elRiSPuXH81EqrwlFSwtTSKrDIrzAxznvvKkTNeloeWP+GODvSLEAvYnFlrI?=
 =?us-ascii?Q?1O5TfWtKRyQNykg2Acde3wlP2UO2Efb4Eq95Bc3ZrEVmCmMgIs8zDX8omgtc?=
 =?us-ascii?Q?qktBM4EkqSFjA0tFPDNns65InRI8SBqdhY9AmDAOXFe82+naTsgs3oum/7l3?=
 =?us-ascii?Q?Apn24liwiX5GmDsJJ/54yb2fJjqxjXwZ0V/4TvjHpkFFKAYc1J9+a6KNRZPg?=
 =?us-ascii?Q?iJeSJyv0PKYiycz0uZOnLuzgeq8XJv7kUiH0P9iO59Yr+h6xNGHLk/uRp1ZZ?=
 =?us-ascii?Q?gJ9t2U2biUFXHRf+go6g0VLuwD912A0F8q2WbYGlx94+2wv1wP8yGegGjkiJ?=
 =?us-ascii?Q?/mQxBArDCa5kYtL4+1kLznVS+J6Um1mixV54PofKMrWzp891?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VsKQkvtsbF7biMAlLeWa918V4+sCbVv4umR7i4WagPmAz8EOPz7hdPzPEUaqyDO4c5cv5LJAeT53mD6CFVSOfbHfuwBXg7j/W5055ajk1ZoXPNi4u4Om0+Guw9ipfqmRZ8Vj9JMpiaJuAhCgz1sKohl47c701ExI/5EKAhE0avQLDLlrmvmtkVe3n1YuYxJQ2iKJXMDAoe1fWmrvNk6TEijPyNsJNVYALP30A2WK13fzIL1vUGx/DU1jUf6YCMgy/8M88XTkunGTpqj+5ifvAAhtXcOZRO9eKeMXvLPRqKFP36RaDbMjz6RCHtYcm2e2dF4YZxhaom4K8UxfiGSW0g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b53962e-473b-454e-3d39-08df25cb4eb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 06:05:23.8595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNMU7bocZQsdYjHyXsVMXvXn39e0VAv19xI77oYRojlDLLksSEoRzDUMNnPSgMFbVglmLEjJ4N2C/mtunsCv9g==
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
> Subject: [PATCH i-g-t v2 5/7] lib/igt_pm: Add power/wakeup_active_count
> accessor
>=20
> Add igt_pm_get_wakeup_active_count(), which reads how many times the
> device's wakeup source has been activated.
>=20
> wakeup_source_activate() bumps this unconditionally, so it counts runtime
> resumes too, on both the PCIe (pci_pme_wakeup()) and ACPI GPE
> (pci_acpi_wake_dev()) delivery routes. An increment across a suspended


There is one more route: the PCI core PME poll (pci_pme_list_scan() ->
pci_pme_wakeup(), every 1s).
pci_pm_init() sets pme_poll for every PME capable function, and for an inte=
grated GPU (RCiEP) without a GPE route, this is the most likely path. Pleas=
e mention it.


> window therefore means the device signalled the resume itself, i.e. a PME
> arrived, rather than the host waking it.
>=20
> Neither alternative works: power/wakeup_count only moves under
> events_check_enabled, which the PM core sets for system suspend and
> hibernate, and PME_Status is cleared by the PCI/PM core as it handles the
> wakeup, so it cannot be sampled afterwards.
>=20
> Parsing uses a checked sscanf() rather than an asserted one, since the
> counter reads back as a bare newline when the device has no wakeup source=
,
> that is when power/wakeup is disabled. That has to give 0, not a failure.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_pm.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h |  1 +
>  2 files changed, 49 insertions(+)
>=20
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c index b8b66e120..4ed80b27a 10064=
4
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1498,6 +1498,34 @@ int igt_pm_get_runtime_usage(struct pci_device
> *pci_dev)
>  	return usage;
>  }
>=20
> +/*
> + * Read an unsigned power attribute of @pci_dev, returning 0 if the
> +attribute
> + * does not exist or does not hold a number.
> + *
> + * The latter is not hypothetical: the wakeup counters exist for every
> +wakeup
> + * capable device, but the PM core emits a bare newline for them while
> +the
> + * device has no wakeup source, i.e. while power/wakeup is disabled.
> + */
> +static uint64_t igt_pm_read_power_attr_u64(struct pci_device *pci_dev,
> +					   const char *attr)
> +{
> +	char buf[64];
> +	uint64_t val;
> +	int fd;
> +
> +	fd =3D __igt_pm_get_power_attr_fd(pci_dev, attr, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +	if (!igt_pm_read_power_attr(fd, buf, sizeof(buf), false) ||
> +	    sscanf(buf, "%" SCNu64, &val) !=3D 1)
> +		val =3D 0;
> +
> +	close(fd);
> +
> +	return val;
> +}
> +
>  #define IGT_PM_WAKEUP_ENABLED_STR "enabled\n"
>  #define IGT_PM_WAKEUP_DISABLED_STR "disabled\n"
>=20
> @@ -1631,6 +1659,26 @@ void igt_pm_restore_wakeup(void)
>  	__igt_pm_wakeup.pci_dev =3D NULL;
>  }
>=20
> +/**
> + * igt_pm_get_wakeup_active_count:
> + * @pci_dev: PCI device struct
> + *
> + * Reads power/wakeup_active_count, the number of times the device's
> +wakeup
> + * source was activated. An increment across a runtime suspended window
> +means
> + * the resume was signalled by the device, i.e. a PME arrived, rather
> +than
> + * initiated by something host side such as HPD polling.
> + *
> + * Use this and not power/wakeup_count, which is only incremented under
> + * events_check_enabled and so never moves for a runtime resume.
> + *
> + * Return: the wakeup active count, or 0 if the device is not wakeup
> +capable or
> + * has power/wakeup disabled.
> + */

0 is a valid count also. If power/wakeup gets disabled in between, the
test will report "resume was not triggered by a PME", which is
misleading. Better to return int64_t with -1 when there is no wakeup
source, and let the caller assert on it.

Thanks and Regards
Kunal Joshi

> +uint64_t igt_pm_get_wakeup_active_count(struct pci_device *pci_dev) {
> +	return igt_pm_read_power_attr_u64(pci_dev,
> "wakeup_active_count"); }
> +
>  /**
>   * igt_pm_ignore_slpc_efficient_freq:
>   * @i915: open i915 drm file descriptor diff --git a/lib/igt_pm.h
> b/lib/igt_pm.h index d15b01ec9..1e9234154 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -106,6 +106,7 @@ int igt_pm_get_runtime_usage(struct pci_device
> *pci_dev);  bool igt_pm_has_wakeup_support(struct pci_device *pci_dev);
> void igt_pm_set_wakeup_enabled(struct pci_device *pci_dev, bool enable);
> void igt_pm_restore_wakeup(void);
> +uint64_t igt_pm_get_wakeup_active_count(struct pci_device *pci_dev);
>  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);  b=
ool
> igt_has_pci_pm_capability(struct pci_device *pci_dev);  bool
> igt_pm_pci_pme_supported(struct pci_device *pci_dev,
> --
> 2.53.0

