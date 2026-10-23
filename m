Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E2B606A336
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hgOyIflJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC72E10E5CD;
	Fri, 23 Oct 2026 09:00:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11E210E5C9
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792745950; x=1824281950;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KSttKK+hA4YedBVaQ3XS9vpizUykpP8snGQ8Xmr4JII=;
 b=hgOyIflJdcgk39d8D2HB8EzJZDGMSRd3AGdGoGFO12o+hVtjgrspmypm
 WITxSuYansTuHvusaMVvfxKsoAsTTFgoFqGitfrRjdWgf3y4bPrjlUPFO
 IjjlRF39c5qzy1Ah93rvqJapBB7iOpoAecCOycTLT4+q3i+1qqo/Qbsct
 F5+q80n3l2FYnckTNwt00utvQCBSfV+szrvMDRSWbMKY/5pIMmMu5G1JJ
 eVazkwSeS45+QDIyEcNmSYKoAhpatClDAfFXbLXrxhtGENgTLTCuas3f6
 cjxzknTxgkEVdp4BgZHDArL7/NiNLy6UvN1b9hPeq2dnR/MU4dUGMMtaz w==;
X-CSE-ConnectionGUID: vDSem+vfRgSi7YUuBS2OWA==
X-CSE-MsgGUID: K3PFWa87RpGGKRS8e5sQdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1507900"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1507900"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 01:59:09 -0700
X-CSE-ConnectionGUID: xiUArRXESxuCiS29XvhOyw==
X-CSE-MsgGUID: 4t4Xntx9R3eSC43lWXJb2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3918814"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 01:59:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 01:59:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 01:59:07 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 01:59:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgI91m/2FlZfktZb7VLc5I99jJBH2HW7mKKm8uVx68OQKF0sZ9/g5ILDK3nSgRWoOF5bj+WJ38oKNoOcACRkjOsfKgvREAOOXEFfAK1p9CWvp+hqno+20lU5ePRPMp7INFRbHqeyGaGuijP4U71QUIwa+W5ZPHG3Q0ETF5N8UrQVAySK9UrNSXcr5gFvJEPZyTm6pvQd0+Cv/1M5WSW65LdIisTTZYzfsVW5ijH6qrxRoJTvDvFwo3hK7WNxwtoNFuKxCOJSMfSmws4tMAeqHXrhlCSdtUJA2K+Pg0m48UJB94hpe4mJM8Z/5I2ExLJGLR0V2zL7vMwqKiSSkM72Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2Koc9e8EacBlz/WTRvFAhMmoCOf9OQSkXnlwr+vSW0=;
 b=YLNNySD3uiS5u7i2UWJY3NHOQ51heBeNG6y8aWoe1XuHnWm05TO142CbJqI2BH02rrUZT4hjT0AdJDqiq/bwlWn8VNqPEPzZe79lAkb9/ZBV/YWZN2Pdf5G7yqrxSE4D0LTGfOB63GZ2b2JnxTB+jOV4WVl7UMjSvPs5H/9/C8JJTg5RaG5rMFC/0vZAqBzVbgkuRVyGlix9CndSozz0ABA7e7ecpe3nbp2KJrcOxQFhXqpbgvKbf2CddYt91vrTHoMmGD5wd2C1YztoMM6qLLA+1e4JUD4gfLQH24nDAZT8mCHAJhxq5zT6vfoQnyvWYgqAK1ne7MFaGt6l9rXdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PR11MB507330.namprd11.prod.outlook.com (2603:10b6:8:503::18)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 08:59:00 +0000
