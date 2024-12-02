Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED78D78321
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 15:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B976C10E79B;
	Mon,  2 Dec 2024 15:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjI3jrwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB4110E79B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 15:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733152408; x=1764688408;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1G9UOE/C4bf9u0U0/veqw6BelFHsKM0cjRrlcxRj0v4=;
 b=WjI3jrwk6Or44mfmfp9yMpfan5QImfh7/Wm4fk65ZFyDoBGPnVLjUvMD
 9j0RPJviGlrjvNyqJSnHUtFniUoockzwsMK0Qs/aCHloTDhxt7sCTQEeM
 x25nQ11FvZakSc9PHbLXUYywXtgQWvDTO/cxJYGrDgLzE2xyiGwM8gbM6
 eJruh9nJjUgnYDsn2JR3vsmlzLHrXxkmOYpmrkrlrw3ANM0oefa/R7qpY
 jDgDFjhlLnSkzW5EWemo1pe4jmG7J3IgSKBMyxLrx+G73UrRVrSdFya2N
 tXqwUJaF+HjOF42KZVIaqy2bImjpoD9nEV3z5Z38H38S3C3KznurJ32/U A==;
X-CSE-ConnectionGUID: U8BHKuLcQuCDJG6zn+ig9w==
X-CSE-MsgGUID: xqGZx+FLRwC5iBjSRxPESw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44703639"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="44703639"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 07:13:27 -0800
X-CSE-ConnectionGUID: qb5lpMq4StubFKZCtPG6nA==
X-CSE-MsgGUID: XuQMsuO3TgGCCC1gmZKYQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="97903854"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 07:13:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 07:13:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 07:13:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 07:13:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swKOEK7CfVLabpMbQXH4AvqIAN0uf3aL8lRmtpMn8dOlgORXGKTu7wiuwT6MmkGM2R/K6li9Ge7DOaKj2UKb6kMpd9uEdwDrBmExc9Vh3c1eGelNyYIMpBsZPpOGxiXqqyEUCrf6pzH2Mz+/iDvySiS0g0/PkIwvdzHvc+zItap9PEbda0/EcDWxW0HHtcIsn/LFSCBIk7fTQtvz9/mZ+SKdr2M0t0oZZvdMcZCMLIx1HDKpK1jAs+IKiv2dzT2tKqFIRAo8rG6PQcjzdygbrVCmUveJhQK8CQNVmnhf57JrGZrezEvl4EZCC1LI+MXRXnsb3bkO8GZnjfSCQ0fL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1G9UOE/C4bf9u0U0/veqw6BelFHsKM0cjRrlcxRj0v4=;
 b=wL0Wc7YkxVuP6iAxVdM/KW+nt247f6+4/AI2ffWOjA+gnihJiTH2TbpSXWY7NR3Ce2ajz7xAelEVjDjUntVMkRQpFY4z1xx/uW7jJ5PWmSf8MGBx3Ye0jvKu5Wv0A0FUX5u/6Qfv7G5HTwPXptJPHb/u4AB8/h6taIwBOioZA6gHUzDG1N5C3Yg153GKypHVVBzZDWf2VAZzQvGH9aeNk4Y7IY/J1+nemxD2PQflPc5F/fC2GsW4G2aVh7kQ5OehCYqPH/RCsQfrzKWlsOxwaDBBjIps8kNHk9BGJXrOAYC3a4eCJKuDLHT7LYkAfjXyHTZVk90I9MnfNH3jBhj/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CYYPR11MB8306.namprd11.prod.outlook.com (2603:10b6:930:c6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 15:13:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 15:13:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v7 2/4] tests/intel/xe_sysfs*: Restore values on test
 failure
Thread-Topic: [PATCH v7 2/4] tests/intel/xe_sysfs*: Restore values on test
 failure
Thread-Index: AQHbOeR6Th176jSIRE26JNW+baNmyLLJ1ESAgAlRFhA=
Date: Mon, 2 Dec 2024 15:13:21 +0000
Message-ID: <CH0PR11MB544449BB2479DAF3CC0D0CB0E5352@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241118180511.64212-1-jonathan.cavitt@intel.com>
 <20241118180511.64212-3-jonathan.cavitt@intel.com>
 <20241126165541.5kpurie66hge4cox@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241126165541.5kpurie66hge4cox@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CYYPR11MB8306:EE_
