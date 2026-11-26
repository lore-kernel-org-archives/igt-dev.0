Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CCA606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T/EYJdsn;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=B2p8Lefa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1412810E9E0;
	Thu, 26 Nov 2026 13:46:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D2610E306
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 13:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795700734; x=1827236734;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=5FF/Pz7eK0hIiMq6ndHT6EAxowM5KZTE/J9Vj9GAYyo=;
 b=T/EYJdsn2nfwLQF/iP620y75aCWTs6uFV9OxuJBiEv8tBxibEzSPzC6z
 Yr/sy8dpbb2kGSeAG1gZCzWy0+/rEeyku0+6aNbDxgocKEg7BhjS5rpWr
 QMP1PO+BMGYkVr3vjm6R1Pj0iadTThKxwahhHmddXDMikrWr+rZgVqQvf
 1Qs0qt29X3vSHIx+FFKaol6jDYSULle+dbmlilmmH1ctjCrOCYJ+yFNJ1
 RCfzkxSNB3rpMJ+gFWtTihKXzsAYXLnHSBXmrdrZFITkO/9uK7b47m7RX
 QUcimLGOfs1J4cG1hN5TawnY0mH3/6HUp6IHcrNim3LI5GDfuiKPHeuVK w==;
X-CSE-ConnectionGUID: tc0drtoeQpKYb+XqXKBOTQ==
X-CSE-MsgGUID: 0u4Z5Ce6SyOdIX4XFpnaOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4629371"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4629371"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:45:34 -0800
X-CSE-ConnectionGUID: Ftj04ZulRoO2Rks3dEAfqQ==
X-CSE-MsgGUID: 9pVmIPYmRPuzN0RhAgr29w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12180949"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:45:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:45:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 05:45:33 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:45:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLAHdAt+wvlIBfFeKGit2TmnJySEfgd9CKgKNxr/Dv4SNnW0Jn2rNKDDgyQJHehG2r9n12TaeD09udaon5uY+TI1VGWdzd/V917g4JRgre/4irP47zrgfRALtuNIIk8WWRPTVr9FJFbBB0sRH5HwadMtkY+uC8Ffal7PEEll0HWYOiZHbEXsOc+tnmueYUVWzzpU1mrRi33ZQnjMDQoHX5Kt7SFgE4IP4cG+pWicO75SenVUTCc98QI1B029VNGbmaRDghaEGnd14da4ikmx9aezzZyzwuI3xPFzBz4Vy4uZ5El8iQLc0Yl/9jMYvT9t9qcvYuXycFJ5jHWBCKK+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5cZUQbYRjuSriReW+hk7yf2aZn123fz85YOVmPhlE0=;
 b=dlVNgVHiPC2EKlrXpw1JCmhXi6B6E1zjx54a+kbuk/BS7emUg8wcfuUSknLizYnEG20+xC2046ePKC3cpvb+rH1+I6RMpCZzPPwDHN4Rus9ayMxmV9r6sXQiM2NAhiv3xQzdbQRnjCBrv4vA8t8dohrM7ziJF5r5S4iM/qBjGRIjHKgS8vKc4oWiHk83NVFFMjP/d78qs8ACoEoDeBFRKeQu3sNQsru6q+3C2YWwHD93GPzE3p8CA1PtfzhdE70UTJr10HaWuk+aBLQ0FBjgZT1EbarYukgMxvmrnGU+IuuhNBYne9L0s4yjhUY/4RLH/LSQk0ih+HsTYd1WM5oDZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5cZUQbYRjuSriReW+hk7yf2aZn123fz85YOVmPhlE0=;
 b=B2p8Lefa5VX11LYN/6ZTG+ZD6lbVPesFWRZWZ51lglor8rb9MqVEypjQSsfTtux0fmyIZi1JoPHOKJ8fGnRGkOnvajQqFOjsyWkcYXrhxKlWnhWMbtrAkPm8wH8hAt9XF4AEej2N+Abogj/cD9Kj9KkX8IKRDQirfoDnAanzbdA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:45:30 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:45:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 14:45:24 +0100