Received: from DS4PR11MB507330.namprd11.prod.outlook.com
 ([fe80::5d1b:9fb4:12bf:30f4]) by DS4PR11MB507330.namprd11.prod.outlook.com
 ([fe80::5d1b:9fb4:12bf:30f4%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 08:58:59 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v3 2/7] lib/igt_pm: Add PCI PME capability and D
 state accessors
Thread-Topic: [PATCH i-g-t v3 2/7] lib/igt_pm: Add PCI PME capability and D
 state accessors
Thread-Index: AQHdYJ0FH7hoV9kLSUG3vNSPG6/7MbcK2AIQ
Date: Fri, 23 Oct 2026 08:58:59 +0000
Message-ID: <DS4PR11MB507330307E6A1AF17487692F75DA642@DS4PR11MB507330.namprd11.prod.outlook.com>
References: <20261020141151.753331-1-pranay.samala@intel.com>
 <20261020141151.753331-3-pranay.samala@intel.com>
In-Reply-To: <20261020141151.753331-3-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB507330:EE_|SA1PR11MB7112:EE_
x-ms-office365-filtering-correlation-id: 92482947-b222-45c9-9cb6-08df30e3e0b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|261021123027099003|261022105027099003|261009223027099003|38070700021|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: U4E9UNUhWmFVGotss4yqANN/xxpHPcnC66T8HIh5QBjxILkFH1fsWMD+duWnYhd3BEDSYGDOniHKoCQ4/hC4/s1URwilrLS8k0eyT6i3lKvDNWi0xr0TaSjpjn6Qei9pD/qoL6Kl2tiFbYnuoyrlOTgX9jSCO+ryo0S8NBY29tgvhwqOgtuDq4cxRRLABQLjyQg6/n0DmgyEkl8w9f2bCMRPYVTlSsINejkSVMQZyHQEL0DVHzuDaCMbaokvGVWFpMW66y3jpZ74JMVjfoMrJe/XVEnrR9BimLJed+nqcOTYXpi7ldsJNhFBOrdlGNIKPPmy5sh6BbTgbELCy0Lj09l0QqGvQYHT6VyPgwy00t9AZDxIoNTTJqTLhcRtY8IdDbA/Sh56wLgt5WJRoa7v9lsRG2gTcmZfVnsP+9Af0rYgLaF12wZMYdQ4fAvyqVKG+BvNL6dQE/ttSpEBXu+b5yqlrLgtgv5S3VbtF3MGdl2qDMKKynOOXHQ6jtP8gc0plzev8oK2f6vjDx72arrl/6U5eyjTcKN4YC9+FKxw1y8+FDxRKgjdTGfFWceUtMyExROkPIynx2yYOYSwtqn/+74NmWL3+4IJmGLrr0HqV33H1KHE/YwndEarfg7ew2l7OnK6VMR1VTRyQIg6E9KtvlllWGQ6UJiPpHO6kgux8uChFhrkTS2pkX9uryHXV+9cuKNahGGUb4/MG40JruBuhpyYnoooqFalETVLpkO0TeE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB507330.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(38070700021)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2XVXw+f4rV1iV6EYzLj91N3UTbtY1W6p8TBRlb/YT+lzMyIZ11N4F4ONR6Kk?=
 =?us-ascii?Q?NyMVee9wZ63TJmSNW3TF0W6xKUljS76yFGvTG8ct5yRjqyTn09III9Fbutfx?=
 =?us-ascii?Q?tXBrzPf6vGCBcDphweGeEYpCF1SS2SEq9cOd+3UN3xMHqYbEAu5M/iGG4syA?=
 =?us-ascii?Q?jRnJ1GTCsRCD5vzQQarSBjwAImAJqdLokTr366Vw4ss/1/QHV4fpIcklR7Nn?=
 =?us-ascii?Q?X9/vQhisJOtc1ZEllCqTYbh7MJmbUB0NFoxYEDGpuaAfsw3gxXk8wMWb2wtV?=
 =?us-ascii?Q?V9gbGEo/HWlAIeKAzHFAZGwE9mLSkI8epSrP2a48wqntS2QNYWW3FedmmXYy?=
 =?us-ascii?Q?AmTlvItxucigPzjw59BcMwDge0UzFpMtoYfOEzqseMJHmKG5r5+dbPPSDABL?=
 =?us-ascii?Q?1cANY6r41l6hnwYzVZ+klVmb4OKlQ5qKr95WNICYDLpks4XWRCn9ytFQk1r+?=
 =?us-ascii?Q?m2/fuyUfufDSBXALGIYwxpfTWmq1tX313EeFm11okENRWGslWBip/RBhyH+H?=
 =?us-ascii?Q?Lzvs706ymj4gvKt/xvCgZac/cP6D59VixXS+qICzXv/m4kayu8wCCyOXNOVk?=
 =?us-ascii?Q?UO5AwrOQJ9KGzbFRZv4bOkaM3aEi1HjYzLkcDuTTFoGzrItJizYLqXlw7DJp?=
 =?us-ascii?Q?4rK1SOkrG31TnerqtcQGK3e8ZfJpnWOpO5ccMlgoCIRoDZozmpX3Yq4riSj2?=
 =?us-ascii?Q?NjQMoz4teS2I3s4q2jtdErFYcl12vZAOwnnZCKmmqc1CcEuJ5poWqeqLsbc0?=
 =?us-ascii?Q?/53zAQKqQ8wOxxQEH70yLEozPIyaL6mOkTNkKFebL6SpsQFPSy0Oxnflr9mf?=
 =?us-ascii?Q?O2la9awsw9b8ZIj6TbIfhKlzpK3QV+eqSJAebcNyaCz3MXtvXm5Uqnw30iH5?=
 =?us-ascii?Q?kyAvQJHfVKHV8cUSlDn2SNePLV4m2rpVHw80r0FdpYWYZoNFV2i6lP/573ep?=
 =?us-ascii?Q?3y/CtMIUdAGo58/fjgJqNHTqPlQXxh8FWSbCXrQ2WE9nOxeYJ2vxXOConLWI?=
 =?us-ascii?Q?68qiWL0ysHOVQzllfOYcskOmvnmxYEv5eQApOUuU9MHm5SugcUJcGojZo5rZ?=
 =?us-ascii?Q?RT2/KPo/LnvP2CoV4ew+/V/FtJxsyUiOseyfC/E1UrcbcDHmmz/slpKoIRax?=
 =?us-ascii?Q?hk3vzCTvHEDkWqV1hWlnD4TrdcLVxv1De/foiW4LD83WSEp0IjkLdBit5bhd?=
 =?us-ascii?Q?ma+5lKVcamBDKSLMHJ476akFVoyHND1ujGaxbYsBH4u3WkcCE+YpMAOU0AZK?=
 =?us-ascii?Q?l/LBMYa3nfo950MMdwC4MaeqoYPF0d4Ymbjgh9WzuBKjka9tGB2b8T5wxLYp?=
 =?us-ascii?Q?DTM3HZvADrgwTHZvWmLlZN5bSTSOlQ3GJOyFRB4kL/FRRLq+b+eTM83/eyw/?=
 =?us-ascii?Q?hEnEa/Oq8r3SDnsts70LI/6F3Tc+snrMLVPPEMp9DVCO6VrMHG+fu8TVmHyL?=
 =?us-ascii?Q?fgtxdWUWJLGCOuuoXnWlmt8blACKktWVrxA6+KAddXYdCpmAGiAj7YtFTJcZ?=
 =?us-ascii?Q?4Q8YAVXmortRN32fpcpYor0CgnypLoWOK65e2zjc98F3LJkqkYUrxSd4d64m?=
 =?us-ascii?Q?c33mCa5CZFaBnQbECD+RkIjVFrKCelxSxKNfnWhl4QLqhWtiht/EB3W9ZFTS?=
 =?us-ascii?Q?nyB6mK6LwqvmWh4PBEJTBEO7dL2eAstYouwOpC3zk25ur6ZjASwXItaRW2k3?=
 =?us-ascii?Q?d2pqxAJ/PlooLdC8LAsRqLG99hiGB5S//bc2RdBOiZbhyPr/nwbT6OjIt5oX?=
 =?us-ascii?Q?sXTraidh5Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XvqSDK7ftQMMA7nKIEZ42cb8bO2GnkdC1ZNUIpjhssbMMjugV8naovsCSNKH73l+rb+i+n4US/G43Q2O7QSZRi5RN9voOSMDtLNcaddTmXP/anZAWhy1B7OKW7vgRwpl1ssqxhGvLqnXGX1LxbNCzv7MwcMGLvqO8ATj5b7mJWfD65G6gm28+S0pCu/qZsR9Xstw4pryJGT+1LOTMMbZ6gzIpoGUYLc2TwZ+TLgQkaaZm9IjgUhP5qHoHb5OzGmSuDYrcSbRxs0ZSgTek56X6UkWMLfCtjCba53LGDXQTFNzXgYtLR4Ra7QPjGCBkYSk59hGofMq8ViF0YtBDT2o+w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB507330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92482947-b222-45c9-9cb6-08df30e3e0b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 08:58:59.5285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ER06v37j3soq4bUR3+N6E19guXH+jcsrirWWW13AvlxjOjFxC8UQUYJaqCTrG9A/rTHZLIkzjK6G/H32u49/AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Tuesday, October 20, 2026 7:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v3 2/7] lib/igt_pm: Add PCI PME capability and D st=
