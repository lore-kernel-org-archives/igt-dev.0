Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3F4CCD187
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 22:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9068610E28D;
	Fri, 10 Oct 2025 22:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvPCIQUn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E8710E28D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 22:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760135051; x=1791671051;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pLaRxDLMSGmQAednMyZmsroZJlnjosuIPyLzZtzTXhA=;
 b=cvPCIQUnuIKbVy/bupd/9DA0LQSIIRbYqTWjvfC7kxoSeT3ZYgW6qMQJ
 Ds64PGnt8PVQsdDRhGdfJ0wHSpoBr51yGMf2sPlU0gFnvhJ0Uyigx7AHK
 DnfXGj1oVh9u6dGvrXI3tJdGJjaXJp4YX3fGr9LfCUio23skKF2XaVXii
 aqA4TkMZEcBxpoOod2Re4CGzcHn0sp7TDO2FJHJWIJGw8ktbuNMPhwJFo
 Bid0cFzDo9yCDmBQEwn4mD96KnDxxrGNhsJnJWgG4SxXNsS2ZtmOt7cUr
 q6mLMpskzCdBUoOvaqm2CZl9okrvRfVYwhlxzlxRa16xndxBJSqI5TSk/ Q==;
X-CSE-ConnectionGUID: NhGLdiBbQa2k1ltCa6d8Qg==
X-CSE-MsgGUID: fXrp5iw3Ta+Mqnn5BF4BiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62242289"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="62242289"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:24:11 -0700
X-CSE-ConnectionGUID: rBQDts35RZW1rgUnY3Z4oQ==
X-CSE-MsgGUID: YOu9acI7SESaXAx8W9IrFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="212032354"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:24:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:24:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 15:24:09 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:24:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTxGhIxfYYmc6GusRb7J1xoSl328R1EB4Vzk5/a54BXKJ0jJ0I8+QaoaU6BuGao6ATVzdmvJB8uOm6Xx6L7jLx9UPnXDdFap/7tBPGE6KYcut6DDNlw7a9G0u1nZ5lP3KNHltQUf69XKG2y3YKQNAB9YkXRWxO17aOOW7EFbZ5QpcUuhz3CJhwHut/sFmIfRke7Rxkr4PWXXz67f3AJdP5TnipMdy4WUFCG2TZIP8pSbC5s5iYwM+zT5TG4PLSPFENafvQsHf+PQvMUus07psIsF7NkgLad2BqsUatb5GUsJ3J7WgXPPCFeRh46eERP+/XG8Z2Y2QrzTQDA2PMqQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QonGQB+LkRVk+sqL5NzOgikOdL2xV4VMmwnn+awda0o=;
 b=E2uO+jZ8vs3PyxdnjirDAH0mzft7UfLZlKFlghG/2LBa46TeatU4Y3V7FPJfprXm0+q1edst9xWKAvaHYiAK0F/e6EA6nLYmF4kTA2mJoo1fumxPB3orGJEWppYby4e5jyDH5O1APnn4JNQWTct48jpwqKf7iTu1RAO4kY8dj0Eaa+8QVNOJSEJgZ2f5OLTuJxtzv3tpCcrdvI25HwgJkSn+kwJj668rhMRciHNiY8oW7Ka3d+MlFSuGOxOJJ2E9fZOb9rjtmUZqFcO7zWOESD1ytfNRWpECf2YrrYgKAs+g21ajPGpLTkvtC2ktgxAGXAR4XpVuTqxDRHYYsPJHNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:24:07 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 22:24:07 +0000
Date: Fri, 10 Oct 2025 15:24:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 08/18] tests/intel/xe_oa: Convert several more
 tests to take OA unit arguments
