Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE22CA5FED
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 05:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE2810E51B;
	Fri,  9 Oct 2026 05:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/XrfU/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7393410E51B
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 05:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791523702; x=1823059702;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gq6A83iz3tPdBsDF3Z8rEfOWlkc8WDwR2+lS9p74OT4=;
 b=m/XrfU/w8NuIR1rt5/vJUQ4XO/xV5ZPxYcEil02y6hTiUveymzA8TP9k
 q3CQkbjx4H2vuoUKnnlOiOM1SBQsPnvug1bvc/szNsNX6hSP2W7nqhpDY
 GEfmcz0lShc9RL0DzJn1SJpJGhQp502GAhvERQ02PRMibbe5oNEw72K/Z
 myfF6jEnzOncH69oA61bQeBU5P5M0ZjPu+xkKEVGYBnb6ogkMNOzKGSzM
 XLLx+JWPRTcgeT70EhpxisMxbEfsAFxa+IT8W4cl5pP71lsxsg8AFffqV
 jjzL2HMcDsc8G4g3GWQPCTzHd3siZsqDUO3uyaCNF7XP+lcmTEDYS6phq g==;
X-CSE-ConnectionGUID: liW3YnykS7KKQjRktaJeiw==
X-CSE-MsgGUID: omzuPr8STR+TtzBJgXR7bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="344919"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="344919"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:28:22 -0700
X-CSE-ConnectionGUID: CBT0LbqeS92zGYCVmcc1Ug==
X-CSE-MsgGUID: M7MTEihMR0WyQpTDbrf5Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="549504"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:28:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 22:28:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 22:28:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.31)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 22:28:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSSmyajwVV26NRjOp2nPtIGrMfZr/sa3fc1vRFLKszecFFasge+tDAP26DRaSq1DsqPcrluUlgJdQupamxVs+qldYAWkhk9CMBz/37SaVux8iJe5CAn/NsaSsT0p0RSaiSRQlWMCSlXfzaDfIbmWmvnZdfTioxziXtPq75rqfGv6bHP+gYzOlPSMXTZJFag3jGepyOI04KxTAx0M0HFV7o0Q6TpMcynl4t5e22Jd3aOYIFZ4Rh2nxPk+RlHrWQa5o+69RYKwCUACLzDyWEzs2VpFt2NsRYEqgIu3SCG1rN1n0HwcGE1nuTsbM6u2lqlaG3Ri+ZS8H7+KgUp8lqB4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq6A83iz3tPdBsDF3Z8rEfOWlkc8WDwR2+lS9p74OT4=;
 b=txK/PlsZfb9WV4XxPt2Wvx/JjB53A9/CxcGHBMeh6JpDlXCGUmn/KU9CuwWPvdqs4VXgIL85Y/YUovQC00z+5jsQcRgEMe/Z/PWGxPp7hyuucz3H6RH/MBFX/5zM8QKtpxeV62urF0SbasNMOCY2lmIOyE0Abrwx8Cni4I00Lv8WpJdxSQU0G//wN0Ik/5CYK+r84/Aqgu1L3AytOvR6n0mHOJPFwWVais/st0LjFTfMt0KvBDkhGgG8k7vHrZCojlnWe7S9cWFIvkGyuQ+HQC7flznpiDdObtDkWp21QCvWZtqZqBm587Mu+6uXXP+IK5JfPDgJFyz8jQb7gW4Ftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by PH0PR11MB7421.namprd11.prod.outlook.com (2603:10b6:510:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 05:28:16 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%5]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 05:28:15 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v2 1/7] lib/igt_pci: Add PCI Power Management
 capability register layout
Thread-Topic: [PATCH i-g-t v2 1/7] lib/igt_pci: Add PCI Power Management
 capability register layout
Thread-Index: AQHdV67Gf8ISUAIPj0uK2eqBwZ6DTrb0rnLQ
Date: Fri, 9 Oct 2026 05:28:15 +0000
Message-ID: <MW4PR11MB57763F7FDEB5D456D45B9799DA922@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20261009052625.419259-1-pranay.samala@intel.com>
 <20261009052625.419259-2-pranay.samala@intel.com>
