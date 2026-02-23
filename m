Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD938EF5861
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 04:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C9310E210;
	Mon, 23 Feb 2026 04:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0gmPHVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A596710E210
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 04:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771821023; x=1803357023;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ci3W0+Hzvj1OrMTHPjut3VXfZhtkFf4M1whfMzdae1c=;
 b=L0gmPHVyS+3cxvJaPVZUAWolj/kKwLXn3EPT04mWmIi/aNEhzxGVoNxr
 TLaFk+Du3PbJhmyV29TwW6jOOXZOv5GOBg8Q5YKX0HkEyEcUHmfxiezDY
 OhPXyMAQ0aL4ew1qlgDAB7YLvEyZV4c19yc1nml8cQEr4zoNAB/P0C541
 mfE0gpv/IFOPF3/g+6s0YxmD/zCggoVjPOVcvm8958eQzTSueGQkRwdr3
 dxfWwmUcmH/fsISowzLaMf1yimZbQ9/Tr47TAf93sptWl+XBb0MX4PeCK
 uAoCKtxWLdq8fi6EBZ+m3ePWZ+MjICQ6joIboH+U5D06hx1Y/QhZxK8i+ g==;
X-CSE-ConnectionGUID: 7bUauOxJSDuNyiSSMS6jBw==
X-CSE-MsgGUID: rJj/nRDOSuCUtoB4QSvbbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90218620"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="90218620"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:30:23 -0800
X-CSE-ConnectionGUID: whyNr5dUQz+56bj59kU+EQ==
X-CSE-MsgGUID: dzTnnaHTSCiGTmTXQ0UY/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="243657086"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:30:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 20:30:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 20:30:22 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 20:30:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk9xqTiqF0JtOGOEUzDDuyWH9m9GqDDHDYkj1QpEf0n7FvN6Y0D3fYNfSHhKB7OsZTdRxRlD/YfV3VC73PfJdNFv4Dk5955oxtxY+5XuA6q/qbolCpl7gVK3QzmnU9nBdDKS9s5RA80Ww45iDrvacs5iHuRHKYH1BZdXDpEuJyUfrKD7457LcxgNUhui2OuwdnlLR2i3bTNKP4tropy+bYuZrJdX4CrLPueEDHttRKZrIfT3Cj1UrbWDt1/hjRqrQZs6jRO7Zlz/B2CO+V7V4HuUKK1Cx42Vh0cZ/SIESUpZ98G9O6KLwJ53cdX8XBcaUelBH1fNFDOoFhW0nv4G5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ci3W0+Hzvj1OrMTHPjut3VXfZhtkFf4M1whfMzdae1c=;
 b=ryM9sihBIHVOxCIY9XXLGGzYYX++hJUEm+lzC/GhYDeJRGcZW12myANXLH1Ecoe0OTO3NQlgSbMEwE8uH4V4q5C9HpxQQeJyGNk++v1mJihLcHA4CB0a44wCpL3x/3XWrto09DbJQK85mHxrWBjfzI/Zpau8D+RSTFxQYBnKlyJZ+g0UBE8E3RqD9DAfg3TH1r0gFg8ZQkplJHYnvHlTJTPwY39Z0SIBuhdkCN8QZQ3YwkYICib94THlXTdek+VwnQDRKYd7VFX1JBaleipSm02BQ1obdQGoPQX/muBwdPqLmju663Hy+3+pH2R01H3fYCTfu/53V7UpECTAdiXobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MN0PR11MB6085.namprd11.prod.outlook.com (2603:10b6:208:3cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 04:30:19 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 04:30:19 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 2/8] lib/xe: Add purgeable memory ioctl support
