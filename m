Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E27606A323
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VZH8Ffbl;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AyQNWWcA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6B610FA8E;
	Wed, 25 Nov 2026 09:31:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C28E10E08B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795598991; x=1827134991;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=DsY7A4aHyIs50pfp+T+eoKAkgjYUD71SK8e8hB/sFJs=;
 b=VZH8Ffbl5ak3XiWAPkaxMDhCPYEEMd+dJetcB8v9qJnPl4x3epYz6If3
 eXcLdIQPvUMwVG7xv9VbHetKzBTL0qYDfZVw8PmabPm0y3dHGs+/rg9t2
 RJFv1Rsh+jrG4yxW1+5Pw7w/JnSGcsmLduwvHQTIl/GLCiDiAiCgnaxgX
 2IoEx25aGzBQLUt/GYST8QlYj64kLi1KeCg3+kLgfZnVMcEVQ0+skj9Q/
 l04+nIzuerNkSvi3IEP5VS8ztb4l3bni5ZydRWsS5KbM99526msFu9Ddx
 KDShxwDRBBbRccOFV3VhGaD1ay7fxWFIUZ2VfUvNVkWcFQRXne8kczvku g==;
X-CSE-ConnectionGUID: p5OlIRwwRQCjBjFfLgW1gQ==
X-CSE-MsgGUID: W/4rqkfAT7GW9ZjARU8eCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4530760"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4530760"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:29:50 -0800
X-CSE-ConnectionGUID: BSuIjGjlRLymEjaBT+nthw==
X-CSE-MsgGUID: fPHbSKulR7uInnUpbREaGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="13491431"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:29:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 01:29:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 01:29:49 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 01:29:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArD4hrEHWwlOZvHKWHOI74o6ax9uTFiyrdToF+nCJjD56P76fDHBl3tkLrqeQNRgb/Fq/6e+bQaYA5NACj/PRQlsXnuH+PhVNFVlYOb4GzDXFPYYqERk4xpilis4hvX8wY0Y89aOCPPZNzDt5fuxvZ/3omWlOuI3dtuh+ag7c7/QSBsNnPBxRfe8KHr52LmjCPY4NHIMUy1zt3VMzlLAm5z+vs7meu0hbRSoZMKFTrgbii+/ExEEANbOqt/JUAadLleJwr0LrL2LCi1kPTFYwfEqvbvPMd4Aj+vujKSZ62pvKLkP1OdAcGRGXZLObE/3AyCj6W9uecsnbPIEfDIG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsY7A4aHyIs50pfp+T+eoKAkgjYUD71SK8e8hB/sFJs=;
 b=pGSU4wcsMG/ICL3MvZTS3umbanCUQrfaYAJQiSotqO++PEec6oRdW8Tj2+b6ZS+wleCl5Pr2x30Zi/wKUnuH+WbcgnNwUmg9IlxPyK0iz6vWn+Vu0RNRH1uEVUMPylJKEcbSUzY6ldQTITz6Y2F+wvZlsPalEwT5YyghAMLtfZj+Td8sJ4M4F0slEvl4w0tcYswFblWp3hGo2blIyXi3aioag3S1KH8TxlBeo7zzDj7zGwJXhxLQVCMPwxuaoBoQZdCszC8emNTwG57RykXLfzQHigaUxBw4jjGYe1Gb4Pb5w5/R5ILo/qN7yrmORCgEE8j5usJngz4ZNxr7GpSrAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsY7A4aHyIs50pfp+T+eoKAkgjYUD71SK8e8hB/sFJs=;
 b=AyQNWWcAErr3sAVDc+ECfXpPKirh4ogmK0W/I6Lh66xeOWR/o3U8vJDmJCi9N1NEdkg/n+xZNaZBW2aydLAjSHc71tC6nN88UjUFzrWhZY9GkKvVwwxgsw+1uqglsKVgzkExk0cb0NNyXTo3m7u3VT1sWijf58uEmzUbFVXu5sc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by LY0PR11MB698854.namprd11.prod.outlook.com (2603:10b6:404:21c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 09:29:40 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 09:29:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 10:29:33 +0100
Message-Id: <DN46POMNSS8M.B5ZDH7KB6DYR@intel.com>
To: David Francis <David.Francis@amd.com>, <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Christian Konig <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v5] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
From: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.22.0
References: <20261124193506.2136315-1-David.Francis@amd.com>
In-Reply-To: <20261124193506.2136315-1-David.Francis@amd.com>
X-ClientProxiedBy: VIUP296CA0100.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:351::10) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|LY0PR11MB698854:EE_
X-MS-Office365-Filtering-Correlation-Id: 73002ea3-f40f-43fd-f8cb-08df4ad6a195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261102130727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ai8iMDXgAHVLEL20xK5AY8bE0K4wUIUHfzMVB1nFmhyKl2q/Abcd20lw8hwpdhwG1Xfq2oYDml8b200Us2mqed+qskJ3fGLjcAu4R5Ui+NFe3tdqDQWVujH8rclMLdQZ7sbNbBQiUKEZ4kVqfMa+CYbBragGC82BxKf9Jey/fN3wxl/qvZVFOw1YhvIAC851D2jDf/zXR6/+NKv5RFDSEf4gvPvULjPBPx3Xz3cZGZlH2F/uWqw5cRWwrnfSmDsDDCfTueFGCluR1dg6860uOrs+TOaDipF1ksJF/wiHZCkSdDFYDZ0o7fhfGuE6j9zRz+fmF6VY7ktFRs8p/HKHj9YykR/SSVRPthxrj1viHAELuQ0aUIFceyPtv7mUV+DGncrhswGNXVrTd4SMaZmxdmuBuY2kWYg2Vzxbl9/pVR9uAiOkkf/c+SSiJsrGEwsLK1oZc8pjTXhJ7AoG/JzYp7bxVNPb7OzBZp/F65mlcoyUOZsftgftLbfn8eqBlpLtWG3WykFIdm8na6Pnc1lVeuNkW6FeNUCzC0o435qVf98WuFR+BLEY72bHatiuYmtxkKarZ0Fjq4A77kjbpgj/Ew6Ci0FdaqdYkducGNu6jh7KeEfN6PVh+mf2uSvE4BjgSJZ8GMC+uwqEwEe3e6Bb+BhaD5+1tf4EhoKRlLxuKh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102130727099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDFBOFVlRXh1dHBVZ3Yxc091elp1ZGc2NW1zUVBDSjFKakJjRFpkWlQyaDZt?=
 =?utf-8?B?UjNGK0RNVkVtbk5xWkJsMWdDai9vNDg1azZ6RyszNWpkTUY5SnlFQkk5b2ta?=
 =?utf-8?B?TzZ2amY1Z1FwWmU3TFFuOGd5WkJoNmtjbllWbXNSSTJtWmNqOEhwYVdaRU5r?=
 =?utf-8?B?bnFhd09xMEltUVhwVTY5YVRlcEEzN2J2R05BWHUva29XV2JQblVuUFAzTzZJ?=
 =?utf-8?B?LzdXOHdlZnkxdnQyUXdLbnlRUUV6WTJsN3JyV1FHa2J3bXF0RjFVOEt1djZO?=
 =?utf-8?B?eWo3aUpHZkhLVHFnQ093T0hCNE51TzJicko4QmJKcm1mc2VuK2ZGdTVQc04x?=
 =?utf-8?B?a0k1aGpsOUg3YmN4NVBqcDF1VGQrc2xUZ1JRYW00UW1Oa0EyNmNUSnRNY2NT?=
 =?utf-8?B?SFBEVTloNldpSkoxYWFxemtPK1E4T3BGUHZaR3pCcFNKN1podHJEcU55aDFN?=
 =?utf-8?B?ekxJWE1yUTNES3g0dDdTeXlDZ1M0Y3NuVm5VMThqL2FZTzF1RFdNVWFoaUZH?=
 =?utf-8?B?MVYvLzltLzhMa2VrTW4xZkJ2bnhGa3M5aWpRSC9ZblJMUW83bENyNDJRdUdE?=
 =?utf-8?B?Y0VpazNPTlZVNU1EMGlsdmZlNU5sNDhldmxTak5WMWtqT21FNU1Fc0xxOWtU?=
 =?utf-8?B?Z0RXMUcrZzdoZzRobVhiMlAzSE9paHdOUytYY0FQRlNRNktCRUY1cDdydkNm?=
 =?utf-8?B?d3NBRmJITVQ0ZGNMZ3dLQnVMamoxbU12dmNJMFJWOFJuTTlXODM5U2Jaa1dy?=
 =?utf-8?B?bDRhdTdMc3pCQ1VYYXA1ekQvQ0RINnBFUEM3MGJxRlQ5REc4YzlGSHJXSUYr?=
 =?utf-8?B?OWo0b2JHaC91MkhLOHg4YUZKUnpBYnJ6MmkrTE9hWnlsRzZDMnBoS0hkVnhh?=
 =?utf-8?B?REsxN2psNlFmV3IrcVJCaXU0Z21scFhhZkpWYTlEOFJ1R2hxbTcvUjlNVE5K?=
 =?utf-8?B?OXl6SjJOdzRLbXJMNVAxbXB4cDdxMWlzcUVya3IwTHdpTmtqbzRDTHllbEFy?=
 =?utf-8?B?N2lXNzc5YUMzaml0aWFuS0hSbGFJaW1EZmhPWTBLU2V1UEcyVFoyOXQ1S3RC?=
 =?utf-8?B?NXJhNEVvUFk5VjN1cWpBdlEyTXY0R3kzeUZLVUxvQjd4emp0SHRmaEltcWtE?=
 =?utf-8?B?aFp1Y201a1NzYWVlU3ZMQ0w1YVRNWDlqdUdnS0Zqenl6dnZlSDNiVDhSUktV?=
 =?utf-8?B?cG9mK0RyMWY1V3cwVENraXpJMVdOODhhbnNhckhzL3pCRWJPOUlYbDAvb1g5?=
 =?utf-8?B?YTNXQ0FJdWRZZExOdldDb1VrM215cE54OEtJV2IraDVZNnRSbFMvTVJhSk4w?=
 =?utf-8?B?RHRvRUhoWHc1bDVDUDdEcnEydERtVkZ6blRONWJ4NmY0UjJ1OCtJZERGeXl1?=
 =?utf-8?B?dFBJbEhya3BGVnJYaGVEamdiNHBqOCtpTFJPb0d1NGRmb2JvS0U4OTVFS0Vr?=
 =?utf-8?B?RFUrdVluMWlNQXZTUEg2Y3dUMzBhQlA1ck96ZjJvdmNKK2JaODdwVnJsTmY1?=
 =?utf-8?B?NUtvczFDTXdKeXVrcU9YYjZkZHVnZW0yUXZHRi9oMzlJUVB2cDgvTTBxWGlr?=
 =?utf-8?B?ek05MHJnWjJHdjc1Z3pxaXQzeXhrS0JSUzAybFU4TnlvS3JPZnZaaVhUWmhL?=
 =?utf-8?B?NHdYekRVRTZWWExMUVBRNi9QeWFjeE8wWmFXZjdrNnNwVzBpUkUvbnpmM3lE?=
 =?utf-8?B?SXpkMElqSnE4azhNOVl2TCtzdDc5YktYTWpyN1ZTcjIrY0pJWVN1cVJ2YVNR?=
 =?utf-8?B?aEtXT2w5QzhIcllxRUsrdmtBZHo4RU5oZG0wUGRZRnZ6VUhnY0ZlcStsK3Ev?=
 =?utf-8?B?Yk0yNkVlZ3A5TWxURW1HR2xIVUhFdXdSNkZaQTdjdDdBK0h3aVArcitoYlBy?=
 =?utf-8?B?ZzlDU3NaM3gxcnJYa0NHQitvODBwUk5TS2QxdWJIQzhUenhQd0dudTJES0RE?=
 =?utf-8?B?cWNucThya0FJTnh3aXhBVDZ5L3JiNEpHbE9RT3BBU01vWTdBaURVaVYvczk4?=
 =?utf-8?B?K25BRWVleWZhTUZGSTdrTmgvWVc5d2VJK3B2bWZhYzJJNTFWczFBRGM0M2RL?=
 =?utf-8?B?SDdqR2xPbUF2NlMrK3JDWUtDT2o3aHRHbzVHb0NiM0JDU0FXbGZiR1d6aUcr?=
 =?utf-8?B?ZE1HWDZQaTNwQm1LZmZidW56bVYrb2tlYWh3ZUR0NkNGZ2pBaFFaQW9hSGEv?=
 =?utf-8?B?WFgydXpBODdKVHpoa3pkZlhPbHk4a0Y3NnI2Zms0WkxDb09GNkR6UlpQNWQx?=
 =?utf-8?B?K0hJZ0lNN1FIcUVlR1M1SWxSZE9zbG9xM1Fhd1VGblJmSnFLZG9oMmRVN1ha?=
 =?utf-8?B?YlhMNWpjVlp4UFRaZkZrQU96RmpsNjJ4dWF3alBKOU1kUmxRL2srbGhRRXFl?=
 =?utf-8?Q?Z4PtfFd706BaTkbU=3D?=
