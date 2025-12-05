Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2436FD339AA
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 18:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE74610E267;
	Fri,  5 Dec 2025 18:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C14iDI0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B146D10E267
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 18:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764958317; x=1796494317;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4qQuLN8pMBeK9ct7nP7EfwPwfcKbYCCvJWD4DpNOjcs=;
 b=C14iDI0m4Jyd8oV91nd+aSRLlHspg4TOc3CVItSmmfF+aB07g19cfzyl
 oQVpW3O3jwqCMQS+Kr6J2AAb+nDzyPXELxzwJQmlrGslpD+1BqTjlmFgn
 bpt8yPrRUmK2QHwT+2s8QuXln7Ulzjz4KKQ46HsbFu1NX+XKnZsV8wRCw
 wunK86TSOShAAxKjGBTMHai2pw2LJ6VE8vf83n7Ktj6T/61M0SeGitHHt
 LCS6zKfkQOckLbXJ6lewG1Gm1iMlrh2HnkkzKwEtGuCozoZL6to/QT2mT
 XBxurJ6pKVhJo4TcP9c/0Q83xzhzOisO2TYrhogsNHitSkjDTABQGR7pM w==;
X-CSE-ConnectionGUID: 0xgaCchRT0yImfILdn5sYw==
X-CSE-MsgGUID: 0xcHJlOiRqKdNhFRha5CJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67074304"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67074304"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:11:57 -0800
X-CSE-ConnectionGUID: OZe/cK2dQaOKyPqnSTZE+w==
X-CSE-MsgGUID: qrh0VdyDQemlxNbrcDr1vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="232726033"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:11:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:11:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 10:11:55 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:11:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YATQm9GzyMRiLDByG4T1Es8Akk+1fLyANRPYQAzJpnNUtpFc7dtr2SQ9NddKeoolUt3bhWhWwPq+8DncmGxSNu/g9eeQQz8dcVLb5Mv8yVNOl+pUQFpgPHF4mpSeGeH0e+RB4ExCEObHxKDfkzmCiGD6kEAeVvASW9CMaUuoREo8UfmVNWhMk2Ts7SjJECEgkmopJHYRgcSMpbtqGo445xqVVQ5flM9oIfzXcnqzB1wy40tg9dq4ZZcvZHPtE+sc/gsbrjDXvUK6scwIiZIgpIqfsT6kbGqW5XHERyt38+NHP52nKXOFC9Cq3+7piQzC7CD0ijMw4L6dN5uI2XWGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qQuLN8pMBeK9ct7nP7EfwPwfcKbYCCvJWD4DpNOjcs=;
 b=PGL7vuX0+Kr53YUOyvloin++NW7HgSsHLLJi6dg0AreA7LtfSGbdI7yj2209jb/mmmtN+4m4mdTxZjUoAuHrhPZjaUXr/B7+GCE8owHBuknJJzpamW+mff3PkvVFeaQjN5ZYpTuZeJw/ts6mfFFicW2GgUusk8YSwSiSGas11vUtKna6XrwzKSKdZFxdYH4vXSqOCLGtJURJYW/VNOL9kCgJ3KrEWIzUfbf9jGP1ks2PepPVsvkc6EvdJdP7XXfb+0vME5UH/Gfu9mabGo3cynyO2ABLV3xmugbSM5y8yJ5tParzjIvYLo2XLtsPI/nFm6P06Kmoz2odNgH+LK8qvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY8PR11MB7847.namprd11.prod.outlook.com (2603:10b6:930:7c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.12; Fri, 5 Dec 2025 18:11:52 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 18:11:52 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 09/19] lib/xe: Add exec_queue set_property ioctl support
Thread-Topic: [PATCH v2 09/19] lib/xe: Add exec_queue set_property ioctl
 support
Thread-Index: AQHcWpsH1yBmjJo4ekKApEPFXAQQ1rUR8d8AgABuNYCAAQ/3gA==
Date: Fri, 5 Dec 2025 18:11:52 +0000
Message-ID: <84ee636651169bdb3621ee34e3622839de19a7ec.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-30-niranjana.vishwanathapura@intel.com>
 <4793ae1b81f967de1425ebdcb06962e8dc9df651.camel@intel.com>
 <aTI8Q4YonVnFB100@nvishwa1-desk>
