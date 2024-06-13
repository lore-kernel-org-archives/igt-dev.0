Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D47DC27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 10:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DEB10EA06;
	Thu, 13 Jun 2024 10:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3ciXkxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F4F10EA08
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 10:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718274280; x=1749810280;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=juDt2tgrbZuW+WGNnuWjXlWZT9t7bcIijBzsLy8Uxtg=;
 b=E3ciXkxbAnGbyWSU4MIPoEKPXw1CT82tz9ITm66di7nyd0utuWM4+iVw
 b0ZlKFLEik/87sYKU1qWl+vG5sxsDHA0NsZcy3NcJvHaOg6DgNSJl9PZA
 rpX6QVBmXAo+D+47qd+Fsj5K8qU9KpZ2xp+9zVAl/1u5Ju7UNkjgGJHOg
 bT+l0KEyM2PJJ1nRjuIiBdIiXJF+WGD5jj5bGE5k7k5C8/L1WshiLuyTn
 R+1t31/UTIplMEciAjoOfBFprl6AxVeth3EwMsP8iKVALU9YsoIQxFiu5
 cpaIqF6HEv/f+2TEyQk5/A39gPcLNKNyAnD7L9tpwsEKvx0b5f2FQkgyn A==;
X-CSE-ConnectionGUID: e26IEY4gQcaoXxXUpkom4g==
X-CSE-MsgGUID: 19csWSkbRFq5IGLB4ncCiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18865406"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18865406"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:24:32 -0700
X-CSE-ConnectionGUID: /xV86tsmQ+WO779dwTV3Fw==
X-CSE-MsgGUID: WFkf3eHQT4WfOLeivnehlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="45221840"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 03:24:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 03:24:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 03:24:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 03:24:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 03:24:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npFqhG9M/nipKqJ7UcIfB4Yn4T26x30tYBdGWOGGBrA1kiUk99nyn/VUdY4Wl/k1MgZG0CNc2MX7RXQZ1+GklJ2PjjLgUwU3bp+n7C2jjMHBxqmzmuYbGLliKtZRFEzFkSyOfopZM9vdABKUclFNPFDeGw6WqUwnfMAS3e7frsdNFoUeZCSkNOVelmEfEtPrsKhstEQbYCxNKnNOn39RBpNzAm+RZl2wao6rwguWNdgwLDWGWGhGPI+H025oMYOIo6C+HvPau8C5aTh46vKk75X4Zx5xy+NijzrSamFuRAZdLK92Ba1jJo702Pyt26eeMItGK2YE0IA7ZswzBnjQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juDt2tgrbZuW+WGNnuWjXlWZT9t7bcIijBzsLy8Uxtg=;
 b=QgwhKkj/F5XKmhDx6NMxaVy/yDRH2J4O/35IjSDTO5+t90vVJgIGtPdeGdKRyGZwCZ0BcWg+l01eDcRmr6e1wgvcleyk7cg29J2nIB/LlPj7bvUl6mWzDFT1wdwZZRXyEUwynSJLLXe2etRrBg82sPa9qJoB0/q3OSRolbNzFhXvP5Pfz72PU5QAUwKhVN1mRfyVLbw2zd+P+s/MAMArsRDxFCxWJlwb3Hyygs7wQDtkC4zc8fS9dpWplnctVIcabVXGIqs/Ia7kH3J5ksnxxyDyjdtTer3yXjsMtwGl5dmEPPKXfgYrQx65vbsWtT7Fgymu2fvgasXvQObhPzzOQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.23; Thu, 13 Jun 2024 10:24:29 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7633.036; Thu, 13 Jun 2024
 10:24:28 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Thread-Index: AQHavLeO2i3eSbKCe0e6On8hThr68bHFfk2A
Date: Thu, 13 Jun 2024 10:24:28 +0000
Message-ID: <2629f237be8dca024b5a41456c68ccf37788afd8.camel@intel.com>
References: <20240612110645.1110374-1-jeevan.b@intel.com>
 <20240612110645.1110374-2-jeevan.b@intel.com>