x-ms-office365-filtering-correlation-id: f8f08037-caf3-4b52-0bc2-08dd12e3dc0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ejhyTmdoVUluLzg1TTNKbjE3QzY0cjUyU3MwQ0NNc3kydngyaytmTXBQajJy?=
 =?utf-8?B?L3cvRnJaMFg0NnZaeWV5VkJkUmdSUEFDbEh3cTNMUXp2RWF4a1JGZmErTDhx?=
 =?utf-8?B?ZVh6ckdRMGxrV1p5c24ybEdLRDkySDBFT09ZNHhrbWl2amMrNDN5aHVPUGNl?=
 =?utf-8?B?QkwwemRwVEJZK0xwMnlwb0dSSTd5ZC9lZVJiSTFLLzcxSXhkcWthYkhYZlFj?=
 =?utf-8?B?a3cwcXZ5dHpKV3lod3FaRU54K0xuSlVhamxST1p1N3NXTkV5cXo1Zzc4Qjh0?=
 =?utf-8?B?dkJSRG5LeVpJS3lJd3hEeGk5Y1NiczJiRmFyMklZazV3VEtqRG1WM2F3b1FV?=
 =?utf-8?B?SW1ldGdlZ0xMdEZEVWxPWGMvRkp1RnJjcytxK0g4Q0ROM01PU1hUUE9ZWFlG?=
 =?utf-8?B?NGZaUWtkTlBCMlVBbFAzSDdpTzkwOGQ1aStJV0pJL2VmeVkzeDRjT0Yrc0dj?=
 =?utf-8?B?TkhvdU9FRSs5N2NuV3owRExyaVgyMVMzOVJXR1pQWC9xV2l5Mkk1NWExMnV6?=
 =?utf-8?B?ME1sdm1FZkQ3eWtGNDNEbDlhZ0lsZjBrSXR2TUx6VEY5Wk95NFNVcktLNjIv?=
 =?utf-8?B?T1VKNDZpRzZFeEpuL1VBejhJa2hyaEhOYTdselBXNlJpKzJZNnMrTkRXNEVq?=
 =?utf-8?B?WktCQnJpa25EL0NFZkZZN2VIMktuczQ0d2JBNjlNcGxweW5raWF3YjFDK1BY?=
 =?utf-8?B?anhmTStzSGd6L2piVE9LdXpoQ0lFZi9KbnlYbzlaTFhib1c0MUZsWjAwZFRN?=
 =?utf-8?B?ZTVKck5MR1JEVnlUaXVwbWxJb0l4YVRKVy9GS2N4RmVuL1ZKcjByM09lT2Uw?=
 =?utf-8?B?M2xKaWZSZWY5WFpYa1BCbkdUL0tSQ05RbjkrbVlnaVB1amtHMHpySkYzY3lP?=
 =?utf-8?B?cXdMR0pURzEwRFdXVDNiNjlVZ1dLRmZBS0NGTnBNOE5PUHdBRWRmU0Y0N3Fy?=
 =?utf-8?B?aXpYTlp2SjhoMU1BWVY0aXhZdm94RVRlOEZ1VDJUeDBCQ3lUcXpwZXhMM1E1?=
 =?utf-8?B?SG1VNHg1VVV5czJDa1BsSGpDUEQ4bXZjUHVIamdMR2JoNVA5RnhkUWlYVURG?=
 =?utf-8?B?YWs0VVREVFhLcjJLWnJ6d1EwaXVIS0N4YlZ1NUNUOFdRaFdSSWNYc1lMRjdC?=
 =?utf-8?B?ZDF4STZFbi9hYWZHR2pMTmR3eENhbnFZbTl0UlN1M01yait4RDkwNy9GS25n?=
 =?utf-8?B?WUtjWjY0VzVTREt1bWFidmtNZ3BuRjAwVWFNaWpOektpeElxZ2hxMVkwNXRM?=
 =?utf-8?B?R3ZqQjJkTmk2TEkvRzVFTGhucjNIMWtXbWtkeC9VUitwbjF2M2Fzb1lUREFE?=
 =?utf-8?B?Umw2cGR5VDJIcXJiOXNiYzlDZ1VnM2Y4R0RyOTZ6Z0tUeVNieDEralNoaldk?=
 =?utf-8?B?ZUZqdnJnRUJKNS9YRUt4MjRxVnVpaDFLOUlvNGVpNHVqcGowVmtweWRWUU1C?=
 =?utf-8?B?UmVRSTRBamc5ZHRTUmRBVEMwdzRaUld3ZjZIZGV4OWRqaUxrQnBVSlFkNG9B?=
 =?utf-8?B?R1psWGQyNStrVFlNZS94NG9ETTFlMFBYdm1BcEpVMDZzWXV4TGtQL2MxK0s3?=
 =?utf-8?B?b2dacWZZaTVzbDhCcU9aaWwzZkFmSDA4UEVwS0RuWDlCUUx6cGhXTWh2VUVC?=
 =?utf-8?B?VDRqb05nemJZc3g0eTBKY25McElIWWI3elBFdzJTTjlUZnlOT3pHYmNlaGJF?=
 =?utf-8?B?VFRxRitsNFhmZEljbmF6ZFJLd1JoY2lwckpFTWg3NVJ3c0NpVVFTOHJ5MkRj?=
 =?utf-8?B?eTlOWlhWSlB5VC9ML2ZCN2QrU24zaHRZTXZaYngyQndKWjNjTFN0U3BEMGxk?=
 =?utf-8?B?dXN5T2RRRDdlc1JEK0Z3R2xWSFI3b1VTUzRQb2U5L0FSdWxjdTdtSEFUNVpz?=
 =?utf-8?B?eDVvS1hCOGlHY2czMW02c3B0QS9wNm9qemJKNm5uVlVlS3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXZ5MndIRFdOVUF0WE9Vcmp6UDViczVWazcxTkh2UHlTT3d4UG84dG1iNDRH?=
 =?utf-8?B?TlllVXBoaGkxUXNCWmhQRDZSL2JjMXhoeEFqcU5LMEtvK1hndXZBb01rUWVK?=
 =?utf-8?B?amhmZlNoRXo4QndBekhRSzNZUTJISVVEU2R6eWhTbEZ4NCs5L2JjNnk3Rjds?=
 =?utf-8?B?ZWRyOWJ3RGxOSnpZT0pDTkEyRENWV095dENJQlE3WkkvV0Q1bkt0WkJPTHNs?=
 =?utf-8?B?YlFRNCtGdkdwVUVPTkoySUJPNk5MbTR4V09rTUJZYkIxTkFGbytBSDJSdVgz?=
 =?utf-8?B?WWxXUURpaE5OOFhQRU0yL2gxRHRrMzJ1NWY4NEdCREV3ZnhpUDVSaThWYzVG?=
 =?utf-8?B?SzNpVnlEMGtZYmJNWVZveHo4aW5oWDl3ZzFFWjdPM093ME1oQUpMR1U0TkJG?=
 =?utf-8?B?MVFoL0d6ejVMRnp2RGl6N2o1MDd1blZlem91cjgyYmZhMUd2TXNkQS9CNDFQ?=
 =?utf-8?B?VmNlZG9xSUU5dFNmM2gwc2h6aDFweDViWmNpc1JNK2NGc010MGQ3TnRyQWlE?=
 =?utf-8?B?UFZ4UXlYa3didmhWMWE5NVNjdnB5czZOdHpsY1JiZzB1andrMDhLS1FQWHFT?=
 =?utf-8?B?cXk5WWlLbDBZV3Q4Q0RiVW01UWRSSHc5cENwYUFDY2xCTzdDS1BlWEFhZFpP?=
 =?utf-8?B?dmhVRkJHNTdLNFRlTHBXSVZTVEpOb1dZeGhEU0lWM0xjYmx1RTUzOUQ2eVo1?=
 =?utf-8?B?c3FaZm55eStIdzB0dEgvdFM5NFZRQ3doa0M1SkZ0WXFHUFgvTVF1NFFVaCs1?=
 =?utf-8?B?WU9Cak5rSTdiYUpJSndHVzNNenA2VWRubUd4NmJrbzkxZlJSRTBSMmhPQnFi?=
 =?utf-8?B?cEVBR1hzL2NaaTduVEFiZ3Myd0xuNkl3M3p6aDlZQy8wd0NsWkwvSFN4SmJ6?=
 =?utf-8?B?b0x3aE4yUUlsc2V0UlJvcnJIbGRXWFc3Y3BpMVVrMWI2eUVFQnpvQi9oQ1Br?=
 =?utf-8?B?U1hwdVBxVmtrNzUwQU1neGZ2VUpaWEozOTk5SG0zSDZoMFpZUkNlVEJvQmdo?=
 =?utf-8?B?V0gzZ2c2NmxnS1pqaU5QRHYyTFFvK2s1M1FsdlQ3b1FQd3hRQjA3V2RFMDN2?=
 =?utf-8?B?blJOYk9rMlJIa1lUVmFvZ3pKS1UrSStobzQ1OFJIeEFpOEdoeWpETVVCbzNR?=
 =?utf-8?B?dllrMXJkZnpyOWlJZjI3MjZUdUJteThVYkxCNUYrYk1ObThEaXFIeFZUUzhs?=
 =?utf-8?B?WktRWG9yUnRlcjV4amdtc1F1c2owQ3ZsTUxBZ1dqRldaQkZ1V3F2OUxiT3du?=
 =?utf-8?B?ZC9PeVVxd0JDdnMzMHRmcGlEaHYrTGViS0p4TmdCNmxtdHdKVmlXeUtZYVBm?=
 =?utf-8?B?QkFxWWRZL1JFQkUvY1E5R1R5RjQvU0FySWU0MjQvVU1wYU1saU5zaFAzQ1pS?=
 =?utf-8?B?WllyekVxTG9pQTZYeEsxdktNRkorbHplUUVnL3dwanZkb0Y1NUxSbTRhYktt?=
 =?utf-8?B?eGdIRzVGS3ZBYm10T0xmQnJMREJZUkdUaUcvQmdOUU9EUmZzWVdadTdjaEwr?=
 =?utf-8?B?VmpUeDlTaGVJanora2NvME13cVFvZVVUanlpQVludzFycXJNSlFlWFBDUWk1?=
 =?utf-8?B?RXpha2V1Wm8vRnI0b28wL0hNb1hFVDNHQ3NDbU9xNlJFV01naTRwTkc4eHlB?=
 =?utf-8?B?OEcrYnVlYTRxWHJYa2w1TjdnenNOSEtxNzArMG1DbDl1d2FUSlhNTDd5dGty?=
 =?utf-8?B?OGs2cDg4VkVDczJxek5PSGdJcUZPSEtqOGg5dzFydGVKUG5HSDQ5VHAzYXk2?=
 =?utf-8?B?aGl5SEh5ZUJvQ09veVZQOTBKblZidG1YZXZRYXdUTFd6UW5FOGFGQ0VpWEJF?=
 =?utf-8?B?OXR0cXNtckpqSUlvS1c5bGIvSGtLaFlIMit4NVVibnpUR1FOSnFEM2xwVUQ4?=
 =?utf-8?B?R1d4RmpoZHRudGgvWEhGdytPYzE3TUhIaDd4UHh5Q0U2TjFEOHNTK3ZPTmRU?=
 =?utf-8?B?Q0RPSUtmaC8rMHQzbjd2TmZYa2JGTUF5WkMvWVpaVm1vOXNpZkZBYzBDelcx?=
 =?utf-8?B?YXI5Z1ovU3Mvb09ibHl3SEhwelBZa3ZSYytaTmg4c05FdEZ1Mmw5NjdYMkRp?=
 =?utf-8?B?UTRwZmhLeHVVd2xRQlRuL3RKNGNNTnRjT2xtaFhGTm1BYThGL1l0dFVmaSs1?=
 =?utf-8?Q?OAnXI/fyDUTi52X84Kz2L1dCM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f08037-caf3-4b52-0bc2-08dd12e3dc0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 15:13:21.4966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDxr7pgU3KmYU6olup5t5s3aSoZR1ZATJfImoxAolGv0ppeht3kBo2vvSU0eF8KeuQfWMzaH0i3Qjy5dRjGfmcObw+UGgR9KEQS+Nm1ZMD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8306
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAyNiwg
MjAyNCA4OjU2IEFNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBDYXZp
dHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgR3VwdGEsIHNhdXJhYmhn
IDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNv
bT47IEJlbGdhdW1rYXIsIFZpbmF5IDx2aW5heS5iZWxnYXVta2FyQGludGVsLmNvbT4NClN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjcgMi80XSB0ZXN0cy9pbnRlbC94ZV9zeXNmcyo6IFJlc3RvcmUgdmFs
dWVzIG9uIHRlc3QgZmFpbHVyZQ0KPiANCj4gSGkgSm9uYXRoYW4sDQo+IE9uIDIwMjQtMTEtMTgg
YXQgMTg6MDU6MDkgKzAwMDAsIEpvbmF0aGFuIENhdml0dCB3cm90ZToNCj4gPiBUaGUgdGVzdHMg
eGVfc3lzZnNfcHJlZW1wdF90aW1lb3V0IGFuZCB4ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb24N
Cj4gPiBtb2RpZnkgdGhlIHZhbHVlcyBvZiBwcmVlbXB0X3RpbWVvdXRfdXMgYW5kIHRpbWVzbGlj
ZV9kdXJhdGlvbl91cywNCj4gPiByZXNwZWN0aXZlbHkuICBIb3dldmVyLCBvbiBhIHRlc3QgZmFp
bHVyZSwgaXQgaXMgcG9zc2libGUgdGhhdCB0aGVzZQ0KPiA+IHZhbHVlcyBtYXkgcmVtYWluIGlu
IHRoZWlyIG1vZGlmaWVkIHN0YXRlcywgcmVzdWx0aW5nIGluIHRoZSB2YWx1ZXMNCj4gPiBiZWlu
ZyB1c2VkIGluIGZ1dHVyZSB0ZXN0cyBhbmQgY2F1c2luZyB1bmV4cGVjdGVkIGJlaGF2aW9yLg0K
PiA+IA0KPiA+IFNhdmUgdGhlIHJlc3BlY3RpdmUgbW9kaWZpZWQgdmFsdWVzIGJlZm9yZSBzdGFy
dGluZyB0aGUgdGVzdCBhbmQgYXR0ZW1wdA0KPiA+IHRvIHJlc3RvcmUgdGhlIHZhbHVlcyBvbiB0
ZXN0IGV4aXQuDQo+ID4gDQo+ID4gdjI6DQo+ID4gLSBGaXggc29tZSBmb3JtYXR0aW5nIGlzc3Vl
cyAoS2FtaWwpDQo+ID4gLSBBYm9ydCBpZiB2YWx1ZSByZXN0b3JlIGZhaWxzIChLYW1pbCkNCj4g
PiAtIERpcmVjdGx5IGNhbGwgaWd0X3N5c2ZzX3ByaW50ZiBvbiBleGl0IHRvIGF2b2lkIGR1cGxp
Y2F0aW5nIG9uIGhlbHBlcg0KPiA+ICAgKEthbWlsKQ0KPiA+IA0KPiA+IHYzOg0KPiA+IC0gRG8g
bm90IGNvbXBhcmUgcG90ZW50aWFsbHkgdW5hc3NpZ25lZCB2YXJpYWJsZSAoS2FtaWwpDQo+ID4g
LSBXaGl0ZXNwYWNlIGFuZCBjb21taXQgbmFtZSBmaXhlcyAoS2FtaWwpDQo+ID4gDQo+ID4gdjQ6
DQo+ID4gLSBGaXggaWd0X3N5c2ZzX3NjYW5mL3ByaW50ZiB1c2FnZSBpbiB0ZXN0cyAoS2FtaWwp
DQo+ID4gDQo+ID4gU3VnZ2VzdGVkLWJ5OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pu
eUBsaW51eC5pbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxq
b25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+IENDOiBWaW5heSBCZWxnYXVta2FyIDx2aW5h
eS5iZWxnYXVta2FyQGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9p
bnRlbC94ZV9zeXNmc19wcmVlbXB0X3RpbWVvdXQuYyAgICB8IDU4ICsrKysrKysrKysrKysrKysr
KystLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbi5jIHwg
NTcgKysrKysrKysrKysrKysrKysrLS0tLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDk2IGluc2Vy
dGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9p
bnRlbC94ZV9zeXNmc19wcmVlbXB0X3RpbWVvdXQuYyBiL3Rlc3RzL2ludGVsL3hlX3N5c2ZzX3By
ZWVtcHRfdGltZW91dC5jDQo+ID4gaW5kZXggN2ZhMGRmY2RmNy4uODQxYzA0YjIxNSAxMDA2NDQN
Cj4gPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9zeXNmc19wcmVlbXB0X3RpbWVvdXQuYw0KPiA+ICsr
KyBiL3Rlc3RzL2ludGVsL3hlX3N5c2ZzX3ByZWVtcHRfdGltZW91dC5jDQo+ID4gQEAgLTE3MCw2
ICsxNzAsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X3RpbWVvdXQoaW50IGZkLCBpbnQgZW5naW5lLCBj
b25zdCBjaGFyICoqcHJvcGVydHksIHVpbnQxNl90IGNsYQ0KPiA+ICAJc2V0X3ByZWVtcHRfdGlt
ZW91dChlbmdpbmUsIHNhdmVkKTsNCj4gPiAgfQ0KPiA+ICANCj4gPiArI2RlZmluZQlNQVhfR1RT
CTgNCj4gPiAgaWd0X21haW4NCj4gPiAgew0KPiA+ICAJc3RhdGljIGNvbnN0IHN0cnVjdCB7DQo+
ID4gQEAgLTE4Myw4ICsxODQsMTAgQEAgaWd0X21haW4NCj4gPiAgCQkJCSAgICAgICAicHJlZW1w
dF90aW1lb3V0X21pbiIsDQo+ID4gIAkJCQkgICAgICAgInByZWVtcHRfdGltZW91dF9tYXgifSwg
fTsNCj4gPiAgCWludCBjb3VudCA9IHNpemVvZihwcm9wZXJ0eSkgLyBzaXplb2YocHJvcGVydHlb
MF0pOw0KPiA+ICsJaW50IGd0X2NvdW50ID0gMDsNCj4gPiAgCWludCBmZCA9IC0xLCBzeXNfZmQs
IGd0Ow0KPiA+IC0JaW50IGVuZ2luZXNfZmQgPSAtMSwgZ3RfZmQgPSAtMTsNCj4gPiArCWludCBl
bmdpbmVzX2ZkW01BWF9HVFNdLCBndF9mZFtNQVhfR1RTXTsNCj4gPiArCXVuc2lnbmVkIGludCBw
dHNbTUFYX0dUU11bWEVfTUFYX0VOR0lORV9JTlNUQU5DRV07DQo+ID4gIA0KPiA+ICAJaWd0X2Zp
eHR1cmUgew0KPiA+ICAJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ID4gQEAg
LTE5MiwyNiArMTk1LDYxIEBAIGlndF9tYWluDQo+ID4gIAkJc3lzX2ZkID0gaWd0X3N5c2ZzX29w
ZW4oZmQpOw0KPiA+ICAJCWlndF9yZXF1aXJlKHN5c19mZCAhPSAtMSk7DQo+ID4gIAkJY2xvc2Uo
c3lzX2ZkKTsNCj4gPiArDQo+ID4gKwkJeGVfZm9yX2VhY2hfZ3QoZmQsIGd0KSB7DQo+ID4gKwkJ
CWludCAqbGlzdCwgc2l6ZTsNCj4gPiArCQkJaWd0X3JlcXVpcmUoZ3RfY291bnQgPCBNQVhfR1RT
KTsNCj4gPiArDQo+ID4gKwkJCWd0X2ZkW2d0X2NvdW50XSA9IHhlX3N5c2ZzX2d0X29wZW4oZmQs
IGd0KTsNCj4gPiArCQkJaWd0X3JlcXVpcmUoZ3RfZmRbZ3RfY291bnRdICE9IC0xKTsNCj4gPiAr
CQkJZW5naW5lc19mZFtndF9jb3VudF0gPSBvcGVuYXQoZ3RfZmRbZ3RfY291bnRdLCAiZW5naW5l
cyIsIE9fUkRPTkxZKTsNCj4gPiArCQkJaWd0X3JlcXVpcmUoZW5naW5lc19mZFtndF9jb3VudF0g
IT0gLTEpOw0KPiA+ICsNCj4gPiArCQkJbGlzdCA9IGlndF9zeXNmc19nZXRfZW5naW5lX2xpc3Qo
ZW5naW5lc19mZFtndF9jb3VudF0sICZzaXplKTsNCj4gPiArCQkJaWd0X3JlcXVpcmUoc2l6ZSA+
IDApOw0KPiA+ICsNCj4gPiArCQkJZm9yIChpbnQgaSA9IDA7IGkgPCBzaXplOyBpKyspDQo+ID4g
KwkJCQlpZ3RfcmVxdWlyZShpZ3Rfc3lzZnNfc2NhbmYobGlzdFtpXSwgInByZWVtcHRfdGltZW91
dF91cyIsICIldSIsDQo+ID4gKwkJCQkJCQkgICAgJnB0c1tndF9jb3VudF1baV0pID09IDEpOw0K
PiA+ICsNCj4gPiArCQkJaWd0X3N5c2ZzX2ZyZWVfZW5naW5lX2xpc3QobGlzdCwgc2l6ZSk7DQo+
ID4gKwkJCWd0X2NvdW50Kys7DQo+ID4gKwkJfQ0KPiA+ICAJfQ0KPiA+ICANCj4gPiAgCWZvciAo
aW50IGkgPSAwOyBpIDwgY291bnQ7IGkrKykgew0KPiA+ICAJCWZvciAodHlwZW9mKCp0ZXN0cykg
KnQgPSB0ZXN0czsgdC0+bmFtZTsgdCsrKSB7DQo+ID4gIAkJCWlndF9zdWJ0ZXN0X3dpdGhfZHlu
YW1pY19mKCIlcy0lcyIsIHByb3BlcnR5W2ldWzBdLCB0LT5uYW1lKSB7DQo+ID4gKwkJCQlpbnQg
aiA9IDA7DQo+ID4gIAkJCQl4ZV9mb3JfZWFjaF9ndChmZCwgZ3QpIHsNCj4gPiAtCQkJCQlndF9m
ZCA9IHhlX3N5c2ZzX2d0X29wZW4oZmQsIGd0KTsNCj4gPiAtCQkJCQlpZ3RfcmVxdWlyZShndF9m
ZCAhPSAtMSk7DQo+ID4gLQkJCQkJZW5naW5lc19mZCA9IG9wZW5hdChndF9mZCwgImVuZ2luZXMi
LCBPX1JET05MWSk7DQo+ID4gLQkJCQkJaWd0X3JlcXVpcmUoZW5naW5lc19mZCAhPSAtMSk7DQo+
ID4gLQ0KPiA+IC0JCQkJCWlndF9zeXNmc19lbmdpbmVzKGZkLCBlbmdpbmVzX2ZkLCBndCwgMSwg
cHJvcGVydHlbaV0sDQo+ID4gLQkJCQkJCQkJCSAgdC0+Zm4pOw0KPiA+IC0JCQkJCWNsb3NlKGVu
Z2luZXNfZmQpOw0KPiA+IC0JCQkJCWNsb3NlKGd0X2ZkKTsNCj4gPiArCQkJCQlpbnQgZSA9IGVu
Z2luZXNfZmRbal07DQo+ID4gKw0KPiA+ICsJCQkJCWlndF9zeXNmc19lbmdpbmVzKGZkLCBlLCBn
dCwgMSwgcHJvcGVydHlbaV0sIHQtPmZuKTsNCj4gPiArCQkJCQlqKys7DQo+ID4gIAkJCQl9DQo+
ID4gIAkJCX0NCj4gPiAgCQl9DQo+ID4gIAl9DQo+ID4gIAlpZ3RfZml4dHVyZSB7DQo+ID4gKwkJ
Zm9yIChpbnQgaSA9IGd0X2NvdW50IC0gMTsgaSA+PSAwOyBpLS0pIHsNCj4gPiArCQkJaW50ICps
aXN0LCBzaXplOw0KPiA+ICsJCQlsaXN0ID0gaWd0X3N5c2ZzX2dldF9lbmdpbmVfbGlzdChlbmdp
bmVzX2ZkW2ldLCAmc2l6ZSk7DQo+ID4gKw0KPiA+ICsJCQlmb3IgKGludCBqID0gc2l6ZSAtIDE7
IGogPj0gMDsgai0tKSB7DQo+ID4gKwkJCQl1bnNpZ25lZCBpbnQgc3RvcmUgPSBVSU5UX01BWDsN
Cj4gPiArDQo+ID4gKwkJCQlpZ3RfYXNzZXJ0X2x0ZSgwLCBpZ3Rfc3lzZnNfcHJpbnRmKGxpc3Rb
al0sICJwcmVlbXB0X3RpbWVvdXRfdXMiLA0KPiANCj4gVGhpcyBzaG91bGQgYmUgYWJvcnQuDQoN
ClRoaXMgYWJvcnRzIGxhdGVyIGlmIHRoZSB3cml0ZSBmYWlscywgdGhvdWdoLiAgVW5sZXNzIGln
dF9hc3NlcnQgZW5kcyB0aGUgZml4dHVyZSBlYXJseT8NCg0KTWF5YmUgd2Ugc2hvdWxkbid0IGJl
IGFzc2VydGluZyBhbnl0aGluZyBhdCBhbGwgaGVyZT8NCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiAN
Cj4gPiArCQkJCQkJCQkgICAiJXUiLCBwdHNbaV1bal0pKTsNCj4gPiArCQkJCWlndF9zeXNmc19z
Y2FuZihsaXN0W2pdLCAicHJlZW1wdF90aW1lb3V0X3VzIiwgIiV1IiwgJnN0b3JlKTsNCj4gPiAr
CQkJCWlndF9hYm9ydF9vbl9mKHN0b3JlICE9IHB0c1tpXVtqXSwNCj4gPiArCQkJCQkgICAgICAg
InByZWVtcHRfdGltZW91dF91cyBub3QgcmVzdG9yZWQhXG4iKTsNCj4gPiArCQkJfQ0KPiA+ICsN
Cj4gPiArCQkJaWd0X3N5c2ZzX2ZyZWVfZW5naW5lX2xpc3QobGlzdCwgc2l6ZSk7DQo+ID4gKwkJ
CWNsb3NlKGVuZ2luZXNfZmRbaV0pOw0KPiA+ICsJCQljbG9zZShndF9mZFtpXSk7DQo+ID4gKwkJ
fQ0KPiA+ICsNCj4gPiAgCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gPiAgCX0NCj4gPiAgfQ0K
PiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb24u
YyBiL3Rlc3RzL2ludGVsL3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbi5jDQo+ID4gaW5kZXgg
Y2Y5NWEzYWMxYy4uMjJjNTQzNjkyYyAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9z
eXNmc190aW1lc2xpY2VfZHVyYXRpb24uYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3N5c2Zz
X3RpbWVzbGljZV9kdXJhdGlvbi5jDQo+ID4gQEAgLTE0Miw2ICsxNDIsNyBAQCBzdGF0aWMgdm9p
ZCB0ZXN0X3RpbWVvdXQoaW50IGZkLCBpbnQgZW5naW5lLCBjb25zdCBjaGFyICoqcHJvcGVydHks
IHVpbnQxNl90IGNsYQ0KPiA+ICAJc2V0X3RpbWVzbGljZV9kdXJhdGlvbihlbmdpbmUsIHNhdmVk
KTsNCj4gPiAgfQ0KPiA+ICANCj4gPiArI2RlZmluZQlNQVhfR1RTCTgNCj4gPiAgaWd0X21haW4N
Cj4gPiAgew0KPiA+ICAJc3RhdGljIGNvbnN0IHN0cnVjdCB7DQo+ID4gQEAgLTE1NSw4ICsxNTYs
MTAgQEAgaWd0X21haW4NCj4gPiAgCQkJCSAgICAgICAidGltZXNsaWNlX2R1cmF0aW9uX21pbiIs
DQo+ID4gIAkJCQkgICAgICAgInRpbWVzbGljZV9kdXJhdGlvbl9tYXgifSwgfTsNCj4gPiAgCWlu
dCBjb3VudCA9IHNpemVvZihwcm9wZXJ0eSkgLyBzaXplb2YocHJvcGVydHlbMF0pOw0KPiA+ICsJ
aW50IGd0X2NvdW50ID0gMDsNCj4gPiAgCWludCBmZCA9IC0xLCBzeXNfZmQsIGd0Ow0KPiA+IC0J
aW50IGVuZ2luZXNfZmQgPSAtMSwgZ3RfZmQgPSAtMTsNCj4gPiArCWludCBlbmdpbmVzX2ZkW01B
WF9HVFNdLCBndF9mZFtNQVhfR1RTXTsNCj4gPiArCXVuc2lnbmVkIGludCB0ZHNbTUFYX0dUU11b
WEVfTUFYX0VOR0lORV9JTlNUQU5DRV07DQo+ID4gIA0KPiA+ICAJaWd0X2ZpeHR1cmUgew0KPiA+
ICAJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ID4gQEAgLTE2NCwyNSArMTY3
LDYxIEBAIGlndF9tYWluDQo+ID4gIAkJc3lzX2ZkID0gaWd0X3N5c2ZzX29wZW4oZmQpOw0KPiA+
ICAJCWlndF9yZXF1aXJlKHN5c19mZCAhPSAtMSk7DQo+ID4gIAkJY2xvc2Uoc3lzX2ZkKTsNCj4g
PiArDQo+ID4gKwkJeGVfZm9yX2VhY2hfZ3QoZmQsIGd0KSB7DQo+ID4gKwkJCWludCAqbGlzdCwg
c2l6ZTsNCj4gPiArCQkJaWd0X3JlcXVpcmUoZ3RfY291bnQgPCBNQVhfR1RTKTsNCj4gPiArDQo+
ID4gKwkJCWd0X2ZkW2d0X2NvdW50XSA9IHhlX3N5c2ZzX2d0X29wZW4oZmQsIGd0KTsNCj4gPiAr
CQkJaWd0X3JlcXVpcmUoZ3RfZmRbZ3RfY291bnRdICE9IC0xKTsNCj4gPiArCQkJZW5naW5lc19m
ZFtndF9jb3VudF0gPSBvcGVuYXQoZ3RfZmRbZ3RfY291bnRdLCAiZW5naW5lcyIsIE9fUkRPTkxZ
KTsNCj4gPiArCQkJaWd0X3JlcXVpcmUoZW5naW5lc19mZFtndF9jb3VudF0gIT0gLTEpOw0KPiA+
ICsNCj4gPiArCQkJbGlzdCA9IGlndF9zeXNmc19nZXRfZW5naW5lX2xpc3QoZW5naW5lc19mZFtn
dF9jb3VudF0sICZzaXplKTsNCj4gPiArCQkJaWd0X3JlcXVpcmUoc2l6ZSA+IDApOw0KPiA+ICsN
Cj4gPiArCQkJZm9yIChpbnQgaSA9IDA7IGkgPCBzaXplOyBpKyspDQo+ID4gKwkJCQlpZ3RfcmVx
dWlyZShpZ3Rfc3lzZnNfc2NhbmYobGlzdFtpXSwgInRpbWVzbGljZV9kdXJhdGlvbl91cyIsICIl
dSIsDQo+ID4gKwkJCQkJCQkgICAgJnRkc1tndF9jb3VudF1baV0pID09IDEpOw0KPiA+ICsNCj4g
PiArCQkJaWd0X3N5c2ZzX2ZyZWVfZW5naW5lX2xpc3QobGlzdCwgc2l6ZSk7DQo+ID4gKwkJCWd0
X2NvdW50Kys7DQo+ID4gKwkJfQ0KPiA+ICAJfQ0KPiA+ICANCj4gPiAgCWZvciAoaW50IGkgPSAw
OyBpIDwgY291bnQ7IGkrKykgew0KPiA+ICAJCWZvciAodHlwZW9mKCp0ZXN0cykgKnQgPSB0ZXN0
czsgdC0+bmFtZTsgdCsrKSB7DQo+ID4gIAkJCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pY19mKCIl
cy0lcyIsIHByb3BlcnR5W2ldWzBdLCB0LT5uYW1lKSB7DQo+ID4gKwkJCQlpbnQgaiA9IDA7DQo+
ID4gIAkJCQl4ZV9mb3JfZWFjaF9ndChmZCwgZ3QpIHsNCj4gPiAtCQkJCQlndF9mZCA9IHhlX3N5
c2ZzX2d0X29wZW4oZmQsIGd0KTsNCj4gPiAtCQkJCQlpZ3RfcmVxdWlyZShndF9mZCAhPSAtMSk7
DQo+ID4gLQkJCQkJZW5naW5lc19mZCA9IG9wZW5hdChndF9mZCwgImVuZ2luZXMiLCBPX1JET05M
WSk7DQo+ID4gLQkJCQkJaWd0X3JlcXVpcmUoZW5naW5lc19mZCAhPSAtMSk7DQo+ID4gLQkJCQkJ
aWd0X3N5c2ZzX2VuZ2luZXMoZmQsIGVuZ2luZXNfZmQsIGd0LCAxLCBwcm9wZXJ0eVtpXSwNCj4g
PiAtCQkJCQkJCQkJCSB0LT5mbik7DQo+ID4gLQkJCQkJY2xvc2UoZW5naW5lc19mZCk7DQo+ID4g
LQkJCQkJY2xvc2UoZ3RfZmQpOw0KPiA+ICsJCQkJCWludCBlID0gZW5naW5lc19mZFtqXTsNCj4g
PiArDQo+ID4gKwkJCQkJaWd0X3N5c2ZzX2VuZ2luZXMoZmQsIGUsIGd0LCAxLCBwcm9wZXJ0eVtp
XSwgdC0+Zm4pOw0KPiA+ICsJCQkJCWorKzsNCj4gPiAgCQkJCX0NCj4gPiAgCQkJfQ0KPiA+ICAJ
CX0NCj4gPiAgCX0NCj4gPiAgCWlndF9maXh0dXJlIHsNCj4gPiArCQlmb3IgKGludCBpID0gZ3Rf
Y291bnQgLSAxOyBpID49IDA7IGktLSkgew0KPiA+ICsJCQlpbnQgKmxpc3QsIHNpemU7DQo+ID4g
KwkJCWxpc3QgPSBpZ3Rfc3lzZnNfZ2V0X2VuZ2luZV9saXN0KGVuZ2luZXNfZmRbaV0sICZzaXpl
KTsNCj4gPiArDQo+ID4gKwkJCWZvciAoaW50IGogPSBzaXplIC0gMTsgaiA+PSAwOyBqLS0pIHsN
Cj4gPiArCQkJCXVuc2lnbmVkIGludCBzdG9yZSA9IFVJTlRfTUFYOw0KPiA+ICsNCj4gPiArCQkJ
CWlndF9hc3NlcnRfbHRlKDAsIGlndF9zeXNmc19wcmludGYobGlzdFtqXSwgInRpbWVzbGljZV9k
dXJhdGlvbl91cyIsDQo+IA0KPiBTYW1lIGhlcmUuDQo+IFdpdGggYWJvdmUgZml4ZWQgeW91IGNh
biBrZWVwIG15IHItYiwNCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+ICsJCQkJCQkJ
CSAgICIldSIsIHRkc1tpXVtqXSkpOw0KPiA+ICsJCQkJaWd0X3N5c2ZzX3NjYW5mKGxpc3Rbal0s
ICJ0aW1lc2xpY2VfZHVyYXRpb25fdXMiLCAiJXUiLCAmc3RvcmUpOw0KPiA+ICsJCQkJaWd0X2Fi
b3J0X29uX2Yoc3RvcmUgIT0gdGRzW2ldW2pdLA0KPiA+ICsJCQkJCSAgICAgICAidGltZXNsaWNl
X2R1cmF0aW9uX3VzIG5vdCByZXN0b3JlZCFcbiIpOw0KPiA+ICsJCQl9DQo+ID4gKw0KPiA+ICsJ
CQlpZ3Rfc3lzZnNfZnJlZV9lbmdpbmVfbGlzdChsaXN0LCBzaXplKTsNCj4gPiArCQkJY2xvc2Uo
ZW5naW5lc19mZFtpXSk7DQo+ID4gKwkJCWNsb3NlKGd0X2ZkW2ldKTsNCj4gPiArCQl9DQo+ID4g
Kw0KPiA+ICAJCWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiA+ICAJfQ0KPiA+ICB9DQo+ID4gLS0g
DQo+ID4gMi40My4wDQo+ID4gDQo+IA0K