In-Reply-To: <aTI8Q4YonVnFB100@nvishwa1-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY8PR11MB7847:EE_
x-ms-office365-filtering-correlation-id: c5e9fc03-5221-4e3c-ba3b-08de3429c47d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dytPZ2pNUmZOUWsrYnhSQmg1Tk00S3pKRXRmQzR4bHRNOHpVSzEvTUdHMmNl?=
 =?utf-8?B?QWIrd0dDVnkxRVRaRkx5bXVTK3U1enJxNHh6d2FsM3VxYzRKREhaWTRNS1Qv?=
 =?utf-8?B?Um43OHU5NzV2UUFaOTNHVlBJUHhXOS9vencxMWFONENMTmRNSlFFZGd3eXBo?=
 =?utf-8?B?YStudEpLZ0sxdzkzVzV0Vm0yeGJyL0dpMlJSV1E0eHI1aWpYTFdiSjk1ZFor?=
 =?utf-8?B?c2ladXdPWTJxYzFBK01KWFVsRHBwdGhBb0lqeUczODNDR29FVkZyRmRaR3p6?=
 =?utf-8?B?RDg5WjRuOXV6L1J5d1o3UUZvRXZBZUpjT3p3andMb1I5MTMyYXMrVUQvRzhV?=
 =?utf-8?B?aU9pUkdCYnRiYjNkbVJVU1VxZlBUV0ROMlFMTmNXNlZ0QnlTc2F5ZFg5NE1Q?=
 =?utf-8?B?MFFLVHZxVmNUYUJDRlJQdUp3ZUxzQ2hGeHhiRWR3elQwdmJTRlJjR1YwbzB6?=
 =?utf-8?B?SnhOWVBxOEw5NG5zTHpMQUZtMXBTWnV6bi8vaGpSTUY2RXhKT0VRbUtGVXA0?=
 =?utf-8?B?NzNBZXlLSzNBSFEwaENub0x2M3R2WUlZeHAxZm8xWmZxVC9GQjBEM3I0VUNU?=
 =?utf-8?B?MHA2dUQ2RTU3SGFCeGhXMC9WakgwOE9qUEFxYVlEb1pTNFczU2FvbUsrdWta?=
 =?utf-8?B?MFAwN2xGaGpqY25FVlMrdjRJOG02YTFqdXZBSHJpdXBXZ0cyL1l1MDNRbWNV?=
 =?utf-8?B?MEpBVm1oNVhONldOQjV5MWxUZ2ZFVGZCSUlEWEhtcnRtNWxVREJENGt2V2pR?=
 =?utf-8?B?YXUzNWZYOWhyMGVhOVZWeE03RkhHVm5HUFhHRWFwRnhlcHVONkkrUWU2OFJz?=
 =?utf-8?B?ZnQ4enlZd25xMjBzS0VTdTk1VjV2Nmo5RGFMK1JraUZBWmFGeDBKdTdQeGFx?=
 =?utf-8?B?SlB5U0lGWUxnR0pLZm9xcWFuVGN4c0N3b3huaUFJVmt1MUs0c3Q2WEJ2OGUy?=
 =?utf-8?B?TFFTaE9FVFIrUGNiNmpubjIwcFpXNHpMMDRCOWRNMjdad05Va0JOS0dETGlh?=
 =?utf-8?B?YVZPcWZhTlRNZU5qUGF4Wm51cmZuaWRQdU9ZWnkvQVFURkVqMzRhazJVVXg5?=
 =?utf-8?B?Wmo1NTNobCtSWmZNQUFVYUMzTUt1Y0NEYm9mMHN5enRHcCtzSlp4aFZNTkxB?=
 =?utf-8?B?d0VnUzlwUmtCNThxMWM0ZUJEUkd6c3RMZGw5SWRwNWlwL2tNdDhCNFk5MlNp?=
 =?utf-8?B?MkMwQmE3Q0lUNzE4NDRQQUdoaS85ZHdlUG1pUG8rRjk5VEFIWGtKbnFyZG91?=
 =?utf-8?B?bTJaSUg4K2tzQ1RPREUySmFQSXZUWWx2dHBaR05najMzYmpWaWg5VUNlMzdr?=
 =?utf-8?B?dFU0ZUNpWlB6dXNMUmVxYS9wUW0wSWw4eE9XRDhvM1kwWDJvRTA5N09SUGNw?=
 =?utf-8?B?Z0t0TXJtRHJkVGtvRmw0SHM1Q2VJV3FiNnE1MW9McTRvMlA1NXo2aklzMWpq?=
 =?utf-8?B?NEtveGN1VU5aYks4RGxsMmNuYTRaeXdxV3VZNmNPcS9pMTFoTG1vanY1Q3ZI?=
 =?utf-8?B?dERxWDFNTDBaNy96SmlObWxiMHpVb3U1WU5MeTJPSlVJVGJnd1dmM2lhVEM5?=
 =?utf-8?B?UkJCNGNUblFJWk1nRTE4T0FzTUN5UWxlK0tXYUV6WFFFRFBEZkhHL2dTeVVr?=
 =?utf-8?B?TWdHUTB5QitXWUFCT3dKUWczMjJ5WUdJL1lOc1k2RzcrVmx3dmtQZDFyNGhq?=
 =?utf-8?B?RmNEd0VRU2srRlU3VDMraEtMTUUwc2pyOUY2QTFGNS85d0J3Z3BOcTNZQXB4?=
 =?utf-8?B?VXZYS2VHc1BtaThyV2xFTlZWWHphbEtKRmYzQks3Y1FaaE9OUGJuSFFHTFgv?=
 =?utf-8?B?NDNNbVQ5QXNDYlRqUGhndDhNb21aTDFXSWFIL3QvdmFnZ0NqbVZERVpYUmIw?=
 =?utf-8?B?TFZuVjM0Vmd4NThKY0VLa2hPK24zUE11azB4Y1cwd1RGM0t6NjNOZWxvMWxZ?=
 =?utf-8?B?ZndudjJ3b0ROWVBRd3NRV3pycUoxVlNwN1E1TkUvbnhqeWpncWc2QVQ1NnNa?=
 =?utf-8?B?L1lPWWFEWXFOU2FRcWU3QVRkTElRQ2Rka0tHTWlvSGFDd210ZmlHWmVlNzVG?=
 =?utf-8?Q?eXvg6X?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzZpa0xKQUd1RUNCQXVRUWdqRHlObnM1cjlDbDR3cmtYemVrRURYTVpLUWVK?=
 =?utf-8?B?K1dGRXo2V1lVd1Bubk5COEw3K3c5MENIRU13cm0wOHlobkFxUUNQN3Zvc1Vt?=
 =?utf-8?B?ZnI5SVlzcjlvbnI4STZweHRTdHdSQnlBdFhIS3picitLL2RWSUxBMjFpU2gx?=
 =?utf-8?B?UkdvVHdRNjI2dmNZdUtsSUdZMklnTG12d1crVTVEU3R1T1RZaUF6OVp1c004?=
 =?utf-8?B?djA0TnB6bjFvYU15RXlpMnYvV3h1Mm9IY1h3UlE5VEhES2ptZ0N1UUlVQ3c5?=
 =?utf-8?B?RHJvMm9QZWNIOHJaQXRlU0NYR0NwMTlhdG1iQTVjL0E5c3FjMUdCV2hja3Rp?=
 =?utf-8?B?UWRMd29VQlBCb29MQUE3K25saDBSa1dkWnVVRzNUN0lIeHZNY2Nwb3RpMzY3?=
 =?utf-8?B?dUpqTTUrNHMxMFZkSG5oWjR5SXQ2UStoUzUyYlo2RitVOWY0aVBSb3pqY3V1?=
 =?utf-8?B?S0hPVlJvN0o0NHJReERwUWdwYVF3endjdHRZTFYveTJ3bjB5VndTaFBTOWsw?=
 =?utf-8?B?aEczdUlxYWttRk1hdlVlTnhjKzRKSnp2TXQ0d0I1ZnNkVzJCMUdOckE1dFUx?=
 =?utf-8?B?R1FEZFpVQmQySERMdjFDcjV3WlYzRlc3RHZnVExFNjVuSmwvYXUvbGVNK2NW?=
 =?utf-8?B?ckpnRTBqT00xaEJqc1U5WVRiM05BYXVBZExiamorTFJMTzNySzczY3Q4VDZj?=
 =?utf-8?B?RTYrOVNFQjNNNGJhRU1rVWFTZlB6a1FHd1BNVHVsUjRLdjd1L25FTitOTXBF?=
 =?utf-8?B?ZlA4c0czUmtsWmJHWnBLdHhVNW45c2NlSDQ4NEdvN01EMVg2aWQ5aWVST3po?=
 =?utf-8?B?S1VtQmRTK1VHS0pXbENteVkvSkVORGREdEErMFVYUkYzd1R2VDd5K1BzMGY5?=
 =?utf-8?B?akJyb00wNE5yWVdZSkVWcVROSkpUeTJxSS9tSXYwL2RPWVdyMy9Fb0ZrYUtM?=
 =?utf-8?B?SU5hQzZ5V0FFaW9acnRUY1h0MzVHdWJBNlV2Sm9ENGVKQWEwZ2ZWS1JOQWU2?=
 =?utf-8?B?T3pjYVlRa3J2eURrcTNsUmVHY3ZWNE5tT2lZS0swQWtQZEZoNmdZUi8zWTJJ?=
 =?utf-8?B?MGxHck5tUkd1VFVqU2F6UFhlcHBMV3VBbDBCSm5hRng5ejh1elIreDBDSUw2?=
 =?utf-8?B?c1Zra0lmRi92NjZQZ1Uvc0Jqblpqdjl1QnlPWFRXV0ZUNmowYjBWc3NJR2hS?=
 =?utf-8?B?MmFVN1FmSWxQbnVtY0pwNEdKZUhmS1dLY09PTiswdW9pV2FNdGNIT2RxYkww?=
 =?utf-8?B?cGZYQjhZeDFIaGh0VS9kSHl4ZU9Xb3JqeTFqZmo2RVlWSkVjYUpFTGFKUVVC?=
 =?utf-8?B?cjFjN0pVSXhqWndEUklRRE1ldHBjbGdTWkJmZWk1OG11QXBRNXBrM2RlYmxG?=
 =?utf-8?B?UDRVVkUxU3NTWVgvU2g3QzRHdm9sQUdZd1o4cmZYODg2SXNQNDVUTk1BME9O?=
 =?utf-8?B?QWh4R2tWZy84YzJSQ2VQNGF6VXNvREQrNGFYdnM5QU9ZNmpqMTA0ZnpJQzdS?=
 =?utf-8?B?MkZJR1R3RnNBMk9HVEc2R2Y2NUs2aFg3NHVabGJOYnpwaTBPdEkvc2tmUnUx?=
 =?utf-8?B?RTdibkdYdHU0Z1lOdEkwTTFNZk1mRTJKTjhCb3JQL3dqbmNFN0pPZ3ZQUEpt?=
 =?utf-8?B?RWpvVkRXYUVwQnRNK09hQmZYVGpvVmtISHJ5V1A3bFhyOHVpMXFSbXBDK1RK?=
 =?utf-8?B?V2wzMU96aExvMEFvSGExb3VURmE3aDJPM2hwTTV5MUQrOTVzUWZVN1ExcDJM?=
 =?utf-8?B?OVgzWFMrb2QxK0NqSWFBQXhFOUN2YzRnMWlPUzJ5Q3dlc1NnR09QSE1ia1ZQ?=
 =?utf-8?B?Qm1leWNpUStIcGV0RDZkSVgxM2ZyVmxobWRYQWs5bmMzMFZHdGpVaUdRbHhL?=
 =?utf-8?B?VkRyK2ZETjZIYmRWSGY0TFFDS252TmxMU2luQjNTWUhHdUJWeWRKcWVNZjdy?=
 =?utf-8?B?UmFzekFmSHdIZFhIOVFmUndzRHB0UDJXL1RjdjRpTkNLQ3lCdkt1TlVGeTZC?=
 =?utf-8?B?cjFoZUxQQlJBSjliSWlpQUpqSWt2QW9aeDFFQXNMM2pKcVRsY3NvYlJGQWdO?=
 =?utf-8?B?eEFwTGRLN2ZRS3A1eW1wZVFsUmRPM0pOakx3ZFJuRDh4YjNFMklYOWdPbTB1?=
 =?utf-8?B?STlhbUpQMVJrazJzT3pQSytTWS8wV281cnFubXFON1VNVmkwSUFHTzdodjU1?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E32C40EA1F787498E9BB15DDF90FD84@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e9fc03-5221-4e3c-ba3b-08de3429c47d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 18:11:52.7894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hs24dKNPAKSptvF38TILFZYwy2KTqXvhZwUrDI1hCMhG/FPLFNcQcFC0sySu2ry5Q3gBx5Hn6EJ3MJsFS5dlcv50SHe9EorYmfzjqRs3wnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7847
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