In-Reply-To: <20240612110645.1110374-2-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH0PR11MB7424:EE_
x-ms-office365-filtering-correlation-id: 0dc5c087-0a83-4ceb-83e6-08dc8b9301e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230034|366010|376008|1800799018|38070700012;
x-microsoft-antispam-message-info: =?utf-8?B?NmNwYkxyMENVSTRHdWZhTGV0b2d5RG1SeVFMekl6SUt2c3BINmZyUCtOdFRQ?=
 =?utf-8?B?Qk1qZU56R3pmM0pxazhla1lESHRFaU1NckJLR0FtbHdoaDhFNlRQNlNBSmZS?=
 =?utf-8?B?ZlF3b3hvODVZN1dCNWd6Y3l6VGhNR08xcmRDQ2RmL3NpWFA2dzg1L1RxaGZW?=
 =?utf-8?B?eWduVHJaUjBjYkZzc28vSHY5TUg2aHZCRHJoS3VhRUpyeCtQVlpKaHZNa25p?=
 =?utf-8?B?aTk2cS9oenpXQ0EvUCtSTmtiK3d3TWpkSlNzNDlPd0RzazdyYjdMQUJ3ckdQ?=
 =?utf-8?B?U3NjRVpiWWdmYUdpOVNRZVRQSFhKUm4wR3dQdTBnMTcrclNWRWN2K0xrWUtz?=
 =?utf-8?B?VS9UUUxVaDhXQmw2WlpFbXhwaUV6dDlTVzRPMDR3RU9IeEV4TFNOY2s5Tlk2?=
 =?utf-8?B?b01uazNDbVZKVTVhVEFhWlBkM0VqaHlCLzV6aG1xMEhzTEVySkNKWjUvdkkz?=
 =?utf-8?B?cFI3dzVLRDlHMkVOajJmZExCanZuaWNsd1VCUDZjdGxHRFFhSnFaUHpOODJH?=
 =?utf-8?B?dHhZb2gzdkF6enRuUWMxaktYT1czZjJ6aHpuQnVnaCtMQXVlOW11NkhEYzZ2?=
 =?utf-8?B?UC9KRU5lbXFLS1lBblluak9sbmsxWEFmV2drdHBoc2FKakJVRDdOWXEwa01l?=
 =?utf-8?B?UUF1Tit3eTFObVc5Y1hkVnFBdUN4N0gxQ09MMkgxbkVISzJ0MEFBR005UVlF?=
 =?utf-8?B?VnhqT3htZG43UnVFT0kvaHF2WEE5WmhzLzVrSzZoSmZKT3g4Z3UwbHpuSkFH?=
 =?utf-8?B?Ym1kbmdGTUt6UWpZNGZLeUhJVVZkelI3YmFINFpvYzdjeklaL2srTzgyV2pT?=
 =?utf-8?B?Q3NJRzMxcU4zL3pBVnRESlRDRjhzYTEyZFlMd1FFaWYxdUxzcDFUSFh4QWJW?=
 =?utf-8?B?MFhtckVHeVpWUXR4MEFuemg1MmR5eXB1cUhnZndKYkh5ajRZZVltZUQvRVRz?=
 =?utf-8?B?eDVnaGx5WUl3aTlJWS9NZ2J0SDFlUFVqMWNObVpieGdQME1qTlE0a3hJVmpK?=
 =?utf-8?B?Z3BTazB1ZEtPQXdiL1l6akhtZHdTMzAvTFgwcDRZRHBuSldGSHNLSWMydFNr?=
 =?utf-8?B?WG85R1crVTZXTytrVmJjcU1zYzBMbzVUdHA3R21OdW90ZGppVnRWZmIrd3NJ?=
 =?utf-8?B?MHpNNG1zbXl0Q2hXL1ZIQzJaT3ErbklzSTU4VW1OcUN2UlY4UzA0dlVyZFhR?=
 =?utf-8?B?OUhrc0graU9kaGdJRzUzQ3Y5Zzh4WnFvVis3NUg2MDg2QnBrZGR6aWZDeldh?=
 =?utf-8?B?MHpBMDcxdEdVZ2labU1HTml3bmVCdlZHZ3psOE02OEs3ZUVpVlBWTElCYVBi?=
 =?utf-8?B?aFpqOFNpREdkQ1pNbVJrbDJDcDhzWmlPUkNWTDE1VHVscUdPRlF5SVNOZUVN?=
 =?utf-8?B?LzFKMHRaTXRQNHpXUVFzME1NMlNXWVY1clBoTVhhRWhVNWo3bUdhYmg5Zzkr?=
 =?utf-8?B?VnEvRUdrM1UvWUNCMkt2LytHbU5za3ZiL1p2T3lvTCtsWmVvb0FaTVM0bWJs?=
 =?utf-8?B?NklOcVlWdVordVpDTDhnaTB1YWkwbDBHQjN2N3haY0s0V0YxVG14NXErdm9n?=
 =?utf-8?B?ZVBEZjhqOVhXODNFaU8wQ1pSak81TnV5ejdGeG5RVXFqZ0tRQlYzQkxZTzVK?=
 =?utf-8?B?ZGNrZGR0c3phek1JeDNjeC96WWQ4b00vZTZ2b0ZlMy9YVkRiWmxqRnI1NzdV?=
 =?utf-8?B?U251Q2gxZEtZVlM4THpqd2RpQytKRHJkT3M5TnJteWNLK05WaHNnY2Z3Z3li?=
 =?utf-8?B?UjVlK0k1QnMwakRURll6cGJsbnIrUE9PdG1DNzVLRkRla0l2dmFPM0xmLzRr?=
 =?utf-8?Q?McWIiaXyiKDCxQDCW4V6GczhucpK+1khllMow=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(366010)(376008)(1800799018)(38070700012); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVM1L3VrOExPalJWSWZsMVE0NDY2bEpDTk85U0Fnb09CNWNFZk1RLy9Oci8x?=
 =?utf-8?B?MFUwbkZ1dFZuM05zeXZCSCtaRU01Y1RxL3ZnWElOeHRGNFFSTUVHNWZVdzNL?=
 =?utf-8?B?SW1SRFZnQjlSQ0hGRXVja1pUMEE3VDlVbEJSenlyelE1S0xuWHhSK0FIMFd4?=
 =?utf-8?B?UVNBMHAwSGpQZHV2c3lxejJUUFpXM3kxM2hxSmpNckhLTVh2WnE5WEZQc21q?=
 =?utf-8?B?UUFaZ3BOcjRsaUhHVzZWc3BLWDIyUDFtUENBRmhhamY4SUpJb0ZRQlpkb3RQ?=
 =?utf-8?B?ejMxb0NGZ1UzaVhBWmhkdDJNL05lRmFQa2ZXcHlhS0NqYkJEa0FaYlFvVXZn?=
 =?utf-8?B?TEl4VUpPc281SGNraGFWY1hWcFBlSnpiQU1NVlJlRXBiK2RYVlRBYkZVSkda?=
 =?utf-8?B?UHB1VmgvT3AxbWRnMFBOc05jdXo5d0JYVWdhL0ZVbGpidXBjdmhSbkVoT0lt?=
 =?utf-8?B?L25IaSthcmpqYzdVaVJaQ29kbngxZTNzSm1vcmJtaFJZWE9OTUFnTlhwdHB1?=
 =?utf-8?B?ZjBDb2doc3pGeVlzdnJadm5MdWl3eHVodDR0QzhjYVdHNEVheDdoc2pvdzgv?=
 =?utf-8?B?U05DQ0tJa284S2dIaVdOdXNjNTlJQlh2T3NqL1BncWFTWSs2dFd0emY3TUR4?=
 =?utf-8?B?OHpSd3FNL1lxTnVaVlFrOTNIa0FMSzVNcmpHa3o3UmtHVDVKSWVrZW9tN0ZG?=
 =?utf-8?B?Rlg2dWVuS05vNVFpRjE2QklLbGFtaVR6aHRGV0M2OCt4UFYrTHluSHNaVXB4?=
 =?utf-8?B?cnc3dHNmTDRDRlJQRTRkU1cvTzZIczR1SHEzYnE3OEdqM2YrVmdWNlh5NTdC?=
 =?utf-8?B?SVhMSVQwZVVZWjhwVjlMVzVZUERxalF6a2tCeVpRZ2UrbWVLWE90QWRGL1FH?=
 =?utf-8?B?SnY0NU56dHp3WHpJNVlmb09ZaEl3Y1pWTnB2LzZQRHMvTmFPMGNNZ2cvT29a?=
 =?utf-8?B?YTQ5bHFHa0lYTUVTRFhrYnN6M0lkWjltYXNzRnhUZW1sY0RLNUpQUndVTVdi?=
 =?utf-8?B?djdiY2prYU5TQVRtNnlOTXlVTmFsdm1yYWhuWC9yKytQaEhMYXpET1dlK0Vt?=
 =?utf-8?B?SUNibmlkN2ExS1JCOWFKYWowYm9FV2I1bStuRmRWajRDRHlJemw5OERSTXhK?=
 =?utf-8?B?cDBhY0hwQlExcGxZZU1Cc2Z0YjB0eHdPN1ZkdmJoRU1GT1VvcUMvNjF4Zktz?=
 =?utf-8?B?S0RtZmU0L3FOb1dSVWlsUTB2OGtPVnNjckRpRnlqeVJwTnp0cnNhanBuLzRn?=
 =?utf-8?B?a3hBcEJCOFRQZFYrd0xxa2RHQTd2c0FUR0g5S2g3RTdWY0FRVXIxeUZiSjJz?=
 =?utf-8?B?T01qaUlaaGJiK25iSnFCcENoQVVYTzFhNGIwUm1xbVE1OTh6Z0wzNmkvNEp5?=
 =?utf-8?B?RWZGLzI3MUdKVzMwdlVMdjNMN3JubEJSK0RDOTdDbGp6eXFvQit2SHQyVTZB?=
 =?utf-8?B?T3BYRlg2ekNiaGpTdEVlWEw0MVB0bXlLYzhFUWNlZGZpNUJEOVB3Nk42NXNB?=
 =?utf-8?B?L0JreWJndnFyL2ordkR6cG1ySGt6VDFsNUpXTThNNkR2VXBpSkt6ZjNUQ2JJ?=
 =?utf-8?B?UzdyRXpObGoxRXdobHE5VU4rSGZKTnZYUk9tZkthUUN0dkVJcW5HbGZ6SUFt?=
 =?utf-8?B?NTVCUktzRk0xWlIvbng1NjBTWTIybGpCU1pJK1RQVG1rbjNGZHF1T2lUL1Vu?=
 =?utf-8?B?aVZRQ3FqcldVa1JKNTdJUCtkUDZiV2RsMTEwYmRPVEZLVmlVZFpjRTYyQ3k2?=
 =?utf-8?B?TWFJaENWM01RZkhjb2xJWW8ybWtrVTl2V1RITFQ4ai9WQ0xOT1NDMmpoWmo0?=
 =?utf-8?B?MTlZMXhrWU4yNVY0K2NOOEpMb0xZK1BzUkdNa3FEK1pSc3Y5eTgwcXJMaE5W?=
 =?utf-8?B?Q2FnelBBSmdNRDJoR01IblV1aXgzRHhhU3N4YnZtK084OHlucHY5RERlSVVw?=
 =?utf-8?B?QnZCMGlCZUVvSU85aVM0QzFKTDJURzVaZjJ4QTlCenEvc2owMTRzK1FoV0Nq?=
 =?utf-8?B?bGt4YUtuS1EvYXJWRzFRcEZKSWNaRHRmMm5WSHQ1bFZicDIxNW5zdndIWFI1?=
 =?utf-8?B?V0V1OUs3TXA5UDZvd3JnTEMxUlJOSmo4YW52QzBWVHcwU2kzMWZxdnlpSWVu?=
 =?utf-8?B?VWNpQ29xd0VzTFdadUV3TmJMcE85aXZ5Sy8yQThyUlFPMEZEUUFoN1ZYbkVH?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E470D140F9D3E443BC2029D9B5A77519@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc5c087-0a83-4ceb-83e6-08dc8b9301e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 10:24:28.7543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Tk6nwensTI6zKZl6SA18rQEI8/xZyQ4d5x3rp4njn2kPuuChvly4J0U7xUI37pskZtfZgfWSdmXf2E+NPJGrvK2MvnYuGJ8+eH7MH1hfm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
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