Thread-Topic: [PATCH i-g-t v3 2/8] lib/xe: Add purgeable memory ioctl support
Thread-Index: AQHcn7YmyrPb7H37/EinIQzwmjFMM7WPuqkA
Date: Mon, 23 Feb 2026 04:30:19 +0000
Message-ID: <BL1PR11MB5525223D3E094660213DB8A78477A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-3-arvind.yadav@intel.com>
In-Reply-To: <20260217023423.2632617-3-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MN0PR11MB6085:EE_
x-ms-office365-filtering-correlation-id: 0aa91d8b-573e-40fe-31a6-08de72944073
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?cEJwb1NZeUpjM2FtNXVIQS9YZGg1YXpVMUEyMitqc3JmUzhoVzhJeWtOL0RV?=
 =?utf-8?B?QkZjY2p2SjFjSmFTdUoyQWVyYTlTUmhXc3M2YWhMSzBOcFh4aXRNajFJK1ZV?=
 =?utf-8?B?cjBLNCsrdnFDSXJnb0NsbWg5YzExK1ArYzZWLzNTQUt3NUNuZFBDZTdlY2ZU?=
 =?utf-8?B?bTAvUlJMY01FV0hwSmV0ajNxMHpXaVhmeS9RMzUwL1c2SGV3bGFScjBzazVm?=
 =?utf-8?B?elB4WHFMNjJ5R01yN0l0TWUybHhHR3RnNzJya2toakZzek05WjlLU1d4MzJ3?=
 =?utf-8?B?eUNGbFgrTjR1MkNIWlkzMVN0dVpHMm1pV2kxNkJ3NGxDbHFRbGlHMFYwbG01?=
 =?utf-8?B?K1VCUDQwdFNsbm0xaTJMS1NTSWxjRi8zc2g5dk8ra2hUZktMbmhaY3VIaWU1?=
 =?utf-8?B?THd1cnZnNUJqdk03S3Y3bi83OXA5MzZCcjVkSmEzbDVqZ3oraUpjRHYxSm1p?=
 =?utf-8?B?cGlnNmlNZTdFNXlyYVZZZEZOMlUzTVJ2MnloRmVXNE1TanVvblc4U3dqc0l0?=
 =?utf-8?B?am1aSW9ud0syWDNKQkpGNFoyZ0JzSDRKVjFmbXpiZldTSXpoVXZ2U05NM0NT?=
 =?utf-8?B?ZFZVM0N3QUZNSU94WGo2cnZVY00yYXFFbWVzbVhESXJ0eCtBUkVsL2c1emFU?=
 =?utf-8?B?ZWhkamZiMmpEQWVTZ3lIbTF5SDU1M2szOU5CTnNlS2c0ci9WeUhEU1FMbmNE?=
 =?utf-8?B?Zi9PTTFqQUFoeWdHNUVmbU4yR040M0tvdGJ4YVZVMkVneEQ5elFQZHUybERT?=
 =?utf-8?B?WEFrN2J5UzFHSVZlRFFxQ0FTc2c2RVRWWm95QWVXTjlwQTRMZlFMeW9WSGt1?=
 =?utf-8?B?VmJrdGV2bzBLSUoySjNVWFdSUjVGZlJIZmtpOUlna2lzMHRBVitTOHkwaWdX?=
 =?utf-8?B?SENQRkQ2RVlINzBkZ2x0V0lhY2JzQlV1REMzNndUUUZkUjdEa05FNUZ5bmRI?=
 =?utf-8?B?VGY2dlpqdC9hMS9abk1MVGwwV25xYWx4SEVqNnB4MTIrZGUzclVaODhTRXdx?=
 =?utf-8?B?cEdSYTNKUGl2VmVYM1lJbDl1WmxoaWxJMFRMMzdQVUNwdTI5bzFXbkVEMFpr?=
 =?utf-8?B?VHRLUENlWDFqd2l6bFU0R2hsMnhSaXdlanpTbndhYVVOS0pNWG5jWGk0eFhZ?=
 =?utf-8?B?ODh5UXZNeEQ3YUtqbE1WUmZMeVNoRnFVS3pXVWFCQkhnaHVOYkR1bnZ5RDBO?=
 =?utf-8?B?bFFjR2tvUVFnNkx0Ykd0ZXdVU1JvbU5ZeWQxaFpYUDNnckc5S1huZTFEQlRp?=
 =?utf-8?B?UGd6RzVBcmswVU1wcnBVK09heUVNeldFNFg3V1N4OFY5bVdFY0lPYzN5RHNw?=
 =?utf-8?B?VmgrajN1U2p0aXBNbWx3ZUR2MUlQQ3BHSG9ScGY4WnYwQVVtTURZbjJPZHJz?=
 =?utf-8?B?R2JMRGt1d3p0bjdva2lINHQrd2RuZjBSUlNqMnZQTmZXbzV5MVlWNnl1TFFU?=
 =?utf-8?B?WFBaMVhqaVdxN2ltU25KS0lYRzEyQ3lwSS90UGZnTitpQTYvcUVGUkxMUnVy?=
 =?utf-8?B?ZkNOTWRZdU91cEE4L2xXaFNBQWlBbDVtMENqOWw1WDdSVUhzZFl1UFlaMkdj?=
 =?utf-8?B?b3d3L0JDL1hIbmVjQ0UvWUY2Zi9BNWgvVXBlQThxSFJjNnVva1RNNUVRTldw?=
 =?utf-8?B?R0MvTFNFU29qL1VOd1NicTZMWGMxUU1FUkxrQjFVamdDMVd1S2tha0tNa2Iv?=
 =?utf-8?B?aTl4Y3A4Z0R3RURVNysxeHloUEYrd1UwcTI2ZXZWU3FXa2VUWnRuMzRtd0FR?=
 =?utf-8?B?ckduVS9GdEdDaVMrWmxYT0x4Q2tLQjh0Rm5XSVA2ZG9VYUgzNzlPUWlEb1NW?=
 =?utf-8?B?ZmlZZ0hweENnZ0dGbEpmQTliSzFIZ1ZzSi9sNWpFa2ZkVitzdzYyV29ZLzhn?=
 =?utf-8?B?NVlFQVM3Vzd2UmFVSkw1dDhlRlZiOW53ekhnZjhROTROTW96ODZpa2YxNStC?=
 =?utf-8?B?SUpsZWgrZFVWZUFHakhXUUpCeEYvVCtvWFNReXhaZ0NXZzI5SktUQ1dBNEVP?=
 =?utf-8?B?VVJDZEQxUVhMU2R2aExiUEtqRzF1ZXQxM3hReDYyaXZqRnRlM0EvdmRVMUIv?=
 =?utf-8?B?WmRNYWJabi8ycFhmMWU5bUN6QitVSWpnUWhBaG5ZL2g3aDJaZEZkQ1pNYklD?=
 =?utf-8?B?WkxtUDlRSVZ6b0pBMHNDMXdabFo3QjM1eTJib1l0clJSZ2Z4SjBIRXRrZjZI?=
 =?utf-8?Q?23JfaGk1jETHZ94XSFYtnCg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akg4OFl0eEovaExKNHZUYzN0U0s3WExNTnpCWThVWXBqWXhjT2pkQ0VoS0FL?=
 =?utf-8?B?eitpUHZEaGRtOGZwYk54QkUycS8wakFIc1VCdkNCcXk1bzR2WmNkMk05L0Nr?=
 =?utf-8?B?ZjJ5cVRjQnJveUREeFJUQTlMejQ4L3dCRHFiNytscDdQRVNZTnpRUmFtRy9a?=
 =?utf-8?B?Y2VkZGZ2Sk8rcCtOa1B2LytkNCs3RFF0Tm0yNDZWS3lnYi8vbkRLbzNPQnZq?=
 =?utf-8?B?VVUzMzNsa3h3bHZyVlNQT1hJT2pWTTlPeDQ2WGxoUEdnMW5TOGV0NUV5Tzls?=
 =?utf-8?B?Wk5MNGZuWkM5YUgzY1U0R1ZkSHZ3STlzR2ZnYVBZa01TQUdxb0xITHhmMVlL?=
 =?utf-8?B?blFRVG45T280djNpc21pQnJINjRlbUJzSXAyZW9OTmhDZ1F2OWZya3dtQzMx?=
 =?utf-8?B?bzRTclBzb1lsZUQ5SVdHNWQ1ZXZvZW5oZkxLank0QjVnaEZnMEkxYzFYOTlm?=
 =?utf-8?B?eVNqNzU1NUhiMVpGTVdMTEVvaFVCaHh1U0xTMHllei9XTnkxU0c3QXJEUWJa?=
 =?utf-8?B?MU0vRElZQVh5eWJlTDdjYnRaamlnVFc5Sit6ZEw4UGtKdTlzTXRiQ1NVT2Zs?=
 =?utf-8?B?YUtYb0RoVDFvQUJROHp6VGp0RHRNR1hWcEhFME9Ua0JpS0JQNndDdldZWXU1?=
 =?utf-8?B?akhweGZWOHFOZDc3U0lCOFhWa3Q4N2gvdWpoZVIrWkRrQXppWkhjOGp1eTNW?=
 =?utf-8?B?RmFqSEV1NW9sdjRWZTUwRE9FemZvOUYxalhJTFdGL3k3OHkvQ1VWQ2JHM1hI?=
 =?utf-8?B?c0t3dlk2SkxvQ0diMmE5MHhGTUZPTnFOTVdJVExnNXJJcUJRamYwQlc2NmVz?=
 =?utf-8?B?WXU5UzNDS0FIWGl2dDFaUm5sZU9wemg1TGM3TzFwV1RqaGI2cFJRWmVzNG1i?=
 =?utf-8?B?ZmtPVTloWVR5Q01yK2NHT2dYRTU5SXJOdHNJelFQaTkramFST09heFdzcHph?=
 =?utf-8?B?TWZSOHpsREJMYkJ2aUgzM2tGVGlIVFAyK1lUc2xaSjloZGFpV0t2aGt1REZu?=
 =?utf-8?B?M2VsOGkyMTk0bmhua3NIYVVKQ3VjcHFjeHd6ejVNV1V2d2syaVJKMDAwNTQ5?=
 =?utf-8?B?bjdhNjRBelBkSWlRQ3VVRTVXL0s0UmRidU5tVXFqcmU5K1JXR2FobGUzdnFK?=
 =?utf-8?B?amU1SGlFbXo3REFqNzFoMXhJZWhrWEIyTjRRSU5pVTNmWVovYzQ2RXZHUENr?=
 =?utf-8?B?QWxGQjRJbTFWUDE5TGxJYkE3aFNPbElqZzRiUjQzNHNIbFZhR1ozYzhYSC9C?=
 =?utf-8?B?TWM5ekpscmg3ejR1OC9naGY2VWY0VU1sNFV0akpscm1hV0dxc2xsRlpIVW4w?=
 =?utf-8?B?SllJdjRLTjU5TGlHU0ZyRjh0bnhlbDc3di9DeGFmRzNjSytqeFpCMHhHQStG?=
 =?utf-8?B?Skd6b05zNmtscmQvT0IwSGtKRDhaWjYyTnNwc0N6Uk1BTUNMcXJOWlVzME1m?=
 =?utf-8?B?WnhHU1FXK2h5OWd5cjZWb0dWS3ptUXpqcHMrWHpoNm9QdmRNakM2bVUxRWlD?=
 =?utf-8?B?cHFwUnZwbUpmTXptZk5jdi9BY1lJSFJaTHdUMkVFZmdUR0d6OFVaK2RLbTM4?=
 =?utf-8?B?WUNBSjQ2Wk43VUtsbWFXODE4OXZ3cUFMOFhnNjllV2Z4dDFhTXpwNWVSemxT?=
 =?utf-8?B?NnREU0xvN2lpc2tsczFobHpKdjA2WnhqSThmVEdjOVVudFoxdFpTRlEycTBl?=
 =?utf-8?B?VTR0RUtjZktWNzhjSlFZOGdOdEd6NEFNVnhuajd0bWxDbG93WlBraExKMjRS?=
 =?utf-8?B?dWlnbVdITHJzRUNMTDFTRSsydFhVZjRCeXNDalNhd3ljelFzaWVRVUppU1do?=
 =?utf-8?B?Y0Y2VlgrNzFkTlE3T3BJZzdkR1dSNE5VekxKYlFBQytFOFl2MDNWbEVNdmo4?=
 =?utf-8?B?MkFQMHUwUWd0SGJRZEM0SUR4LzNDUDE1THZkRkZQeFlZek9xc1NWeTEzNjV1?=
 =?utf-8?B?c2VhZXNQWDkrQ01DTWcyZHo4c0NSUDcwbzRiUkhKeEIzMDV2QmZNeHc3ajVH?=
 =?utf-8?B?MlYxeklvN3RBNE1GWHAraUVqclBFZG14R3hrM1FJTk95dUgxQXdjaVFQbHZW?=
 =?utf-8?B?U0JUSWNRV2RlaVRmQkRGZFY5bnVBOVdjNG1WN21oUThQYTlzeUxqN1NKRDJZ?=
 =?utf-8?B?Ykt5SFloYXZucEd5NWt1bnlZOWExcHoxVVBmR2xPa2pXMVkvUlRuK3labnpE?=
 =?utf-8?B?bjl3bTF4TXc2YWgrRnB1aFI0VnZ6b0U2R1BJdEFPbm1lV01IYi9wWG8rdG1R?=
 =?utf-8?B?Z3F4QkZTWHZock9XalVuUmtmeDVvUjZ3Vktwb01RdnJob3JXZFEyai9GTUlF?=
 =?utf-8?B?enVnNjFFZUxCQ0tybXc2VERsb0hjZWMyS2hhVkdvTlpRdlhhNktadz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa91d8b-573e-40fe-31a6-08de72944073
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 04:30:19.4757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Anx+JEBJJSkkObuUJZIrjLUyu7EzHNliFzfu615LH6j09jzLvMsyRCBkTWImXK28ZNadHW1T8Belmt0mBv/64s90Cf7l3zCM4IgBIKPxIIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6085
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFkYXYsIEFydmluZCA8
YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgMTcgRmVicnVhcnksIDIw
MjYgMDg6MDQgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBC
cm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwg
UHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb207DQo+IFNoYXJtYSwgTmlzaGl0IDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT47IEd1cnJhbSwgUHJhdmFsaWthDQo+IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDIvOF0gbGliL3hlOiBBZGQgcHVyZ2VhYmxl
IG1lbW9yeSBpb2N0bCBzdXBwb3J0DQo+IA0KPiBBZGQgeGVfdm1fbWFkdmlzZV9wdXJnZWFibGUo
KSBoZWxwZXIgZnVuY3Rpb24gdG8gc3VwcG9ydCBwdXJnZWFibGUNCj4gbWVtb3J5IG1hbmFnZW1l
bnQgdGhyb3VnaCB0aGUgWEUgbWFkdmlzZSBpb2N0bC4gVGhpcyBhbGxvd3MgYXBwbGljYXRpb25z
DQo+IHRvIGhpbnQgdG8gdGhlIGtlcm5lbCBhYm91dCBidWZmZXIgb2JqZWN0IHVzYWdlIHBhdHRl
cm5zIGZvciBiZXR0ZXIgbWVtb3J5DQo+IG1hbmFnZW1lbnQgdW5kZXIgcHJlc3N1cmUuDQo+IA0K
PiBUaGUgZnVuY3Rpb24gcHJvdmlkZXMgYSBjbGVhbiBpbnRlcmZhY2UgdG86DQo+IC0gTWFyayBi
dWZmZXIgb2JqZWN0cyBhcyBET05UTkVFRCAocHVyZ2VhYmxlKQ0KPiAtIE1hcmsgYnVmZmVyIG9i
amVjdHMgYXMgV0lMTE5FRUQgKG5vdCBwdXJnZWFibGUpDQo+IA0KPiBSZXR1cm5zIHRoZSByZXRh
aW5lZCB2YWx1ZSBkaXJlY3RseSAoMSBpZiBiYWNraW5nIHN0b3JlIGV4aXN0cywgMCBpZiBwdXJn
ZWQpLg0KPiANCj4gQWxzbyB1cGRhdGUgX194ZV92bV9tYWR2aXNlKCkgdG8gcmVqZWN0IHB1cmdl
YWJsZSBzdGF0ZSBvcGVyYXRpb25zIGFuZA0KPiBkaXJlY3QgdXNlcnMgdG8gdGhlIGRlZGljYXRl
ZCBoZWxwZXIuDQo+IA0KPiB2MjoNCj4gICAtIHJldGFpbmVkIG11c3QgYmUgaW5pdGlhbGl6ZWQg
dG8gMChUaG9tYXMpDQo+IA0KPiBDYzogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRl
bC5jb20+DQo+IENjOiBQcmF2YWxpa2EgR3VycmFtIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT4NCj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBDYzog
VGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBD
YzogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBBcnZpbmQgWWFkYXYgPGFydmluZC55YWRhdkBpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgbGliL3hlL3hlX2lvY3RsLmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4gbGliL3hlL3hlX2lvY3RsLmggfCAgMiArKw0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2lvY3Rs
LmMgYi9saWIveGUveGVfaW9jdGwuYyBpbmRleCAxNmFhZTA1YzkuLmI2MWY4NWI3Yg0KPiAxMDA2
NDQNCj4gLS0tIGEvbGliL3hlL3hlX2lvY3RsLmMNCj4gKysrIGIvbGliL3hlL3hlX2lvY3RsLmMN
Cj4gQEAgLTczOSw2ICs3MzksOSBAQCBpbnQgX194ZV92bV9tYWR2aXNlKGludCBmZCwgdWludDMy
X3Qgdm0sIHVpbnQ2NF90DQo+IGFkZHIsIHVpbnQ2NF90IHJhbmdlLA0KPiAgCWNhc2UgRFJNX1hF
X01FTV9SQU5HRV9BVFRSX1BBVDoNCj4gIAkJbWFkdmlzZS5wYXRfaW5kZXgudmFsID0gb3BfdmFs
Ow0KPiAgCQlicmVhazsNCj4gKwljYXNlIERSTV9YRV9WTUFfQVRUUl9QVVJHRUFCTEVfU1RBVEU6
DQo+ICsJCS8qIFB1cmdlYWJsZSBzdGF0ZSBoYW5kbGVkIGJ5IHhlX3ZtX21hZHZpc2VfcHVyZ2Vh
YmxlICovDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiAgCWRlZmF1bHQ6DQo+ICAJCWlndF93YXJu
KCJVbmtub3duIGF0dHJpYnV0ZVxuIik7DQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiBAQCAtNzc1
LDYgKzc3OCwzNiBAQCB2b2lkIHhlX3ZtX21hZHZpc2UoaW50IGZkLCB1aW50MzJfdCB2bSwgdWlu
dDY0X3QNCj4gYWRkciwgdWludDY0X3QgcmFuZ2UsDQo+ICAJCQkJICAgICAgaW5zdGFuY2UpLCAw
KTsNCj4gIH0NCj4gDQo+ICsvKioNCj4gKyAqIHhlX3ZtX21hZHZpc2VfcHVyZ2VhYmxlOg0KPiAr
ICogQGZkOiB4ZSBkZXZpY2UgZmQNCj4gKyAqIEB2bV9pZDogdm1faWQgb2YgdGhlIHZpcnR1YWwg
cmFuZ2UNCj4gKyAqIEBzdGFydDogc3RhcnQgb2YgdGhlIHZpcnR1YWwgYWRkcmVzcyByYW5nZQ0K
PiArICogQHJhbmdlOiBzaXplIG9mIHRoZSB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UNCj4gKyAqIEBz
dGF0ZTogcHVyZ2VhYmxlIHN0YXRlIChEUk1fWEVfVk1BX1BVUkdFQUJMRV9TVEFURV9XSUxMTkVF
RCBvcg0KPiArRE9OVE5FRUQpDQo+ICsgKg0KPiArICogU2V0cyB0aGUgcHVyZ2VhYmxlIHN0YXRl
IGZvciBhIHZpcnR1YWwgbWVtb3J5IHJhbmdlLiBUaGlzIGFsbG93cw0KPiArYXBwbGljYXRpb25z
DQo+ICsgKiB0byBoaW50IHRvIHRoZSBrZXJuZWwgYWJvdXQgYnVmZmVyIG9iamVjdCB1c2FnZSBw
YXR0ZXJucyBmb3IgYmV0dGVyIG1lbW9yeQ0KPiBtYW5hZ2VtZW50Lg0KPiArICoNCj4gKyAqIFJl
dHVybnM6IHJldGFpbmVkIHZhbHVlICgxIGlmIGJhY2tpbmcgc3RvcmUgZXhpc3RzLCAwIGlmIHB1
cmdlZCkgICovDQo+ICt1aW50MzJfdCB4ZV92bV9tYWR2aXNlX3B1cmdlYWJsZShpbnQgZmQsIHVp
bnQzMl90IHZtX2lkLCB1aW50NjRfdCBzdGFydCwNCj4gKwkJCQkgdWludDY0X3QgcmFuZ2UsIHVp
bnQzMl90IHN0YXRlKQ0KPiArew0KPiArCXVpbnQzMl90IHJldGFpbmVkX3ZhbCA9IDA7DQo+ICsJ
c3RydWN0IGRybV94ZV9tYWR2aXNlIG1hZHZpc2UgPSB7DQo+ICsJCS52bV9pZCA9IHZtX2lkLA0K
PiArCQkuc3RhcnQgPSBzdGFydCwNCj4gKwkJLnJhbmdlID0gcmFuZ2UsDQo+ICsJCS50eXBlID0g
RFJNX1hFX1ZNQV9BVFRSX1BVUkdFQUJMRV9TVEFURSwNCj4gKwkJLnB1cmdlX3N0YXRlX3ZhbC52
YWwgPSBzdGF0ZSwNCj4gKwkJLnB1cmdlX3N0YXRlX3ZhbC5yZXRhaW5lZCA9DQo+ICh1aW50NjRf
dCkodWludHB0cl90KSZyZXRhaW5lZF92YWwsDQo+ICsJfTsNCj4gKw0KPiArCWlndF9hc3NlcnRf
ZXEoaWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfWEVfTUFEVklTRSwgJm1hZHZpc2UpLCAwKTsNCj4g
KwlyZXR1cm4gcmV0YWluZWRfdmFsOw0KPiArfQ0KPiArDQo+ICAjZGVmaW5lCUJJTkRfU1lOQ19W
QUwJMHg2ODY4NjgNCj4gIHZvaWQgeGVfdm1fYmluZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qg
dm0sIHVpbnQzMl90IGJvLCB1aW50NjRfdCBvZmZzZXQsDQo+ICAJCQl1aW50NjRfdCBhZGRyLCB1
aW50NjRfdCBzaXplLCB1aW50MzJfdCBmbGFncykgZGlmZiAtLWdpdA0KPiBhL2xpYi94ZS94ZV9p
b2N0bC5oIGIvbGliL3hlL3hlX2lvY3RsLmggaW5kZXggM2VhNjUxMDYzLi44ZWI1MDY5MTUgMTAw
NjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9pb2N0bC5oDQo+ICsrKyBiL2xpYi94ZS94ZV9pb2N0bC5o
DQo+IEBAIC0xMDcsNiArMTA3LDggQEAgaW50IF9feGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQz
Ml90IHZtLCB1aW50NjRfdA0KPiBhZGRyLCB1aW50NjRfdCByYW5nZSwgdWludDY0X3QNCj4gIAkJ
ICAgIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90IG9wX3ZhbCwgdWludDE2X3QgcG9saWN5LCB1aW50
MTZfdA0KPiBpbnN0YW5jZSk7ICB2b2lkIHhlX3ZtX21hZHZpc2UoaW50IGZkLCB1aW50MzJfdCB2
bSwgdWludDY0X3QgYWRkciwgdWludDY0X3QNCj4gcmFuZ2UsIHVpbnQ2NF90IGV4dCwNCj4gIAkJ
ICAgdWludDMyX3QgdHlwZSwgdWludDMyX3Qgb3BfdmFsLCB1aW50MTZfdCBwb2xpY3ksIHVpbnQx
Nl90DQo+IGluc3RhbmNlKTsNCj4gK3VpbnQzMl90IHhlX3ZtX21hZHZpc2VfcHVyZ2VhYmxlKGlu
dCBmZCwgdWludDMyX3Qgdm1faWQsIHVpbnQ2NF90IHN0YXJ0LA0KPiArCQkJCSB1aW50NjRfdCBy
YW5nZSwgdWludDMyX3Qgc3RhdGUpOw0KUmV2aWV3ZWQtYnk6IFByYXZhbGlrYSBHdXJyYW0gPHBy
YXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiAgaW50IHhlX3ZtX251bWJlcl92bWFzX2luX3Jh
bmdlKGludCBmZCwgc3RydWN0DQo+IGRybV94ZV92bV9xdWVyeV9tZW1fcmFuZ2VfYXR0ciAqdm1h
c19hdHRyKTsgIGludCB4ZV92bV92bWFfYXR0cnMoaW50DQo+IGZkLCBzdHJ1Y3QgZHJtX3hlX3Zt
X3F1ZXJ5X21lbV9yYW5nZV9hdHRyICp2bWFzX2F0dHIsDQo+ICAJCSAgICBzdHJ1Y3QgZHJtX3hl
X21lbV9yYW5nZV9hdHRyICptZW1fYXR0cik7DQo+IC0tDQo+IDIuNDMuMA0KDQo=