Message-ID: <aOmHhXzfw4syethG@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-9-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-9-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: e52bf480-6613-4527-1cee-08de084bba54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0FFTThxdk5ZZFJBbGNpS2JDQnJLZkdiUGdXdURJOGp1MWZxL016YisvcURv?=
 =?utf-8?B?N2tVTVlYTzQycU9VaVl3VWxDUDRlTmJSOVRDbG5YZHdiZVdDK2R0djRpaFRD?=
 =?utf-8?B?ZHY2T3NWemxIYlRnWTVPYmNlVjNSY2lYQm1GTnIwaTJBSHB1QVBwTWk5L1ZO?=
 =?utf-8?B?SFJtcTN4dS9WcGlBTlA4bC96d3dhMmVyVUM4M3FsZVJPeC9wRTIzWFBMdGd5?=
 =?utf-8?B?dVVxRUJvaW1yb1JkcVBEekV0NGxmVm1rdUlDemdZQjZIT3VRU1k4WXQ4ZFAy?=
 =?utf-8?B?VUlrOU04SHVVdENLdGgrV0VOc1hsYzFsd3Q5OWxWUTVyMFNrcmxuTTMxUFpn?=
 =?utf-8?B?emp4c0FORTl4V0FrMit4Uyt0SmNiZzdkSExmcW12dE81SlRTSlhuVUo1RDZX?=
 =?utf-8?B?czZ3d0pSbWdLTm1nMmZYQ0R6SW9QQ3NJRm5BcnNTSmM0YjN5NjJmSkxOR0xO?=
 =?utf-8?B?c2ttSnpJeGExU1pSVFlZZTgxUVgxTldVOGM1Wnhwb1dBT3htY2JkNTBtZzNx?=
 =?utf-8?B?cHh2L2JPTXV4UWpoZE1EbnhGa1RRNmZNZkhmS0hQNzM3N1hMSzA4d3ByUlNV?=
 =?utf-8?B?NXZhRmdmVVViSk5UWElPMERub2dSSy90OTkzcHJHd0dVb05FUUxldHVTVVBk?=
 =?utf-8?B?ZkNMamRlamVGdUJDeG4vaFNNSUI3cXZtN1RIcjFRRDF4d2JuK1QwMVFZclYr?=
 =?utf-8?B?UVNTNUN5ZmpzMTdhakltUFRha0ZualpUYW43aE5GZXN5bjFIU2JkTXBVNWNv?=
 =?utf-8?B?bENJSzg2TzByYXpsR3ZjZkZ2aTFxbTBNaWs4dkJxVFRuSkc3ZTdGUjVUdHl0?=
 =?utf-8?B?cmJFME1NSGxKU3BLQnpoQ05ZVGdlRmUvTDRONmhaTmxrMjd4TXQ4bzNYYTRn?=
 =?utf-8?B?MkVrL3N0c01DUi8vWEx4MjBEZUJnT29RSkI0b01iWmdOd2xrTlp6VUkwSnJq?=
 =?utf-8?B?MWtYL3p1bXEwc3RCSjRZcTUzUE9WakFmcy9RWTczeVZ0czBsOURDTGZ4YUxS?=
 =?utf-8?B?OE5tY2JGV0MxdktBc3B1aVc1bXFuTTJmbFNjQ05sMFJSSjIraVNjQk1rRnZQ?=
 =?utf-8?B?Z1V3QTJ3dXE2dWN5ZTZEOHNtSEw3M3V2cnVvczRqMmhhNS92b2pJcWYvMVVZ?=
 =?utf-8?B?NzNzVlRNMWhrcXlkQS9GT1JQcGVNUXd4bzZISC80aXR5RUlIZHN0TUV4dUVj?=
 =?utf-8?B?OVg2c0NPTjBORnR4RytNT2R2R2Q3dHNRdnVEVHBpamJiTHFheTJGK0hRYlBj?=
 =?utf-8?B?Nlh6V21yeXE2SHBXSlB4bUU4OE4rN0ZBODJHcmxscGZnb2VFdEl4ZXh4SzdU?=
 =?utf-8?B?Z21tRFEyQk9mNUFMSnZDSXBwejNvTUxDNmp1N2s4c1BvWnRNTG12TXR4c0Nn?=
 =?utf-8?B?LzYxaU9nUXZxSTlrMm5FeURRbVAyQ0gyajIwR2dYWGtjK3VzR0F0emhBQXVz?=
 =?utf-8?B?T1NzNFFKQUhpU1JzempmeTZmR0h0MklFN29Xd1QzR3JJSWRQNGxVTnRWRHNP?=
 =?utf-8?B?dVltVTdCVHAyZnl5RTR5NHE0cXgyQTJiOUlCWUErdVl1a1dMck5JSGxVQm82?=
 =?utf-8?B?aXVmR2lDSXVWMTRlR2N4cmhJVmtUakRiRjBTditOVjdmK2h6VTdzRnlwVnRa?=
 =?utf-8?B?c043QXpvNmVRUWFvZENhWWVuZSt0V3k2Zm1tNEE0a3l1VzBtc0tVQVg1ZUJq?=
 =?utf-8?B?WmlYWW5JaEdYVHpWSHJBalB5S09jVnp0czMyYUJyRW1tUEY3eEIwT0d3Rkww?=
 =?utf-8?B?dytha25DbTJhTU9DalV2c3kzUW5qZytOcGVYMmhhbUFmK2ZxVVQ4YTRteGdM?=
 =?utf-8?B?Y2p1aXpFS0lxcG5EVlkxQlFSS2hsV0pwNDVHSmMzV1g2K1hzT0pwbDQ4b1Mz?=
 =?utf-8?B?NXVneG50L2dnK1JJeFQ1MFMzNk84K0x4cG9nWEpUQXVqNVlIaElNWUY3ejM3?=
 =?utf-8?Q?MN6hzWXsdMGHPscbwRxuVtowcLB2cfqy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXhVRmY4NEJ5TVoySDY1TDVUbHJPL1I5eHBzSHlqVE1lM2lUa0NCbjMyRm9s?=
 =?utf-8?B?YWdUbGtCVEo1Rlp6eFNtM1Y0K2VhT2tyNzNFbU85RUp5c2IyM215MStyZkNX?=
 =?utf-8?B?YURuR01WU21KRkRHRGtrbHhLZSs4cU1RZ09EekVWNDFKcnpia3kySEFJcTJT?=
 =?utf-8?B?U0FwZEcwbGR5UDJ4RTZ6WEFRQnFvTXdQSWwzcEtRQURDem1sWEZwK1cydWtC?=
 =?utf-8?B?QkY1Nms5VStvUyszN3I1eXAvN0xEemxSc21yU2JaeHZuTmRzdlFIUi9TZ3pS?=
 =?utf-8?B?Q2ZNYjRxTTdrMnZnN0ROTVpkeDhiMUlTakpTVFUwMEk1NHhudzRSSjNkdTl3?=
 =?utf-8?B?ZGpxc1JMdUFoRGxqTGNHUGVlaWhndUZQU1Vjdy80WTVuRmdla2xDeWFjd3Rz?=
 =?utf-8?B?WTJldkU1R2Y2UWpJUWErY0ltbUhhVmlOTm92UlkveDE4SUNKYzN6UUR4S05F?=
 =?utf-8?B?TnNRNkwzdkwrV3AvUkdMTkxjWGNJZUdKUzBJd2hIdVVnRVVqSHZxVWEyYk9r?=
 =?utf-8?B?QjJZY0ZNM1NGUWpzaXR4bVZIZWZoaksyUE0xYkxyanpLKzlWVXFiNXZnYTRY?=
 =?utf-8?B?Yk9XSkIwaVZDRzBuU0x0cG5BbmY1SlRmOUVGRFdDWTIrQzZDcUZzY2hJVSt1?=
 =?utf-8?B?S0R6aDhTUTFLU2VkYnV5Y3JadFFzZnoyUUtxd0p1U0EzbHNvTHVJc0ZGU3ph?=
 =?utf-8?B?VlE2MG5USktnNDhFTGNwYlVsdU5NbjFZKy9rcE5xOUVGaWNBTXg3U0tyTDBP?=
 =?utf-8?B?cmRmcUNXdjNPK2NINVJZU0krUEErOVpUbXBJZUdodnVBQ2V3cys1dDRrMU5i?=
 =?utf-8?B?dXEwbEc4eWpIdy9VaGRWYUIzaUtPTXN2eWtkaEtLa3Q4ckg0dCs1ZFNCUWht?=
 =?utf-8?B?OHpORlBTNG5JZ0tJaVlUZWZsSVNBUkloZmE3TEQvUTNiVDAzTEtGWk56Q3hx?=
 =?utf-8?B?V1QxTXFYMXR4cndVUGlkNnlQQUVZYU9WdzYvMTkzaUxHL1VTRUlPa2JmY3N3?=
 =?utf-8?B?ZTc2NHkwVFhVTS9jRE1WczFtRXNoMlJUU2pXUi9YZkhac0EzRGl1TXhOUGZy?=
 =?utf-8?B?NVVhQTBuMC81d1VBRVhkSFdFZlhSS1J2UnIxcXlvN1ZNWXpqb3RzMFJFcTlQ?=
 =?utf-8?B?YWZVMmJLaXdaWFlzS1dtdVVJeUZPd3FOeUdjcHlrbjlqeWxhR0kvTi9DODZ6?=
 =?utf-8?B?SUtydS9CWUhBd3BvQkZndUhJZFl4SFR3clJDcW9ZeTVQRWo5Z1d2NWFWNDVa?=
 =?utf-8?B?NDFqTno0SVRoM0QvZUo4NkVBc2xTN3lNNitoUDNSUXpWSlFzSytZZzBVTU9n?=
 =?utf-8?B?VGk5dWxpeStlVzE5WUZoOVZ1V1gyZHNZR3ZpdG9lbEZJUVppYlN1QWpsMGYv?=
 =?utf-8?B?RmowdTZ2OEtaeG1TUnlEaHlkbTYwcFZSWlR6MWZsME5keHlndmtrRW9OdkY0?=
 =?utf-8?B?ZEJiNGYxOCtmbkpVcU9mSFZONWFUejl3ZmVITGVlT1VpQUljVU9UWGJaa1Fo?=
 =?utf-8?B?bHo2bVVkdGN3RDBIVlNCSy9JdjVGY05vcWJGUnBMbVRLeEZvc240YkwydnRP?=
 =?utf-8?B?M1RZOUVRL2FUblNLVTZURDQwR2thMExIcDdBNnh2SmZjOXRMbFpNSFFVd0lS?=
 =?utf-8?B?Y2tjSFI1TFdjUGJXbXE1UmJMMnFsMUZEWEMwSmRoTmsrTnNYenVsZzNrT2pn?=
 =?utf-8?B?bzJSaUxyVzE1Yi8rdS9SWU9MR1VCcThhUHQrbGVPdWZwTVRsaXB5TGY4MzVl?=
 =?utf-8?B?L0ROTzVXL1dPREJIbzVBbXkzQWNYeTFVbHI0YmN1WndlU1NlelN4eE83OFhj?=
 =?utf-8?B?SHRTVnB1MVovL1BJTnJPc1JVTmNXUHJaOGw5U2taa1JtMzNYcnBDOFA5TmhC?=
 =?utf-8?B?cGwwQWN3UmYxUFlJdVNvWGYvNURDcWlDd1VEa2h0c3J1c1VBMXU3MmFDUjNu?=
 =?utf-8?B?NXNCQUpFbnA5aEhxbERmemNhTm5PVFhKd3FWZXhud3hFTGxCbUM2cldDUC84?=
 =?utf-8?B?TXV4MEE3MEZ1V0l1ZnVqa1did0FLNWlpdlJ2ZUdEOFpjSDlYUGhhNnFaakZj?=
 =?utf-8?B?MXNHd28wVHRhVnlaUHlnN0NwUXpxWG9VV1VKMjR5UFdsYUh6cFBMSVY4K1d6?=
 =?utf-8?B?dHJpZWRmMTJkNm9KOGJPdGtocjA1eUpldENOVnN0QVJ0aFdwbk5WenhBL1Er?=
 =?utf-8?Q?rGC1a4vhLOe1svsBaM0FYno=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e52bf480-6613-4527-1cee-08de084bba54
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:24:07.6346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qncE/XXniHR2qnVfGlvLeuFEasHVG2rz+yom1Y5XztM4DEDxTizTxiXIcQi7E2al8WXgMuqBj+v6Y+sB4xjMWnnyUtJVR7BJGB8yVm4VPzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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