ate
> accessors
>=20
> Add helpers that read the PCI Power Management capability:
>=20
> - igt_pm_pci_pme_supported(): whether PME_Support allows a PME from a
>   given D state. Support is per state, e.g. D3hot but not D3cold.
> - igt_pm_pci_pme_enabled(): PME_En, whether the device is armed.
> - igt_pm_pci_pme_status(): PME_Status, whether a PME is pending. It is
>   write-1-to-clear, so it tells a device that never signalled from one
>   whose PME was never delivered.
> - igt_pm_pci_get_d_state(): the PowerState field.
>=20
> Config space is read through sysfs, which resumes a device in D3cold befo=
re
> the read. So the helpers check power_state first and, if it reports D3col=
d, skip
> config space and igt_pm_pci_get_d_state() returns D3cold.
>=20
> pme_enabled() and pme_status() return a negative error code if the regist=
er
> cannot be read, so a failed read is not mistaken for a clear bit.
>=20
> v3:
> - Check power_state before touching config space, to avoid resuming a
>   D3cold device, and report D3cold from it (Kunal)
> - Keep the kerneldoc generic, drop the Intel and xe specific notes (Kunal=
)
> - Return an error from pme_enabled/pme_status on read failure, and
>   igt_debug() the failure (Kunal)
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