T24gVGh1LCAyMDI1LTEyLTA0IGF0IDE3OjU4IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IE9uIFRodSwgRGVjIDA0LCAyMDI1IGF0IDExOjI0OjAxQU0gLTA4MDAsIFN1
bW1lcnMsIFN0dWFydCB3cm90ZToKPiA+IE9uIFRodSwgMjAyNS0xMS0yMCBhdCAxOTo1NyAtMDgw
MCwgTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSB3cm90ZToKPiA+ID4gQWRkIGluZnJhc3RydWN0
dXJlIHRvIHN1cHBvcnQgeGVfZXhlY19xdWV1ZV9zZXRfcHJvcGVydHlfaW9jdGwoKQo+ID4gPiAK
PiA+ID4gU2lnbmVkLW9mZi1ieTogUGFsbGF2aSBNaXNocmEgPHBhbGxhdmkubWlzaHJhQGludGVs
LmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYQo+ID4g
PiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiDC
oGxpYi94ZS94ZV9pb2N0bC5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+
IMKgbGliL3hlL3hlX2lvY3RsLmggfMKgIDQgKysrKwo+ID4gPiDCoDIgZmlsZXMgY2hhbmdlZCwg
MzEgaW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9pb2N0
bC5jIGIvbGliL3hlL3hlX2lvY3RsLmMKPiA+ID4gaW5kZXggMzljNDY2N2ExLi4zMTk4NTNkYTAg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2xpYi94ZS94ZV9pb2N0bC5jCj4gPiA+ICsrKyBiL2xpYi94ZS94
ZV9pb2N0bC5jCj4gPiA+IEBAIC01MDMsNiArNTAzLDMzIEBAIHVpbnQzMl90IHhlX2V4ZWNfcXVl
dWVfY3JlYXRlX2NsYXNzKGludCBmZCwKPiA+ID4gdWludDMyX3Qgdm0sIHVpbnQxNl90IGNsYXNz
KQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGNyZWF0ZS5leGVjX3F1ZXVlX2lkOwo+ID4g
PiDCoH0KPiA+ID4gwqAKPiA+ID4gK2ludCBfX3hlX2V4ZWNfcXVldWVfc2V0X3Byb3BlcnR5KGlu
dCBmZCwgdWludDMyX3QgZXhlY19xdWV1ZSwKPiA+ID4gdWludDMyX3QgcHJvcGVydHksCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1aW50NjRfdCB2YWx1ZSkKPiA+ID4gK3sKPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IGRybV94ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0eSB4ZV9wcmlvcml0eSA9IHsKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5wcm9wZXJ0eSA9IHByb3BlcnR5LAo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmV4ZWNfcXVldWVfaWQgPSBleGVjX3F1
ZXVlLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnZhbHVlwqAgPSB2YWx1
ZSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgfTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgaW50IGVycjsK
PiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqBlcnIgPSBpZ3RfaW9jdGwoZmQsIERSTV9JT0NU
TF9YRV9FWEVDX1FVRVVFX1NFVF9QUk9QRVJUWSwKPiA+ID4gJnhlX3ByaW9yaXR5KTsKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKGVycikgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZXJyID0gLWVycm5vOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWd0X2Fzc3VtZShlcnIpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJy
bm8gPSAwOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVy
biAwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICt2b2lkIHhlX2V4ZWNfcXVldWVfc2V0X3Byb3Bl
cnR5KGludCBmZCwgdWludDMyX3QgZXhlY19xdWV1ZSwKPiA+ID4gdWludDMyX3QgcHJvcGVydHks
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHVpbnQ2NF90IHZhbHVlKQo+ID4gPiArewo+ID4gPiArwqDCoMKgwqDCoMKg
wqBpZ3RfYXNzZXJ0X2VxKF9feGVfZXhlY19xdWV1ZV9zZXRfcHJvcGVydHkoZmQsCj4gPiA+IGV4
ZWNfcXVldWUsCj4gPiA+IHByb3BlcnR5LCB2YWx1ZSksIDApOwo+ID4gPiArfQo+ID4gPiArCj4g
PiA+IMKgdm9pZCB4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koaW50IGZkLCB1aW50MzJfdCBleGVjX3F1
ZXVlKQo+ID4gPiDCoHsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1feGVfZXhlY19x
dWV1ZV9kZXN0cm95IGRlc3Ryb3kgPSB7Cj4gPiA+IGRpZmYgLS1naXQgYS9saWIveGUveGVfaW9j
dGwuaCBiL2xpYi94ZS94ZV9pb2N0bC5oCj4gPiA+IGluZGV4IGFlOGEyM2E1NC4uYTdmZDQzYzll
IDEwMDY0NAo+ID4gPiAtLS0gYS9saWIveGUveGVfaW9jdGwuaAo+ID4gPiArKysgYi9saWIveGUv
eGVfaW9jdGwuaAo+ID4gPiBAQCAtODMsNiArODMsMTAgQEAgdWludDMyX3QgeGVfZXhlY19xdWV1
ZV9jcmVhdGUoaW50IGZkLCB1aW50MzJfdAo+ID4gPiB2bSwKPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3QgZXh0KTsKPiA+ID4g
wqB1aW50MzJfdCB4ZV9iaW5kX2V4ZWNfcXVldWVfY3JlYXRlKGludCBmZCwgdWludDMyX3Qgdm0s
IHVpbnQ2NF90Cj4gPiA+IGV4dCk7Cj4gPiA+IMKgdWludDMyX3QgeGVfZXhlY19xdWV1ZV9jcmVh
dGVfY2xhc3MoaW50IGZkLCB1aW50MzJfdCB2bSwKPiA+ID4gdWludDE2X3QKPiA+ID4gY2xhc3Mp
Owo+ID4gPiAraW50IF9feGVfZXhlY19xdWV1ZV9zZXRfcHJvcGVydHkoaW50IGZkLCB1aW50MzJf
dCBleGVjX3F1ZXVlLAo+ID4gPiB1aW50MzJfdCBwcm9wZXJ0eSwKPiA+IAo+ID4gSSBtaWdodCBo
YXZlIG1pc3NlZCBpdCwgYnV0IHdoeSBhcmUgd2UgZXhwb3NpbmcgdGhpcyBvbmU/IEkgZG9uJ3QK
PiA+IHNlZQo+ID4gdGhhdCB3ZSB1c2UgdGhlIGludGVybmFsIGZ1bmN0aW9uIGFueXdoZXJlLCBq
dXN0IHRoZSB3cmFwcGVyIGJlbG93Cj4gPiB0aGF0Cj4gPiBoYXMgdGhlIGFzc2VydC4KPiA+IAo+
IAo+IFRoZXNlIGFyZSBsaWJyYXJ5IHJvdXRpbmVzIGFuZCBpdCBsb29rcyBjdXN0b21hcnkgdG8g
YWRkCj4gYm90aCBvZiB0aGVzZSBmdW5jdGlvbnMgKG9uZSB0aGF0IGFzc2VydHMgYW5kIG9uZSB0
aGF0IGRvZXNuJ3QpCj4gaW4gdGhlIGxpYnJhcnkgaXJyZXNwZWN0aXZlIG9mIHRlc3RzIHVzZSBp
dCBvciBub3QgY3VycmVudGx5Lgo+IEFuZCB0aGlzIHBhdGNoIGlzIGZvciB0aGUgbGlicmFyeSB1
cGRhdGUgb25seS4KCk9rIG5vIHByb2JsZW0uIExldCdzIGp1c3Qgc3RpY2sgdG8gdGhlIGNvbnZl
bnRpb24uCgpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVs
LmNvbT4KCj4gCj4gTmlyYW5qYW5hCj4gCj4gPiBUaGFua3MsCj4gPiBTdHVhcnQKPiA+IAo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdWludDY0X3QgdmFsdWUpOwo+ID4gPiArdm9pZCB4ZV9leGVjX3F1ZXVlX3NldF9w
cm9wZXJ0eShpbnQgZmQsIHVpbnQzMl90IGV4ZWNfcXVldWUsCj4gPiA+IHVpbnQzMl90IHByb3Bl
cnR5LAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB1aW50NjRfdCB2YWx1ZSk7Cj4gPiA+IMKgdm9pZCB4ZV9leGVjX3F1
ZXVlX2Rlc3Ryb3koaW50IGZkLCB1aW50MzJfdCBleGVjX3F1ZXVlKTsKPiA+ID4gwqB1aW50NjRf
dCB4ZV9ib19tbWFwX29mZnNldChpbnQgZmQsIHVpbnQzMl90IGJvKTsKPiA+ID4gwqB2b2lkICp4
ZV9ib19tYXAoaW50IGZkLCB1aW50MzJfdCBibywgc2l6ZV90IHNpemUpOwo+ID4gCgo=