In-Reply-To: <20261009052625.419259-2-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|PH0PR11MB7421:EE_
x-ms-office365-filtering-correlation-id: 41e165fb-ebcf-436c-c618-08df25c61eae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|22082099003|18002099003|4143699003|11063799006|10067099003|38070700021|56012099006;
x-microsoft-antispam-message-info: Xel/lIBM/3B7SMRdLDV91yh6a8qdvec46VsgDE3eWH3aHL+TTNjZXdyApn36kZkOs4kIBfJBqMmEPyXWnMhe1zK0lCmk+LQtD11UAWk7zuGPRk0VZ+5uWthevRGsLHNpEj+3NMqU2j91Hk7yqZTrB9yW5NYQgnP9tV9nlc+C99Jm2vllHOWhFU0b/3QmDOJD968ANtKlDBFf2pIJxUFw9AXjr8kvrfj44cravP66o0Yqv7ksQ28C6KnifX6bzkTqw9CbbxwN2NgnS1ssGAPF/bihqIYTE8u4HT2JJRKCdQUOq2Ud+7kRtvUVFoGZUGf/oVc36koURGchKUw8Ds2pw5TH68jcx+tWeG8CRwDgWPqJVVTCFfGs//XVtDmrA90lSv9o47gO9MiHChyphiU0nqo3rRbnJRZ9RbHX0Vg6bvghFNcghxelmikjXYqYK5ctVtYDDczJHpQpe/vxzUiUS3dM9mlxGsPMZ1rgf9+fJXCPm7y+Li9aQiFA1Txaeeu+LplGIVl9GUQmagWaC42cybNOmEeqt0l+jJTrOTJK1K5edhEx/l57ly66MJQDJiDGRqc/dOI5rThg4G+3R40EfpzxLCrOdkTWhGMIifGfGkm2q5Hsp9AgWJlrEJ6pGATDy5nREFvJfKDpZfe5+th/jQmZsnrEkXMIxM1mADLu1WA8p99tKl4GOASF0MT9x8BN+YBhT6kDpQ90MC2tun/u6qRQJskyKZDat3QmYmtu+kE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Nl8hhAvOHhMUBKGBm1GHSP14RMPDRSjo52tTqXK63Mk6kkuZjYyPOIO6WHwI?=
 =?us-ascii?Q?f/kUYCfxHRa1r59YymKvm0qpQUM3NbYX0UxaJ+uXmeUg6nQjCwzABf5jtHKr?=
 =?us-ascii?Q?MnVR7LReVf8u7x+319BKk7POWYGVHwM6iV6vPmDjpL5GUWx3C9dIV9snvPmP?=
 =?us-ascii?Q?CObTqH8abmKUpSTjd5m7NCNsOm5J0KjWAms4/LUQPzGAE6hVaIph7KeONiOJ?=
 =?us-ascii?Q?E/ANDNx+cV6xwcNDmYg8bFHfwcElyzOD9hvUBRttL92Bnx27ti8/a0NeX5mr?=
 =?us-ascii?Q?ALPuR+PH6n1TRy6fBf69ojeFyJbcOJh0VKvwT9DUCMvvayMcZzy4fNxY+Del?=
 =?us-ascii?Q?vObF1Ud3u/tRErHUMo8lAIjoBqCObHqXCAsetCdVY9H3XOi8KLdX3STxdEKq?=
 =?us-ascii?Q?zDsBS20FQcl0/aWajdDM8ZzQesPcULtd6AHnmUKFuesYHRtOGQ9HKci0hLoy?=
 =?us-ascii?Q?5Ig7giUWHCgSGy3YpN0sw7WEOvsKuI2gcZWVIcUc2yYUvDzqyIyhnYfhZ2Sa?=
 =?us-ascii?Q?UD6tp7/Umzm3Y9m0aQPNShoEDi39mHK1U1J9/eOkoxxpB6BwYARv8z8sXlTF?=
 =?us-ascii?Q?uERdOkBHZVjWvf7rGD+Fsj1wL0id5OaIOuxm8rbcT0ZLPh5/E4Mc9kyNFcXq?=
 =?us-ascii?Q?5gfNbRFMSSEdnONJIs3xCtabaSlPkHd4Lzx4Mi7qYXwFsHpQW/QZ1DbWJb9I?=
 =?us-ascii?Q?/ETXA6ByLLlFv+5nq/VIoTUfqsoS1qo2WXBy9XiNeYORRb/VjIvUBKXuG0iP?=
 =?us-ascii?Q?EdSvm8vXgDa9fpZ20gBzpet41FIBTHO9LW/APTFpIOtvlt2V+E1s6JBRULWz?=
 =?us-ascii?Q?AsozVRp+n0VIZHHvUNcrG8+g1KtRXKfgWEQP0wLZOWyUcGPDZznurxU4HYB4?=
 =?us-ascii?Q?K1LnnXK9WpA0qB4Qz0P7vtbyouriadnsSOo3t7GoPIA2a4OMktZqjN4YV3I4?=
 =?us-ascii?Q?5OGk5N1PMarXhGdn9ZaL+4MaO912YeyUaYa+DqyjlzBLDekq3rtkSnsozqYy?=
 =?us-ascii?Q?XLj9rugNjH/IaZcjivDkcXcuyt1ndlWUt8KRUf/cqFRX4XyY1J9Mn60E22ae?=
 =?us-ascii?Q?7hluASNxyMUd2Lh2HZyCbTw+MLeCcS5N2W0x45h2WLO02WFO6paZusaybgdU?=
 =?us-ascii?Q?bxTpiXFIpLqaLXi0NO7cGUcP9ujq7rDwDR/hACowsyma7omzJP7v8s1ThdFW?=
 =?us-ascii?Q?F6apLoFFu9WCBOCBQ2QTPAj7yoy0j51wdN2bWTmtlXtyZCdDlhWntQDf7stn?=
 =?us-ascii?Q?APKnTZZju0h5kWOl3eCSthTXpckLi02Iv5p407dEvGaWSupLZh5daCMRejQp?=
 =?us-ascii?Q?Ou2BCJysyfMfUYTgNxcTY/xH7kkHYErXmbJM+o1m2dFBxxbcyWeA8u6JZh12?=
 =?us-ascii?Q?A+HDc/Ba/7iMU3XWPdWaxJMHJkXBeD6VyX+R7KB4wTRF2PTXq9oO8APganEr?=
 =?us-ascii?Q?iUhQJ2DnwDVX+6m+VQqqWuobVRR0GPa0qdbVJvWEErippfOXGg19k1qJaWp0?=
 =?us-ascii?Q?HF/hF/93xCnrX2vaTZtclu9ZACc6ILktjIIva0cbG/4rd6rfLdHAn7q1K9k0?=
 =?us-ascii?Q?HMFq3NvrI9PwBCuJ0xBek1bxrvWCGm+ZRrjxnlL8dCXaq6fpIPPfEMrZT9U7?=
 =?us-ascii?Q?MZb6RiIP67gtkda03FpBqTuxreHadvAwRjWFd8bIOwq/kFxiUDcZWnkUbFM5?=
 =?us-ascii?Q?4AgTH+DzxEXpuQk0tU4JNale6i0XUxoIrWX3wEOBoKN+ASZnbUrs7TvJfT0i?=
 =?us-ascii?Q?hCO+HposZA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q/QufdPgmRVxIvg6vFv3fIi2QPFP+2WiSdnb+0yI51+S+v4I+SzGTArJk25WdIc/rn6CMh+QS++MBRldAkDMER2aZzTgSYIltm0dFWoy6bcytkR3jox4NZ/9QuvIGKK8f/uVOcCJtfvN3VqbV19qcGgTGfnVLxFz89BzxXKdgZL1RuBpe982h8vcl8GhSgEG5BLuVCCbYN64nR8hJixnq7YDjDN1HZcAcatueQvR+3qy8KMOZ9S5b2NWsAHsQqdvnuGzy1PA0CkpWY7euTNPJHVQKZ2rYn2Ro245cfPtiA5nGI7fEdmsbHkRBNPZdYClCjh7Xdv12tN83Gqh7vIVIA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e165fb-ebcf-436c-c618-08df25c61eae
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 05:28:15.8317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mud5OkGBmJOERaeW26qgEBSFtfj3rS/824uO7+fsejTRl+//IKI5lnaaGsBG3ldJDwOOtPUIwqqutlz9Iz7C/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7421
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
> Subject: [PATCH i-g-t v2 1/7] lib/igt_pci: Add PCI Power Management
> capability register layout
>=20
> Add the register offsets and field masks of the PCI Power Management
> capability. Two registers are needed.
>=20
> PMC (PM Capabilities) holds the PME_Support field, which says what D stat=
es
> the device can send a PME from.
>=20
> PMCS (PM Control/Status) holds the PowerState field, the PME_En bit and
> the PME_Status bit, which say what D state the device is in, whether it i=
s
> armed to send a PME, and whether it has one pending. PME_Status is write-
> 1-to-clear and stays set until someone acknowledges the PME, so it
> distinguishes a device that never signalled from one whose signal was nev=
er
> delivered.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>

Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