T24gV2VkLCAyMDI0LTA2LTEyIGF0IDE2OjM2ICswNTMwLCBKZWV2YW4gQiB3cm90ZToKPiBBZGRl
ZCBoZWxwZXIgZnVuY3Rpb25zIHRvIGNoZWNrIHNpbmsgc3VwcG9ydCBmb3IgZWFybHkgdHJhbnNw
b3J0IGFuZAo+IGNoZWNrIGVhcmx5IHRyYW5zcG9ydCBhY3RpdmUgY2hlY2suCj4gCj4gdjI6IEFk
ZCBlYXJseSB0cmFzcG9ydCBmb3IgUFIgYW5kIFBTUjIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmVl
dmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4KPiAtLS0KPiDCoGxpYi9pZ3RfcHNyLmMgfCAxNSAr
KysrKysrKysrKysrKysKPiDCoGxpYi9pZ3RfcHNyLmggfMKgIDMgKysrCj4gwqAyIGZpbGVzIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBi
L2xpYi9pZ3RfcHNyLmMKPiBpbmRleCA2MDA4YjczYTYuLmIxY2E1NzIwMSAxMDA2NDQKPiAtLS0g
YS9saWIvaWd0X3Bzci5jCj4gKysrIGIvbGliL2lndF9wc3IuYwo+IEBAIC01Myw2ICs1MywxNiBA
QCBib29sIHNlbGVjdGl2ZV9mZXRjaF9jaGVjayhpbnQgZGVidWdmc19mZCwKPiBpZ3Rfb3V0cHV0
X3QgKm91dHB1dCkKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHN0cnN0cihidWYsICJQU1IyIHNl
bGVjdGl2ZSBmZXRjaDogZW5hYmxlZCIpOwo+IMKgfQo+IMKgCj4gK2Jvb2wgZWFybHlfdHJhbnNw
b3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2ZkKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgY2hhciBidWZb
UFNSX1NUQVRVU19NQVhfTEVOXTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWd0X2RlYnVnZnNfc2lt
cGxlX3JlYWQoZGVidWdmc19mZCwgImk5MTVfZWRwX3Bzcl9zdGF0dXMiLAo+IGJ1ZiwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBzaXplb2YoYnVmKSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBzdHJzdHIoYnVmLCAi
KEVhcmx5IFRyYW5zcG9ydCkiKTsKPiArfQoKSWYgdGhpcyBpcyBjaGVja2luZyB0aGF0IEVhcmx5
IFRyYW5zcG9ydCBpcyBlbmFibGVkIHlvdSBzaG91bGQgZG86CgpyZXR1cm4gc3Ryc3RyKGJ1Ziwg
ImVuYWJsZWQgKEVhcmx5IFRyYW5zcG9ydCkiKTsKClRoYXQgd29ya3MgZm9yOgoKUFNSIG1vZGU6
IFBTUjIgZW5hYmxlZCAoRWFybHkgVHJhbnNwb3J0KQoKYW5kCgpQU1IgbW9kZTogUGFuZWwgUmVw
bGF5IFNlbGVjdGl2ZSBVcGRhdGUgZW5hYmxlZCAoRWFybHkgVHJhbnNwb3J0KQoKPiArCj4gwqBz
dGF0aWMgYm9vbCBwc3JfYWN0aXZlX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBlbnVtIHBzcl9tb2Rl
IG1vZGUsCj4gaWd0X291dHB1dF90ICpvdXRwdXQpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoGNo
YXIgZGVidWdmc19maWxlWzEyOF0gPSB7MH07Cj4gQEAgLTI0NywxMCArMjU3LDE1IEBAIGJvb2wg
cHNyX3Npbmtfc3VwcG9ydChpbnQgZGV2aWNlLCBpbnQKPiBkZWJ1Z2ZzX2ZkLCBlbnVtIHBzcl9t
b2RlIG1vZGUsIGlndF9vdXRwdXQKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJzdHIoYnVmLCAiU2luayBzdXBwb3J0OiB5ZXMgWzB4MDRdIikgfHwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoc3Ryc3RyKGxpbmUs
ICJQU1IgPSB5ZXMiKSAmJgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIChzdHJzdHIobGluZSwgIlsweDAzXSIpIHx8IHN0cnN0cihsaW5lLAo+ICJbMHgwNF0i
KSkpOwo+ICvCoMKgwqDCoMKgwqDCoGNhc2UgUFNSX01PREVfMl9FVDoKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHN0cnN0cihidWYsICJTaW5rIHN1cHBvcnQ6IHllcyBb
MHgwNF0iKSAmJgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KHN0cnN0cihsaW5lLCAiUFNSMiAoRWFybHkgVHJhc3BvcnQpIikgfHwKCklmIHRoaXMgaXMgY2hl
Y2tpbmcgaWYgc2luayBzdXBwb3J0IFBTUjIgRWFybHkgVHJhbnNwb3J0OgpzdHJzdHIoYnVmLCAi
U2luayBzdXBwb3J0OiB5ZXMgWzB4MDRdIikgaXMgZW5vdWdoCgo+IHN0cnN0cihsaW5lLCAiWzB4
MDRdIikpOwo+IMKgwqDCoMKgwqDCoMKgwqBjYXNlIFBSX01PREU6Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gc3Ryc3RyKGxpbmUsICJQYW5lbCBSZXBsYXkgPSB5ZXMs
IFBhbmVsIFJlcGxheQo+IFNlbGVjdGl2ZSBVcGRhdGUgPSBubyIpOwo+IMKgwqDCoMKgwqDCoMKg
wqBjYXNlIFBSX01PREVfU0VMX0ZFVENIOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIHN0cnN0cihsaW5lLCAiUGFuZWwgUmVwbGF5ID0geWVzLCBQYW5lbCBSZXBsYXkK
PiBTZWxlY3RpdmUgVXBkYXRlID0geWVzIik7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBQUl9NT0RF
X1NFTF9GRVRDSF9FVDoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHN0
cnN0cihsaW5lLCAiUGFuZWwgUmVwbGF5IFNlbGVjdGl2ZSBVcGRhdGUKPiBlbmFibGVkIChFYXJs
eSBUcmFzcG9ydCkiKTsKCklmIHRoaXMgaXMgY2hlY2tpbmcgc2luayBzdXBwb3J0LiAiUGFuZWwg
UmVwbGF5IFNlbGVjdGl2ZSBVcGRhdGUKZW5hYmxlZCAoRWFybHkgVHJhc3BvcnQpIiBtZWFucyBp
dCdzIGVuYWJsZWQuCgpJbnN0ZWFkOgoKcmV0dXJuIHN0cnN0cihsaW5lLCAiUGFuZWwgUmVwbGF5
IFNlbGVjdGl2ZSBVcGRhdGUgPSB5ZXMgKEVhcmx5ClRyYW5zcG9ydCkiKTsKCmNoZWNrcyBpZiBz
dXBwb3J0ZWQgYnkgc2luay4KCkJSLAoKSm91bmkgSMO2Z2FuZGVyCgo+IMKgwqDCoMKgwqDCoMKg
wqBkZWZhdWx0Ogo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydF9m
KGZhbHNlLCAiSW52YWxpZCBwc3IgbW9kZVxuIik7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gZmFsc2U7Cj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmggYi9saWIv
aWd0X3Bzci5oCj4gaW5kZXggZTg1OTVmZDhjLi5hN2ViZDA3MzkgMTAwNjQ0Cj4gLS0tIGEvbGli
L2lndF9wc3IuaAo+ICsrKyBiL2xpYi9pZ3RfcHNyLmgKPiBAQCAtMzUsOCArMzUsMTAgQEAgZW51
bSBwc3JfbW9kZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoFBTUl9NT0RFXzEsCj4gwqDCoMKgwqDCoMKg
wqDCoFBTUl9NT0RFXzIsCj4gwqDCoMKgwqDCoMKgwqDCoFBTUl9NT0RFXzJfU0VMX0ZFVENILAo+
ICvCoMKgwqDCoMKgwqDCoFBTUl9NT0RFXzJfRVQsCj4gwqDCoMKgwqDCoMKgwqDCoFBSX01PREUs
Cj4gwqDCoMKgwqDCoMKgwqDCoFBSX01PREVfU0VMX0ZFVENILAo+ICvCoMKgwqDCoMKgwqDCoFBS
X01PREVfU0VMX0ZFVENIX0VULAo+IMKgwqDCoMKgwqDCoMKgwqBQU1JfRElTQUJMRUQsCj4gwqB9
Owo+IMKgCj4gQEAgLTQ3LDYgKzQ5LDcgQEAgZW51bSBmYmNfbW9kZSB7Cj4gwqAKPiDCoGJvb2wg
cHNyX2Rpc2FibGVkX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkKTsKPiDCoGJvb2wgc2VsZWN0aXZlX2Zl
dGNoX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCk7Cj4gK2Jvb2wg
ZWFybHlfdHJhbnNwb3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2ZkKTsKPiDCoGJvb2wgcHNyX3dhaXRf
ZW50cnkoaW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dF90Cj4g
Km91dHB1dCk7Cj4gwqBib29sIHBzcl93YWl0X3VwZGF0ZShpbnQgZGVidWdmc19mZCwgZW51bSBw
c3JfbW9kZSBtb2RlLAo+IGlndF9vdXRwdXRfdCAqb3V0cHV0KTsKPiDCoGJvb2wgcHNyX2xvbmdf
d2FpdF91cGRhdGUoaW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwKPiBpZ3Rfb3V0
cHV0X3QgKm91dHB1dCk7Cgo=
