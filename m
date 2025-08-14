Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF25CA0EE4
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 19:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4256F10E8D3;
	Thu, 14 Aug 2025 19:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DREXaUOa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF3010E218
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 19:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755199459; x=1786735459;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PE8Fc2orsm55Rf1zgNP7SXM2Y4et35vY/O3fhuCFuZQ=;
 b=DREXaUOaR49WN4vKqrkFlI4XUd+So/ytOfqKwgEl77k0+PHHdyiskD62
 P9Ss8nPgWwTlNkJRCuK8FbO7g3tqBpY9Y7GDMy3hvxhgldV6XnyZPTtaw
 O6pxCHIg6dLaBTmkykvU5Y8cU3++b9U1FO774wm5n9L3xYx5TAL7R+KI/
 MKuu2B1vbCVnoH5Ad4dwRX7bEXmTJPSa3Ss7AX4KPVPhxmA4IbH1TCgo4
 sXp9xbgni11Q2Fizi2+IpfTBS+M3KW0pI/DM/DJV7MpKg1xCJKmJnNeEr
 xtQdBTwx0zqViTUu8sb8g85hbpQJR5Wh8YD9O7aJf6IpM07rBjsrrcLAV w==;
X-CSE-ConnectionGUID: X4kbnIsvSaKvMxdMoAsZRQ==
X-CSE-MsgGUID: 7iOHYzTeQTOuGMhPyVK1zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61157305"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="61157305"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:24:18 -0700
X-CSE-ConnectionGUID: crO+2otvSBWuvTMlJ0t02Q==
X-CSE-MsgGUID: fetkab4/RAmuwHE8UvYAKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="204015223"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:24:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:24:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 12:24:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:24:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJkXJjhlBOPvc+Yg67XAlPiOUm06HwJnnzJouCogIDNb7rR7nhgb2s4O5EzBnhjZec4a6LdUEBFSeT42CUCMWEDIGzT6kpTUzGiD3tx7bxRVdwsmgCeQDD+TCWZOJRLEmstmgPcw/j/EueAzmwhWbCzR9idYwgPAs/iMh4IJaoAYHfQUMjLnQpViG0oFu50l0e5+UZA/q12s0jGaNX4+HLC+AQMDGwSwa+CRwBKpzJaJamrXLKfsUO2u/MWCAJIieCR6EsavgodiMY58yqhoA/u438cwiYuIfgEmPwhB6a2/ZUhmGZ+/BR6E1mrEztUueXSJH2YvPemqvkfYcuTX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xc6p0xWGtnHD3jo9jDFqUwUyBmelveq60YFAcXnmulY=;
 b=vtNIqUQOLCWzjRIA6A432euMnmEpCt80TRKpjFcDMI9lPkiVX5I/AVL3V2VYDQEKwH3V22ObG9CmhAuf4Yj8fXV8RDaLrLCfaY+5gQtIvLNK0ymEz9iAIPwKbM1eVpfMi+34e2XV6suJKFTzgafq5oNjL2UNnGEfT2/0ihDgsILrvP7HGBcEl1rQ7d8minUvLkMLj6D86t7ZDt9p/fCnT7Kt9tmUE0ma3lByxteR3O3oY6XEPpYTEuEy30zgaiArI4PdfjDn4EU1q29dilCjV8dQN0OuNrZ7A+uebYP0Hy+21IWgr6+Umc4fHsuGkKsHNWTNni1LLhXOxOFy6hcxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS4PPFA92F35354.namprd11.prod.outlook.com (2603:10b6:f:fc02::44)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 19:24:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 19:24:15 +0000
Date: Thu, 14 Aug 2025 12:24:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to
 preemptable spin init