Message-Id: <DN56S4GLP6GS.1SCLSVJK44OY5@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t 2/9] tools/drm_ras: Add a DRM RAS netlink tool
From: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
X-Mailer: aerc 0.22.0
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
 <20261124213532.3674338-11-rodrigo.vivi@intel.com>
 <xq56jebalb3klsplxs4vswsoorh4ccqyceb73ihdwxwe34nh5k@uvqnne6aiduc>
In-Reply-To: <xq56jebalb3klsplxs4vswsoorh4ccqyceb73ihdwxwe34nh5k@uvqnne6aiduc>
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|DS0PR11MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be8a124-3851-4d4c-099b-08df4bc38939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006|261026121527099003|261021121427099003|261022113327099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: NxdQuldy7xGcGjT7u6dj5mC9UoRJ43KCkcylPA5cViWXWzWf9YKDAPXymfaxmINKKBfjCgs7MxfLm5JZzSlqKQ7Bv4H/kBGkTywQOjZaORebc8H4GZp6ZnKvXfkiAyE/LYd0NbKDftbGqSJevmeOgSExeZBd7hha7jcmCQWpsTP9D5eulyxIShQ1N9GBaC9tEsiQG4rHCnv31cWGX9Xljevm6mfUcDyWe8Qpcu/br7eKZebbPWr+8JQmrQ4Ab/uhamcwR/mM6VpSWWJOw91gLLxfiKPCNGQ3t/nmxQK+cp+H8K5WTJPoqW+8XhXvOl7pDYf343aFimcb9dhLe0MFXkbco2k7YYmxVIs8cC0xV3D7S8fw6+3jlxUcrBmF3IwYLDmqx2VBICvkodkt1IXDIGJjbE0rWjUesj+S56X2l/geF9GU4sCkQ4+qXr3Yg6iXbPeQTeliQIeZ/2xUDdcNfywKSFAaQaYY9ddpVM56S+h87K6Usm2wRjcOtAbT/tVPLGU5RDb1vpPz5Akkrz4EhLRzaVR35tao8F7S/3O+JBdUFGlaJ3qksa4eMl/+Nm6r/S32WHDfsv3y2qwGLx06I7vh9VZS/9H4EN5lSRXY7Bo380QsYXVkse3G+xmxwPt8TfwCubY2niisILQXsB4K2UpQhogI3t0iCowlQ55nc4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261021121427099003)(261022113327099003)(261102123227099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnFWUHBCM000aEFLRWI4Q1dSMHNaVVNLdUxhMWFjV0ZUdzkxNEd1cG1oVlA4?=
 =?utf-8?B?QmZZdUhPV3Z5TFgvaUxqVDdRU1cveTBaYnlkaDc5TEVJY29JVERna0FJaTZ4?=
 =?utf-8?B?MXViaDErQlo4VXRQWG0rM3BUbDFidzRFeFF0UDNpOFd6UjFOdVJKSm1JNzND?=
 =?utf-8?B?aFFENW1LRWxtTjVNWmdlb05Gamp2Q2RxNUFMVE5hSnNReUdNVWFmTWxpWkV3?=
 =?utf-8?B?YVZ3UjlHemZxOS8wdTZtWVZ4OU0rNVZQaCtjTGhEMVgvMnFoZ3VRSm83TmxR?=
 =?utf-8?B?OWUrWTJKK01YZitFZnBDclBSM1pwdnRjeWpCZG1ybytuZHNkdVB0R1FpMWo0?=
 =?utf-8?B?c0FhRXdTWDc1enY5MTJ0Mkk1WmUxOXhZYytnbXZudnVQSzFneXlMbllQdnZs?=
 =?utf-8?B?d2c1azJxbmtDQVRCcW9ibTFOTis0TVRud2J4c1FjQ0VCVk5kbHFUaDNtek40?=
 =?utf-8?B?UTZwMXR2WitlOVcwTVFENER1TUE3dEVwTE4yYmk5dHJpaXNRZG81cW1JZ2tx?=
 =?utf-8?B?TzRwT2hPSkpaVUtTUW5CZ1NzRHM0eDQxaDVuTGZPT1orRzFrL0IrbTloWGVK?=
 =?utf-8?B?Wm9PdEMxNS82M0p1UUVxS3FPSTdXTTMreFUwcU9iMXlVdDdUQmFOMTQ1MHNq?=
 =?utf-8?B?eEJwUFFVVXVJckdvSlZvU1VheGhpenZJbUw3OFNpUlhzUDRiL0MydER6Qlpi?=
 =?utf-8?B?c1FHYUFLYUxKbkZEakpEVzl0aWtGNHNNYnBUWTd4WldMSmxTbytJZkQ3ODVN?=
 =?utf-8?B?VTZXUTVrc2lhU1BJZDk2MVZnYkJWc1gxTXBHMmpDSE9QWWhCdmJuVVl6bjBS?=
 =?utf-8?B?V2hlK1BzWHdLRXpJV3ZKZEdGMFdWVk9GQlJSVVVGMEdEalg0L3BBV0FzMHZT?=
 =?utf-8?B?SjVROGQvZStwZkV3ZUl2b0FXSUNnc1hFc3ROODlmbEJTSFlHQ2pLUVFMRWMz?=
 =?utf-8?B?bTFPVU40ZnQ4dFkzYlRDbFVKVDZYOXg2RDRtSVppY05sNCtTbzlpVExFUC9l?=
 =?utf-8?B?U3U1UUJrQXN1SlJsSkhybnpXVW9vTDNuRDRDd2ZhYjlIRmJCMlhPSDQrZ3dp?=
 =?utf-8?B?OGJJZGhGSU12ellGMGhtT1lBVXRNUGtlUjZVSlpUSTQrSHc5MW9KVTNyc1JR?=
 =?utf-8?B?R1Q2Mzh3UHJuZU9lQi9MQ0hINnhIZUVveE1qY0t3WFRjdzI1WW5VU1hQSzd5?=
 =?utf-8?B?eXduRnJHK2didGptYklEV1ZmdFBBZEFZRHlUcUVJSFRTcjBXYlFtRnJ4dTlr?=
 =?utf-8?B?NTZTS2JWNVFyWkEwa01pTjRJQ1AvTytxVTB4Z05WQ2F3aEp4NVd6ZWs3T0dV?=
 =?utf-8?B?SkhOaitEUzU4bWRlNU1SK0EzdE4xbHVtNEloS0FhblRjeWJSQTVFOEUzamI2?=
 =?utf-8?B?T2NCUitiWUtHQWNUYm9oTEdWQnFaK1B2OERaNEN4eW1JQ1ArVmZ1MkFpVjNO?=
 =?utf-8?B?RFBEMTF6cmVOd0hUajNKUXd6anlkNjNOSXdDdy9mU0xya2lyR3E2YlFmSjIz?=
 =?utf-8?B?VGNoQ2F6a3BPL3ppN3F2L0R3N1graFVlYzYwT2hSNFlzNUlVb1FuL0hYL3Ns?=
 =?utf-8?B?S2tHU1ljYUNJN3BJTm1kNis2cHBUQUduYVRUQVpuT2g5VWxrTlUxZm1jM0Jn?=
 =?utf-8?B?UURFMndZWkVaLzR0Yjh3QzlObkVQSFZ3VDZlNXhkQm1yU0JjQm13NEwrQXV4?=
 =?utf-8?B?OTRyUTgwNXpjVlNTZm92UmRVRGlZOFlZbWdVRWo5bEtuTkliL2VJRnJhbDh6?=
 =?utf-8?B?bExsamQ4bXJnazYwcUorYXV6NWJ1SlVRbnJVelNRZkp5SWhQMW9xUUtrQjVM?=
 =?utf-8?B?OUh2RFArWDBrWGIzRTlsWGJHRmN3S21iZVFzaWg1VTRRcURLZWRPVGNtZzc1?=
 =?utf-8?B?cDRVUkpzakxGWWlmOXNxOFRUSnM1Q1RpWnZKbUFkOHhNcG9BRW5MNU9JWnRz?=
 =?utf-8?B?aVBQK3VGZXd4Yjh4NVF6WCttZW5mZVN1Q2wyOVh4eFNvOTE2a1F0bGhDVTNU?=
 =?utf-8?B?ZUh2QkE3RklTVzljL1pDaFc3LzB4d2I5Y2Q1VEl1L3EvWDhNdkdlNFFEUldJ?=
 =?utf-8?B?Z2owMUpSKzZRU2UvNVdKT0czTU50RHJtc0pXL0dqdVNvQjNqcjE3MDFKR3A2?=
 =?utf-8?B?dW4yYXk2VFlsK1l6b2U4eTY2NUxEL3JaZEpRdFRXNjZYR1V1ZTJjU1dDT2FZ?=
 =?utf-8?B?SVplUkhHVlNFOVhjbXVpWUhOakRQWlVlays1dFhoZHBIZnY2ZTFNRTlZVWFa?=
 =?utf-8?B?anBCaFR0RDZlOGpIUGlIeFc2NmdWNnFxWXJ5eEx1eVhQVk9TcDNBUG9GWTBS?=
 =?utf-8?B?bjZ5SlZUUEhiUDdsSWNjekM2N3JRSzdncEVNQitEdjNBSmdkenMza2FGVFFH?=
 =?utf-8?Q?atiey5c9EejjCSAk=3D?=
X-Exchange-RoutingPolicyChecked: EMYhO06Hf1T3lBHn3LGEVaiAtFMvQyIlUw9aZsTCad8ajbSG2a6ek9IAHILDZh004QZzs0fy/nbX8sgh/N6Q6xYIselnkOMU/flIiidl1e8tFapTwWR25RX1vA1Qhs3e33Uh763ivIwWTa5j01srPOWHqeudQLqf4pUjoxAdc4SAB6GS83iBdK0HmsQtWJX5bxQpQOpyPImD8oP6XZ6JLxuWbBIW2xaKMjs2YE7Sv5H2Q8qsd7uLK2D743Yy/lF4WYtRcSR1JA481+VI/cNpUMezEVfbVu2yoLeAHwV5YlcpMLnvR5xXpFHzwwXY5X7fcNgAtcooyHxEFMh2WVGgFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be8a124-3851-4d4c-099b-08df4bc38939
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:45:30.3634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJhY52qkqhbjiZh3362LZRvraoB2xuAmzt1Pjqu3DbW70UlApeiqBnBNFM3rmKnUhlRalQgWfiZVKA+VDCHFd8erVawacN63WAT3wVsbgoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kamil, Rodrigo,

On Thu Nov 26, 2026 at 2:20 PM CET, Kamil Konieczny wrote:
> Hi Rodrigo,
> On 2026-11-24 at 16:35:33 -0500, Rodrigo Vivi wrote:
>> List the drm-ras nodes, and show the error counters of a given node:
>>=20
>>   # drm_ras
>>   0	0000:03:00.0	correctable-errors	error-counter
>>   1	0000:03:00.0	uncorrectable-errors	error-counter
>>   # drm_ras -n 0
>>   1	core-compute	0
>>   2	soc-internal	0
>>=20
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  tools/drm_ras.c   | 106 ++++++++++++++++++++++++++++++++++++++++++++++
>>  tools/meson.build |   7 +++
>>  2 files changed, 113 insertions(+)
>>  create mode 100644 tools/drm_ras.c
>>=20
>> diff --git a/tools/drm_ras.c b/tools/drm_ras.c
>> new file mode 100644
>> index 000000000..0af1ca919
>> --- /dev/null
>> +++ b/tools/drm_ras.c
>> @@ -0,0 +1,106 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright =C2=A9 2026 Intel Corporation
>> + */
>> +
>> +#include <errno.h>
>> +#include <getopt.h>
>
> Add
> #include <stdbool.h>
>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +
>> +#include "drmtest.h"
>
> Can it be dropped in favor of tools stubs?
> Looks like macro ARRAY_SIZE should be moved to some non-test header.
>
> +cc Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>
Agreed on all points.

For now a local ARRAY_SIZE definition is the better option, so drmtest.h
can go. I'll find a proper shared place for ARRAY_SIZE and clean it
up later.

--=20
Best regards,
Sebastian