On Wed, Oct 08, 2025 at 02:17:55PM -0700, Ashutosh Dixit wrote:
>Convert the following tests to take 'struct drm_xe_oa_unit *'
>arguments (instead of hwe), to enable these to be run on all OA units:
>
>- test_oa_exponents
>- test_buffer_fill
>- test_enable_disable
>- test_oa_tlb_invalidate
>- test_stress_open_close
>- test_tail_address_wrap
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>---
> tests/intel/xe_oa.c | 60 ++++++++++++++++++++++-----------------------
> 1 file changed, 30 insertions(+), 30 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index af01a79d38..ac15da09a3 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -1896,9 +1896,9 @@ static bool expected_report_timing_delta(uint32_t delta, uint32_t expected_delta
>  * SUBTEST: oa-exponents
>  * Description: Test that oa exponent values behave as expected
>  */
>-static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
>+static void test_oa_exponents(struct drm_xe_oa_unit *oau)
> {
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	uint64_t fmt = test_set->perf_oa_format;
>
> 	load_helper_init();
>@@ -1910,7 +1910,7 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
> 	 */
> 	for (int exponent = min_oa_exponent; exponent < max_oa_exponent; exponent++) {
> 		uint64_t properties[] = {
>-			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>
> 			/* Include OA reports in samples */
> 			DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>@@ -2526,11 +2526,11 @@ num_valid_reports_captured(struct intel_xe_oa_open_prop *param,
>  * Description: Open OA stream twice to verify OA TLB invalidation
>  */
> static void
>-test_oa_tlb_invalidate(const struct drm_xe_engine_class_instance *hwe)
>+test_oa_tlb_invalidate(struct drm_xe_oa_unit *oau)
> {
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>@@ -2584,15 +2584,15 @@ wait_for_oa_buffer_overflow(int fd, int poll_period_us)
>  * Description: Test filling and overflow of OA buffer
>  */
> static void
>-test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
>+test_buffer_fill(struct drm_xe_oa_unit *oau)
> {
> 	/* ~5 micro second period */
> 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
> 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	uint64_t fmt = test_set->perf_oa_format;
> 	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>
> 		/* Include OA reports in samples */
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>@@ -2724,13 +2724,13 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
>  * Description: Test that OA stream enable/disable works as expected
>  */
> static void
>-test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
>+test_enable_disable(struct drm_xe_oa_unit *oau)
> {
> 	uint32_t num_reports = 5;
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	uint64_t fmt = test_set->perf_oa_format;
> 	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>@@ -3505,16 +3505,16 @@ test_rc6_disable(void)
>  * Description: Open/close OA streams in a tight loop
>  */
> static void
>-test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
>+test_stress_open_close(struct drm_xe_oa_unit *oau)
> {
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>
> 	load_helper_init();
> 	load_helper_run(HIGH);
>
> 	igt_until_timeout(2) {
> 		uint64_t properties[] = {
>-			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>
> 			/* XXX: even without periodic sampling we have to
> 			 * specify at least one sample layout property...
>@@ -4613,14 +4613,14 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
>  * has zeroes in it.
>  */
> static void
>-test_tail_address_wrap(const struct drm_xe_engine_class_instance *hwe, size_t oa_buffer_size)
>+test_tail_address_wrap(struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
> {
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	u64 exponent = max_oa_exponent_for_period_lte(20000);
> 	u64 buffer_size = oa_buffer_size ?: buffer_fill_size;
> 	u64 fmt = test_set->perf_oa_format;
> 	u64 properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>@@ -5114,13 +5114,13 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		test_invalid_oa_exponent();
>
> 	igt_subtest_with_dynamic("oa-exponents")
>-		__for_one_hwe_in_oag(hwe)
>-			test_oa_exponents(hwe);
>+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+			test_oa_exponents(oau);
>
> 	igt_subtest_with_dynamic("buffer-fill") {
> 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>-		__for_one_hwe_in_oag(hwe)
>-			test_buffer_fill(hwe);
>+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+			test_buffer_fill(oau);
> 	}
>
> 	/**
>@@ -5148,8 +5148,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		test_non_sampling_read_error();
>
> 	igt_subtest_with_dynamic("enable-disable")
>-		__for_one_hwe_in_oag(hwe)
>-			test_enable_disable(hwe);
>+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+			test_enable_disable(oau);
>
> 	igt_subtest_with_dynamic("blocking") {
> 		igt_require(!igt_run_in_simulation());
>@@ -5183,8 +5183,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		igt_subtest_with_dynamic("oa-tlb-invalidate") {
> 			igt_require(intel_graphics_ver(devid) <= IP_VER(12, 70) &&
> 				    intel_graphics_ver(devid) != IP_VER(12, 60));
>-			__for_one_hwe_in_oag(hwe)
>-				test_oa_tlb_invalidate(hwe);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				test_oa_tlb_invalidate(oau);
> 		}
>
> 		igt_subtest_with_dynamic("unprivileged-single-ctx-counters") {
>@@ -5213,8 +5213,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 	}
>
> 	igt_subtest_with_dynamic("stress-open-close") {
>-		__for_one_hwe_in_oag(hwe)
>-			test_stress_open_close(hwe);
>+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+			test_stress_open_close(oau);
> 	}
>
> 	igt_subtest("invalid-create-userspace-config")
>@@ -5259,8 +5259,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		long k = random() % num_buf_sizes;
>
> 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>-		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
>-			test_tail_address_wrap(hwe, buf_sizes[k].size);
>+		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
>+			test_tail_address_wrap(oau, buf_sizes[k].size);
> 	}
>
> 	igt_subtest_group {
>-- 
>2.48.1
>