Message-ID: <aJ432wBs0B9fhINb@lstrano-desk.jf.intel.com>
References: <20250814185009.52614-2-jonathan.cavitt@intel.com>
 <aJ4zZki709mmqtbV@lstrano-desk.jf.intel.com>
 <CH0PR11MB544476B570A9C0B2BB2CECA4E535A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB544476B570A9C0B2BB2CECA4E535A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS4PPFA92F35354:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3f0af1-fd18-4cba-e610-08dddb6827f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk5PYlU2bk85Z1VraWRuWFhKNTFVQlI0VFJKNzlUZWxIYUVsOWZSejErMGQv?=
 =?utf-8?B?T3A5UXhxendQM2V3YVRJQ3hHajJVVHNMVXNhbnZwc2huV2xLa1ZjUkhWTVU2?=
 =?utf-8?B?ejhQYnpEd0tpenJjYUlKbVFXY0pqMlVrYzR0QmhqNHc0cGpUcnRMQ1dTM3RT?=
 =?utf-8?B?SFF0MGlYTzNNMG5TVnc4VHQ2SkplUDhNYjBtbWhGM2lLRDJlMkpqM0sxU1hw?=
 =?utf-8?B?MGNPOGVteThUcFQvbXgvRExJMkE2WUVhZVhOdHZqWmNCTUhxVFpxbkRZd0Vo?=
 =?utf-8?B?SUovakxacGJWdS9ZWlJjdlUyeldac1JZOW51WWtMeVJ6WnhmMHg3YzBIYXJY?=
 =?utf-8?B?cnFjOCtuT1kyNFZhWHZYcGgrR2NiVjBCaG91MU85VlFkVlJXcjBwUGppK09k?=
 =?utf-8?B?S245Tkc1TUNQdDVKZjRNZXhDYlJXMW5TLzJCRFIrVGN1aXJkNjRmUzV5bkts?=
 =?utf-8?B?aEc2d1hJRFIxL1dzU2taVm1Id3FDVDhCUmI4RmU1OWJ5aDE4cHFzUlhDRXZS?=
 =?utf-8?B?RmozYkpXT3FzencwemxGODZRdkNZVGxDWkxUOEJYUUZUMHVvQ3FJdEEwb0J5?=
 =?utf-8?B?SGpYRVh4S2pKSVpnUlpOQ1B1Y2tybE96amYxWDcvYXR4RUZXUzIyN3hYYWpp?=
 =?utf-8?B?Z0pkMnNTQmozQlF1alhic3o3VnJNYWVmVWVQeHZ4NXM3REtaU3ZSRm1GTFVU?=
 =?utf-8?B?ZFVzNFk2dGlNbUgwOW0vamltb0FYYndtaVZNaDZrRWl0eWgvMUJ2T0dQTTI5?=
 =?utf-8?B?cGtSak5sYjFCVG1MN3FuLzVwU1Fpb2ZUOVBGS2RCY3l2cm1ZTEdpbllKYkc5?=
 =?utf-8?B?Q2t0UHRzWFhhdk5oVGFCeUw0L1pPQlJyanhwdlpJQ1lUeWM0VnU0SmZVVTRY?=
 =?utf-8?B?UUJVUVlnQUlpNENlL0ZZdzg4YmdRVnFWMldoRUhzbzRXcmcrWTNjU0Q4WXcw?=
 =?utf-8?B?aDE4djBQQ0RWUUpRYVdyNlk5czU1bzNWV0FxemE2Tk1aRENUS25lWW5rQWhQ?=
 =?utf-8?B?UzA5NEpjek96d1lEbzdxMVdDdnE4alVleWp1MkU5YTZxaDRZT213OW0veWRE?=
 =?utf-8?B?eE1WOTdITzVOdEV5Tlhtc2xzSExHYlhPY2pHN2NtZ2VGOWtzV2RSRHFvOU0w?=
 =?utf-8?B?aXFZWktqVjd6VGgvZk9uM3UrbjJBWWt2QkpQY2UxbWwwamhhckRBTXUwWHc3?=
 =?utf-8?B?UzdjaGFpVTdNb1lCQ21PSDU1SGJCa1hsdGFMaHN0Y2dQRnptS3N6cmcxQ2Fv?=
 =?utf-8?B?SEdWcWJCa2lSdXUxc3Q1VXo4RCtxK2tYc21idWhZYStPUmN1Rlc3eDFyeXo5?=
 =?utf-8?B?R0hVL2djdkZGUXNNd2ZKeVc5OUtydVRsYjg5cUR2eTdXTDIraXhyTWhOeUdO?=
 =?utf-8?B?STI2ME5qQUZjNVlSZjlEQ0ZXRkxBOWRxNkQyQm0reXdvYndseDRzenZnUUdz?=
 =?utf-8?B?SlR5NWxZRlQ5VEhXR3NqZHMvL3NpZ01OVE5ldWNYUmQ3WUk1LzluSCtiditv?=
 =?utf-8?B?YUpFWVV2WURPRk1sdERlWURzUnA4RWFJY0I2SENLV3dGcVdDU1d2K28wNEV5?=
 =?utf-8?B?SmdsU0FaNjBxRWJ3THMyV1NIV0UrNlNUQ0hRbHhGS214RWpWVzRrM2lQUVpY?=
 =?utf-8?B?eVRMYjdSZ3ZpSGttbzJybmZteDdqcHBlQ3ZObVlnVWJOOTR2UTFJNTF6NmRk?=
 =?utf-8?B?dXFyQndjYWFJc1RkTCtLSzhPUjlncUJxaDV6WnZESU4rQU81cU0wM1JFQUIr?=
 =?utf-8?B?WTBKNjgyQit0TDlQZlRrZHc1KytMdGppUGU1V1FZclpYdVZ6RVVEMHZkNThw?=
 =?utf-8?B?RkVCMU4xcUhjY3ZCV0l3K0hOTUpYT2dZV1BBV1pVUklBZE5laW1kR1NVMGdB?=
 =?utf-8?Q?5Et640uo9T//z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1E5WU0yRkVSK2FWcHo4T3ZLdGxvV0k1TjRiVHlBU0hUZGJ6bmVQanVFOUNp?=
 =?utf-8?B?S1ExbExjdVBwUEI3anJYU2pZZjFCTitNUGpqL3RyTmVNZlZBSjJhdW1zc29w?=
 =?utf-8?B?UXV0YnVIbjJackZpcHhRU3BPV3pzb0JwQy8xcTloYlV3V2JtMHJTNnFOK0Z6?=
 =?utf-8?B?Y1BBejhQZm12SFpkVGl1KzR6YkE3cTZDNWk4amp2THRlZm1meHhIdGNnUHFj?=
 =?utf-8?B?QjRIcVZrV0ViVGpWTGRsaW4vdExKNlFNME83Vk54OVpBQzg4OE1wUFJvR0JO?=
 =?utf-8?B?SmYzM0duWHpSb0Nib0NkZXc1eWpmVVNrckwxTy81QnB2SUVzMkZyMjRsenV5?=
 =?utf-8?B?KzZORURlVXExL1ArWUJxWmFLZ2lpZVVnbmh5aUc1TUs2TiswV0FKeDU3V0Q2?=
 =?utf-8?B?eHZZMGo3RTB6aEZ3QWFONWVmLzFsY2VWeVZHQXBWdjFZQldyUXJ3cktNMmh3?=
 =?utf-8?B?K0xkZjhmSkY5RzdYTXhZOE1PbStBdEVRdjFSVnhWMS9GN05QWlE5OENXUFdx?=
 =?utf-8?B?MldSOVJGc2VSOFVKL3JROTZOcUF6SlNZMzlFbEpyUjZRSGlKRGJnUWhsemZq?=
 =?utf-8?B?MlRTMlVWSWRPUjU1VGo3VUgwZlFQMER4UndHb2Rhc3Q0ejF5V1l0SmhMaUV0?=
 =?utf-8?B?YWh2SXFmVktXSSsrL2FyQk1vSmVKSkJNQUk3cnU4NjllalJIQlFPSkpPTVRG?=
 =?utf-8?B?TUJwRUh5K08reHJ6SmZsTlRYMUl2ajNibzNURlEyVnJ6Mk5vNlE4Rm5lTUtJ?=
 =?utf-8?B?STdxRjMvMG05cTJLRnUzN3YwK0VKSXI0MGxVK0l3NmEvZFZEdHViemo2MEFS?=
 =?utf-8?B?NkNjVGdEVDBqSHFHTFB3cjc0Mk9aZUdhOWwxQXNkVlpLN2RQREhpdi9temJ1?=
 =?utf-8?B?S3hwNEJXLzVZaFVXVGNSUTd5ZTY1eE5NTGVWQU0yOTNISEZLaElhMXZBSVNr?=
 =?utf-8?B?ZHFsbVdKUWQxb3pHRCs2SVNuOCtreDl2c1grbG5FVTU4OG5uRE9BejZxN2RU?=
 =?utf-8?B?MmttdXFjMmZwWDQ2eWJHV0FncFNPMUlUa05QZnphNndvaERETXpidWRwamRs?=
 =?utf-8?B?dExvckJRR1pHeE5IV0JEajBReE94M1dibnA0VXpoY3UyRllkaUM4eU90NEhy?=
 =?utf-8?B?NmJDRkdPa1E5UGFRT3JtY09BMjZjVmJFQ05mZzBHVnVvdk5aaHNPU2xGMFJB?=
 =?utf-8?B?N2N5cU1KaDZrOGFsMCs0R092cVBFSDBwZkJtaWRNazhZL24rNnZnQVNLTnNL?=
 =?utf-8?B?SFlnK1RVMjdqZmVCNFl1azdrcVNxVGxkN0tGaEt4YkU2SXdIUnFIYUdWUHNK?=
 =?utf-8?B?L0g3ZXRNaGx2cko3QlJZcjJRWldTcndhTTQyVXU0eTZtNWtzWUgwb1hDci8w?=
 =?utf-8?B?SWlSWjVGeU14M3VKb0c3anR3blZqVSsycm53TkJCWlNzdzNZTmM2QVhkUHll?=
 =?utf-8?B?QUxEZ0hkNWVuRmEySm8yZmVxcWN0cWwzaDNnY3hlOElXUSs5VjcwTzRwZDBt?=
 =?utf-8?B?SHZnWlA3eHBKMER5RmVORTNHM01XVjY4OVJvcXlPY2g0UlkyMFhMNERTM1ZG?=
 =?utf-8?B?dEgzMDVQODZlNXQrWkVwVVBmVmRhS3JxVDdBNk0ySk5NUEtPTkFvNmQ0S2Vy?=
 =?utf-8?B?TWw0SVIvTVZtSFA2THFKQTMvMUdOTEt5Z3hwRmJXWFpBQk9zYnU0aHVmTk54?=
 =?utf-8?B?ME1JRG00bzBRbG0yWXNvRFVuYmhuRWZ6VXdOWERMT0dLMExkc0tza3AxSi9t?=
 =?utf-8?B?UlpCQ25ZR3R1bUQ2b3dMbHhOL0UwSVczTitnNjN2d01hUzlmRUlSWHFmelpi?=
 =?utf-8?B?L1RTYkxUdy9xcytmRWNBTTBQNjBHVDBPZWE4WEk0VE1zOFVFZXA1d29abkJL?=
 =?utf-8?B?SnVBYjZ6aytWbStwTm03ZnhVR3hWNUFDSmVpZG5ZY0R2NCszdys3N0k2TVB1?=
 =?utf-8?B?MzFwZXJHbDMzc2diYnl0clRHelQ5SCtkNXpaT0Y0RDlVMjFuOEJvQWdCSEdz?=
 =?utf-8?B?UDcydEVIVkt3ODVVbWJXYTNhbDlZVFBkdDNsRmhncGpPVEdlTHdhcmhRYVNQ?=
 =?utf-8?B?MVgreWIwa0JHeldtUGlKZm1uYTdlc1l5b2I4eDR4b2t5S0pxYnJhRm4reGZr?=
 =?utf-8?B?Y0QybGIwNlR2Mzl4dytTOURXNzFLQk5aeURXUnBLeWFRdVNPMWh0cXFTeGZk?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3f0af1-fd18-4cba-e610-08dddb6827f2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 19:24:15.3039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQ5KmYqjqeBtK1lg0UScx5S+PvC0BOLgPxw3i3pmgIYBlse026XBvolpUwbL+ND8wWKfKS5beksO2leKADSCmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA92F35354
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

