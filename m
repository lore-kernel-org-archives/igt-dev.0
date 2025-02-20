Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD54CC021AD
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 07:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A7C10E8D7;
	Thu, 20 Feb 2025 07:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXa7RGly";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8213610E8D7
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 07:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740034852; x=1771570852;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lHJcv9s3Ok9kCZHXOILX656G0V0mh+GEF2nVky5pVnk=;
 b=BXa7RGly8MtBCF07cTLfkFYaAz92kKPS2wncD07e/PCnTUMMJxIsCJpd
 wh7OekP6SjuB5Me44TbDLTo8eXXVh6jYv4C50y9kY6unAF8oKqJDrmHYd
 OjtZR75UshlEeFR1DOxHyBmCYgvGlSrqKHDDaBlM9NnSCM/7x23s3yuVj
 X6oDfni69ksXa/YqIAVv92bEJ+gfe+RCblcc77DUkvn82VKBv0b7z5WmA
 5sD3kve0jQnNMqQwFZ9Y/9JOfjpiCOeXh7pOxonYtXMsPTorhZM9pDfwT
 4HcrY5mEG2oEaIxjyYqIub96Y79RpEjlXz9hfJYLy1S1cKKjhKUgae6K7 A==;
X-CSE-ConnectionGUID: ka45xTA5TQCYqrAvnGcFGQ==
X-CSE-MsgGUID: 4I3OZOucR2aleIUIw7zIlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51782120"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="51782120"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 23:00:25 -0800
X-CSE-ConnectionGUID: y9epiE1HQvyxGw7NR99CLw==
X-CSE-MsgGUID: UFi0KAg3Tf2xiGTFpS0e0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120176080"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 23:00:23 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 19 Feb 2025 23:00:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Feb 2025 23:00:22 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 23:00:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lL6JcJrKrNrG+3wmUB9YaTs3wxQrg3f5osnJ/2AdenchmMNLg4TqQOf/+ScaTwRHsANhtCu85/JQ77lpuk1cx+QWjhvAwZ8pjsODKdiHyPcWDJ+z8paP5buCBKobnQqQ7Dt1H6QyKdXPd4D7cTOtnrslEBfCabc9ULB1DXE/0kkiuB47wPK1SrcjviVglXPg2UFac8a6JKZD9zlC2u8nGVGAvrFWOxpKJAyUIfRqGg2yeU4Pkt2EsjWj0oUAslT745jyipRBAHPoW1b3jkgf2UQ0667UebBUdVoaQ1qSfWFxfghcaxNW2M1hi/C4okFYrJXa0ayoKOQQGm7kGp9fLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09/g3KxAD6G/HDVGHWvhbZdd06L03GE53I5INc24Sx0=;
 b=mados2Mk9XdIsdNBWP1hjGEW5ZyZrT/j2iRgEcX5UZvdITlQALQs8I2UKJs+S1hopP/tF+VqXDJvmIFUCihZ9sHJM6mca5X7y9ylkw0JPo5roRslAQGsWo/AjSq1MtMtac/yaLi9Cyq1E/yxylRamEMEU8lEeOSWDM5hTwyjJbizsc5jyAjiZVDZ8VUnozf1qUZbFyGuyQaM0OFNRAo8QOO518CWiTB/LvFyusOu57Xrih4k3wm5vsl9iUU4yJwx0aG4aL5PkX9ZnLhO6AcJL7mlq0WPISQT/ZM8+mzc//WyIxRrOyei5CRWs/UUzFk1bgg06EgIv+s6w9Gmwu+3fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 07:00:09 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 07:00:09 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Wheeler, Daniel" <Daniel.Wheeler@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
 dynamically
Thread-Topic: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
 dynamically
Thread-Index: AQHbcUS8Dnt3WWmwDUO3/cDxIV+RgLNAuacAgAAM+wCADg7wAIABEZ7g
Date: Thu, 20 Feb 2025 07:00:09 +0000
Message-ID: <PH7PR11MB6053DBE332C4F17F19B72C55E7C42@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250128052825.424586-1-pranay.samala@intel.com>
 <abf8b026-20b6-4566-9823-bb558deb97a7@amd.com> <877c5x4wrv.fsf@intel.com>
 <DS0PR12MB6534D129E88682D6235797089CC52@DS0PR12MB6534.namprd12.prod.outlook.com>