X-Exchange-RoutingPolicyChecked: br/ZWn6dnQaQZ0OPokKq3mri9DQWpAopODpQWQWWuec0TkDhmifELpS3puTWdyVg/DjNROFAlmFJgOvlWsV3s44Gu/ojF6pkRU/pLToCU85kJL0GhPHLGDbi1T722CvVFk5uNca8J7lc2dc5qtJMJ1H+6jlro1zxt5cc42FKDtFkxyzwj98Ke1yCQrQIRyq3jtxpvq30Hg3SKhsNw+b0WyW398ZUahgaLNEPDOFyfl60Cab8wG+U2qWq+52zr2I521Ob3f7RYx1afbkNgqg2CcRiQymQylKsR6tysRPl7rtHEDPZe+sh3xRe1WkldoZXKh4Yc9E/OWgwB5tDeAqg2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73002ea3-f40f-43fd-f8cb-08df4ad6a195
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:29:40.5065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8gYcGr14sUiUxPEpDiq58Y9w7UnOy6oelPDXKf5YdOUnl2cFhox3EDXhOVBBQYF6ZqJNyBtWxk/WShYNJCjKZ/309qcyuXtxBqhA918T+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR11MB698854
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi David,

On Tue Nov 24, 2026 at 8:35 PM CET, David Francis wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
> functionality, edge cases, and race conditions of this ioctl against
> itself, gem close, gem create, and prime import and export.
>
> GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This =
IGT
> coverage is a prerequisite for validating the eventual kernel-side ioctl
> implementation and makes fixing its security bugs safer.
>
> v2: Small cleanups, including cutting some includes and no assert in thre=
ads
> v3: Skip if ioctl disabled
> v4: hop around randomly on race tests
> v5: Add fcntl include
>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Cc: Christian Konig <christian.koenig@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: David Francis <David.Francis@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
Can you run kernel's checkpatch on this patch.

--=20
Best regards,
Sebastian