On Thu, Aug 14, 2025 at 01:11:39PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com> 
> Sent: Thursday, August 14, 2025 12:05 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Subject: Re: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to preemptable spin init
> > 
> > On Thu, Aug 14, 2025 at 06:50:10PM +0000, Jonathan Cavitt wrote:
> > > Add an additional MI_ARB_CHECK to the spin initialization function,
> > > just before the conditional batch buffer end, when preemption is
> > > enabled.  The MI_ARB_CHECK forces a preemption in this case, which can
> > > allow additionally scheduled exec queues to make independent progress
> > > earlier than if we relied on the automatic timeout of the exec queue.
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5783
> > > Suggested-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >  lib/xe/xe_spin.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> > > index 25f7555e27..b3a937fe80 100644
> > > --- a/lib/xe/xe_spin.c
> > > +++ b/lib/xe/xe_spin.c
> > > @@ -30,7 +30,6 @@
> > >  
> > >  enum { START_TS, NOW_TS };
> > >  
> > > -
> > >  uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
> > >  {
> > >  	uint32_t ticks = xe_nsec_to_ticks(fd, gt_id, nsec);
> > > @@ -167,6 +166,9 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
> > >  				   opts->mem_copy->dst->mocs_index;
> > >  	}
> > >  
> > > +	if (opts->preempt)
> > > +		spin->batch[b++] = MI_ARB_CHECK;
> > 
> > But we already have one these at the top of the loop:
> > 
> >  72         loop_addr = opts->addr + b * sizeof(uint32_t);
> >  73
> >  74         spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> >  75         spin->batch[b++] = start_addr;
> >  76         spin->batch[b++] = start_addr >> 32;
> >  77         spin->batch[b++] = 0xc0ffee;
> >  78
> >  79         if (opts->preempt)
> >  80                 spin->batch[b++] = MI_ARB_CHECK;
> > 
> > Line 74 is here the ring loop restarts.
> 
> I tried removing the top MI_ARB_CHECK, but that caused the test to start
> failing again, so it looks like both MI_ARB_CHECK calls are necessary.
> -Jonathan Cavitt

It shouldn’t be, though. A couple of instructions later we should jump
to loop_addr (that is line 73 ring instruction) and then execute the
MI_ARB_CHECK programmed in the ring at line 80.

I’m all for fixing the tests, but I want to understand what’s going on
here.

Can you reliably reproduce this issue and confirm that it fails before
this change and works after?

Matt

> 
> > 
> > Matt
> > 
> > > +
> > >  	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
> > >  	spin->batch[b++] = 0;
> > >  	spin->batch[b++] = end_addr;
> > > -- 
> > > 2.43.0
> > > 
> > 