In-Reply-To: <DS0PR12MB6534D129E88682D6235797089CC52@DS0PR12MB6534.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=61518c5a-4f53-4440-9d09-002242c8db3c;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-02-19T14:38:47Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SJ0PR11MB5070:EE_
x-ms-office365-filtering-correlation-id: 0c0d540e-d6ce-4dd4-1b10-08dd517c36f4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/t9C34ncdeXFO9N844fEa6VwT2F+b34vpqx8fQl8sj+kJAAYLg7z+0XfCT+H?=
 =?us-ascii?Q?jywfK4aU4cIypv4Is0mL5t2XA4PtEgtR4MqCsnEyGVQFa1nqPIEKmd92DtJi?=
 =?us-ascii?Q?bcyH1oIPh8wpRVWwRp6KD+e69lWvn8qGMhdR2aG5RU6WDkUMbpj3UKKzy4fG?=
 =?us-ascii?Q?ZEiJJDLEqCL7/teRWkZ5/OUQhWmmXxTTkwItYufksSM3g/vrvjcY8x2jH2hz?=
 =?us-ascii?Q?Th6/Zjuu8UF+F2TLnCny6TOmBCudEi3iscQ+rLgQ9PIT7ZkW9S8pZ/YE7fYY?=
 =?us-ascii?Q?4il/HUIOJC62yoYYhU2bG4gxuM6W2iQjEMESvOe6KBuA9iaVegJTp/dm+Q2R?=
 =?us-ascii?Q?fc9p5UniwNwgATyrdqsHp4syO0ZMUlcIZ7R96/BvPFO2+OzyWOz+STwOkyOP?=
 =?us-ascii?Q?jXh7Kxts8FOBVvyj7lqpK6k7XwLTpPHAoMMjKzdBckCKzULkggsDlcqHMCtv?=
 =?us-ascii?Q?rn3cNflYGt+ZBJcFv8ykiWe1OEON+TI368j/9606+3BPkuYqPXcLBSnhwOBT?=
 =?us-ascii?Q?LmQDg0DYWjTUjeRR6pspluB5a0L+9avAcoBz5HRKPa/YcIudWRf5Ryi9+ZYZ?=
 =?us-ascii?Q?aPddFfpgqCK2k4Vfg5CqwIwBBNZmLErqUr3D6wHrzSrHMB6gL37a22OkbZeM?=
 =?us-ascii?Q?JYtasRtJ0HspXFZMQGTUk2qUcgyuq1p7Rh7S4Dv3PGYzaPhrnI/KAzqLVTR6?=
 =?us-ascii?Q?ybMoJMbIZAvR9IOhKBd59Op2D79eq70TRHAG8ksJMKEE/+Q8s6qjv4qJa66z?=
 =?us-ascii?Q?Vd2/KMhort58UImOVHJWAwUCvtezs2BmvUXmV3Im/ruOZl7e8RUKIr44X+5e?=
 =?us-ascii?Q?WOQNN2dF+8KXL4tIVdMBubToLnurCZhPoorIXyKLwX8fGQ3VzOv8di9BNHgf?=
 =?us-ascii?Q?v8gLDb65AXun6DKRRfUrIbcEGHL6J7J3fOycumIvBhPg1g7ilJLcdmMTPh2E?=
 =?us-ascii?Q?Qvoh/RfYzHIPvE4Z+HH8AUzsZnZwSjes0oOxkZBw+PV02mRpQf9QXCbTeaGA?=
 =?us-ascii?Q?1eGljVQxsrSHEKusZlHnnn8NScvy7uCmSP97u80k2W9QRvclKl3MxCMa35j4?=
 =?us-ascii?Q?J3pMtMvgMWx/lB3FoGF/MHU2teNCkvIsYIcC+vZ5xA2HBeqOscpjjn6SNouW?=
 =?us-ascii?Q?pmlIZjaSwoUPUd3HsgZsielGwRJ+swoMOrP8oaWGx8DSjnM6WobIvxnuvo/J?=
 =?us-ascii?Q?f5xUVOCltuxZLHCHV2BwWFUU15F4JgqyKTeYMkHskXg/7a1wpwryhF06ru6t?=
 =?us-ascii?Q?IjtArBKfkpt0wBi8PZ7GTXcdMKahAkdL3mgGhXJWs/DcbDyTLCtA+IkFzyyu?=
 =?us-ascii?Q?MLFmhG2CygnXCKLUhOiN8cx8UA+jHYW/0RirsqfOezIpE+JovfSMZ9DwWEMx?=
 =?us-ascii?Q?lnAxufGpP8BnFnza3rp0TAE3lCsf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A8zYJzqEdPecn/XppNjsxfCfMFb6MdhfEKknOdb9L6FoSNhEYWoT0zL+sXPU?=
 =?us-ascii?Q?eJRA76YCfl6g4D4Vk9FFpfufBL9C6pAR4b0Kcb8QNdgiUlxiuHVkSBbq7q0z?=
 =?us-ascii?Q?/Uce4Vu5WaF4QdiVfPpcg6XOgdVR85DHNnwM9bZ8HdpIfNQO2R99h4V1RSYP?=
 =?us-ascii?Q?WJV8FS5Wn5C7r1AB2zCEo5LtKPhuqL6msK1vI53GbjT0K46KYKaQSFTYb0G4?=
 =?us-ascii?Q?eo8/w09x8iqvc6SgQCXoe0o96H+Ht+w/FZBEIAXpf2iXBtKbhKL9ZV+I4zyN?=
 =?us-ascii?Q?cHyxKvYCFW4FHlDiM9j91VToIzlPyB2eTDII1waoF3rOip/szOYZKhNFRV8H?=
 =?us-ascii?Q?3bZJ0DF47XlcsgzxgWPanvqWWMHEW0cVaoFnP3IfTDMvQ8UbUb8zOaJdo+nm?=
 =?us-ascii?Q?0jIIteT5RTGlMABawJgjzgAaYBJutPzLmXFRvJQZyaUbGF7TonutQ5RShGbm?=
 =?us-ascii?Q?IokOwxJZZifnQpGWEkAOnCiZ397bTCsHRUcufDuG43GuH07TbZow3jVRTuYq?=
 =?us-ascii?Q?q5OFBKv/SXzmswbREDV0B+5FM1vAJbUT2Fy3v7P8nP9DX2gell9zwaCkU6xy?=
 =?us-ascii?Q?c0EPhiB81wjHf9cXMgWvw7COwRY3i9KqX4N4XX3U6J7r1Si5H0k4qZ09aF+j?=
 =?us-ascii?Q?xrqhaVwvXiWx4I/lUL9qb9hNRUWcFF9/GcwPzSfjSyS9avCyybaU0ID3hAl3?=
 =?us-ascii?Q?ZKoI8WX/fhmgu5QygRbo0FHLYN3nia9cFXw910fohp711p8rC7cKkUdqNce+?=
 =?us-ascii?Q?d9nawNzYVPKm6PtSaz4yM2ZOd9Xn3DGCp+Lei1PPcP2vcC+b0Kgg/qCb0qNH?=
 =?us-ascii?Q?pHAtObFlDjRI1Km2UjKgCn2bQR8XY4+d+rxsmbLyrbkWfkXZFfrR+KnvZ3vi?=
 =?us-ascii?Q?Nvm2R14tJFRRnsySmHNOAzZQbVA481SJD1u1cUdxL2BCgNEWyTKW0RBYrhju?=
 =?us-ascii?Q?9MNGt8ABfSBVj2PEaH4H+i4Qe1nota1K2CTV1BYeWgO+4m7N1+bRo+ILgodA?=
 =?us-ascii?Q?zC5dLeRCBd/0RbnF02VjAWvllOMJa9yJMd5OW+F95aUkvb37YivKz4w+rhyx?=
 =?us-ascii?Q?v8SXek/ujmeojJkcykK3nJ3TbAps3UfOP0L2RZYjHK2x29dLs4gpWOYIjw9B?=
 =?us-ascii?Q?8wVAwv9xqo2Iuf4rM3N9zhiorc9jn1jsurQSWAZ9PpvXpGJ07+29zSUy18Gg?=
 =?us-ascii?Q?gSNb+2iV2+Jne6MR/eLVb1G/sHp+FkRuukiaYRQiwqTCwelHj4FJcGal2nie?=
 =?us-ascii?Q?ApR/VEBN9J3HX1TGkJ5tctzcycrx0k2kOXbM8i8dGcGwp7+M1pr9+CFKkY/O?=
 =?us-ascii?Q?cUw8tg4RYUGn19GAuog8Y3OM0NhnFcpVFxchHZLGeL3IWS+PUvhWH2q54yR+?=
 =?us-ascii?Q?d8i0YlW2NxnnUO6IDJX70FYj0R356P8lzLcq0nvD1xiIBEpb793BEqK82Oiq?=
 =?us-ascii?Q?Zh8GpE0BBjn3//NiAx+jqqqSFxiifpQOUZRl0s7CJwtiu27TqMc+S1djLoSp?=
 =?us-ascii?Q?W6y5cO3vxBHuQtNhf+jmO1nWKx5zWTKuR2/RSBrW9r4g+r13HqRFP2Pl2R2H?=
 =?us-ascii?Q?05/oMZMEwnrSGANpvHM9Lq6C7lNnwd56TM0nCPRP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0d540e-d6ce-4dd4-1b10-08dd517c36f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 07:00:09.6046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dqw/fgKImeSZAB1rDbyPQrsaDcPlHzB2JUbnfNbxoDgvJxtVrlGkf3/3OPFjD75SkJLm0h0Ye39ZK5NPV6TQZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5070
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

Hi All,

Thanks for pointing that out. I'll float a fix for this issue.

Regards,
Pranay.

> -----Original Message-----
> From: Wheeler, Daniel <Daniel.Wheeler@amd.com>
> Sent: Wednesday, February 19, 2025 8:09 PM
> To: Nikula, Jani <jani.nikula@intel.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Samala, Pranay <pranay.samala@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1 <kunal1.joshi@int=
el.com>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>; Bhanuprakash Modem
> <bhanuprakash.modem@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Juha-Pekka Heikkila
> <juhapekka.heikkila@gmail.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com=
>
> Subject: RE: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
> dynamically
>=20
> [Public]
>=20
> Hey just checking  in to see if there has been any movement on this one. =
I'm still
> having to revert it from my local IGT repo or my runs take three times as=
 long to
> complete/logs end up 10,000 times larger than they should be.
>=20
> Thank you,
>=20
> Dan Wheeler
> Sr. Technologist  |  AMD
> SW Display
> -------------------------------------------------------------------------=
-------------------------
> ----------------
> 1 Commerce Valley Dr E, Thornhill, ON L3T 7X6 Facebook |  Twitter |  amd.=
com
>=20
>=20
> -----Original Message-----
> From: Jani Nikula <jani.nikula@intel.com>
> Sent: Monday, February 10, 2025 10:58 AM
> To: Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Pranay Samala
> <pranay.samala@intel.com>; igt-dev@lists.freedesktop.org
> Cc: karthik.b.s@intel.com; kunal1.joshi@intel.com;
> sameer.lattannavar@intel.com; Wheeler, Daniel <Daniel.Wheeler@amd.com>;
> Bhanuprakash Modem <bhanuprakash.modem@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Juha-Pekka Heikkila
> <juhapekka.heikkila@gmail.com>; Ashutosh Dixit <ashutosh.dixit@intel.com>
> Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
> dynamically
>=20
> On Mon, 10 Feb 2025, Leo Li <sunpeng.li@amd.com> wrote:
> > Hi Pranay,
> >
> > This change can also increase log verbosity; we observe this with amdgp=
u.
> > Details inline.
> >
> > On 2025-01-28 00:28, Pranay Samala wrote:
> >> This test is getting killed due to exceeding disk usage limit on CI
> >> environment because its logging to many logs.
> >>
> >> So dynamically reducing the debug log level to 10.
> >>
> >> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> >> ---
> >>   tests/kms_cursor_legacy.c | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> >> index 1f082df2d..533972cd4 100644
> >> --- a/tests/kms_cursor_legacy.c
> >> +++ b/tests/kms_cursor_legacy.c
> >> @@ -40,6 +40,7 @@
> >>   #include "igt_psr.h"
> >>   #include "igt_rand.h"
> >>   #include "igt_stats.h"
> >> +#include "igt_sysfs.h"
> >>
> >>   /**
> >>    * SUBTEST: %s-%s
> >> @@ -1840,6 +1841,7 @@ igt_main
> >>      };
> >>
> >>      igt_fixture {
> >> +            int dir, current_log_level;
> >>              display.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> >>              kmstest_set_vt_graphics_mode();
> >>
> >> @@ -1850,6 +1852,15 @@ igt_main
> >>               * fetch is enabled, so switching PSR1 for this whole tes=
t.
> >>               */
> >>              intel_psr2_restore =3D
> >> i915_psr2_sel_fetch_to_psr1(display.drm_fd,
> >> NULL);
> >> +
> >> +            dir =3D igt_sysfs_drm_module_params_open();
> >> +            if (dir >=3D 0) {
> >> +                    current_log_level =3D igt_drm_debug_level_get(dir=
);
> >> +                    close(dir);
> >> +
> >> +                    if (current_log_level > 10)
> >> +                            igt_drm_debug_level_update(10);
> >
> > Isn't the DRM debug mask a bitmask?
> > https://elixir.bootlin.com/linux/v6.13.1/source/include/drm/drm_print.
> > h#L97
> >
> > So setting 10 isn't guaranteed to reduce verbosity, depending on how
> > the DRM driver uses the various drm_* debug prints.
>=20
> Ugh. Yes.
>=20
> > What is guaranteed to reduce verbosity is to unset unwanted bits.
> > Maybe that is the better approach?
> >
> > For example, instead of
> > `if (current_log_level > 10)`,
> >
> > Do
> >
> > `igt_drm_debug_level_update(current_log_level & !(DRM_UT_CORE | ...);`
>=20
> Ditto for commit a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing deb=
ug
> loglevel dynamically"). It got to v6 and nobody noticed?
>=20
> Ditto for commit 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustme=
nt of
> debug log level") adding the whole thing. It should not be referred to as=
 "level"
> because it has nothing to do with "level". It also makes no sense to prin=
t it out in
> decimal; hex makes more sense.
>=20
>=20
> BR,
> Jani.
>=20
>=20
> >
> > Thanks,
> > Leo
> >
> >> +            }
> >>      }
> >>
> >>      igt_describe("Test checks how many cursor updates we can fit betw=
een
> vblanks "
> >
>=20
> --
> Jani Nikula, Intel
