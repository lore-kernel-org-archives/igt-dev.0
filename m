Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD42D41D4D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 14:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB7F10E2E7;
	Thu, 11 Dec 2025 14:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6gOSISO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319BE10E2E7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765464970; x=1797000970;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jCARbbIedpwJbfI2dYFTmovN7aVZlby3OArWehDpN5Q=;
 b=S6gOSISON7Jf1tgACT2J0nIMGQNs6zjrp80KaNo1DFbizZxNJP/6aRaG
 VTgASBauz4CgJemUa9vqy/7WN1+8JAPPtSZW4MdRTW1eouAZISOLtTzyt
 Q7Cce+oPa6fwR9uHfC9RHbbR0GUOV04PPBTdtGKWRycY1JvCuQoDFJ51i
 EVTkOaCPqSK2E6njlyBunVMeEc7iXYE+00ppjVC6YN8vuAoqzNqyGGsU4
 iQhj69ejRK+I+pCp/jfyJgARhBqv/vjRslH6Y5Ctepwsalr5dLX5Cr/gq
 9Ahm5wAcrmKEhzcaiWoGVACEjNPBcGQCbD+hkOAtbT51Pz6NyhyejPoRM g==;
X-CSE-ConnectionGUID: tgHItGgPRViXTI1m+yvwbQ==
X-CSE-MsgGUID: 8wHYLw3yQIC0egdz1ZN1OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="90094897"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="90094897"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 06:56:10 -0800
X-CSE-ConnectionGUID: eW8icUR9Skq7xsOls2OYPA==
X-CSE-MsgGUID: 0VVR3RgFSwSp1/LO/5YJ1Q==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 06:56:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 06:56:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 06:56:09 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 06:56:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYZSMnD/GaIjUHzdegjIuAmrsAvwjHadEoSM9eKzOtKiSCqNcNH1NCxbW6ZzAutYsYcumg0k93WoGiE3Y0wSzKYN+65YWV/+zkSLuk8Grkh7IPhzevY9f3rUq/XjKego7/tPBhYslzyDr4qTDlzbZP2zOEmXQ7qOmvqsXKEVUNjDvXSTci6zIe4ZdcBiJHooYvgW4/uJCHgUAeAYlND6zTu/Cf0NHrhpzG9rGbtqNn6YA3cDIIf7MWPVohCcYJcK+bmQywgvgczcb4lMIkTbjLzd0HZSjl3AhwPuO1N19lEp74UFjaPpIPZIAsQeo30bKAh/PsBSkAr1FalphFP4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZFcMtIA4UtJ97mBpG3KrYIAPZvSZXvlySKLY6aMzho=;
 b=P8WvHO01nmoEQChRwEmrdTg5OVlxefBDZ5/BeELnZUl8z+CkCVVeK0LFjlSTC7m2KZFrvCbO3Qf56WS+N/t00oOaBSebJCOIBs5AFX2reACqkl/V9aiEx+eeLbqkFMKYlRaMTabraO0EtXBWPt0ZZbrmmEVnjFESdJN6e27+WXAjTH1mY7Id0A74zy9QFj3UC7mAUc9RI7guBeUqef7VIEcwdW2G2N0h1ug1+k4i4sT9t36aaXgLW6UcKNp/6OkK9oGTg2Q2ZZzF0JM0sb1ttxUyOYRJuXyHlKxQtRm3a0cHYaNyAck/j688QOUgNTzA3O4Ly8UCfgV0TagvoxgV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS4PPF399DBF572.namprd11.prod.outlook.com (2603:10b6:f:fc02::1e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 14:56:07 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 14:56:07 +0000
Date: Thu, 11 Dec 2025 15:55:59 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_exec_system_allocator: Add new
 SVM compute tests
Message-ID: <aTrbf-3PO3wrsWBx@fdugast-desk>
References: <20251204113726.567142-1-francois.dugast@intel.com>
 <20251204113726.567142-3-francois.dugast@intel.com>
 <olcukudmlfseou22tbkp5bpgjbnj2lrowf4t2rxnwm5o2rktl6@67ib5cr4habv>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <olcukudmlfseou22tbkp5bpgjbnj2lrowf4t2rxnwm5o2rktl6@67ib5cr4habv>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::16) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS4PPF399DBF572:EE_
X-MS-Office365-Filtering-Correlation-Id: 0378dc19-9daf-44df-e6c1-08de38c569db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFhsSVMyRXBRVjdlMHU2ODFtdmVwM1VrenhxNXBtVHFjcnkrRjRuVytwRW9h?=
 =?utf-8?B?emlBTjljR3FTeWUwM3g1VWUrSHNVdjRocU1OU0pjM2Nkbzc1VnRCVXkwR1hn?=
 =?utf-8?B?WkE5TjM4WGEwMnRsZTNOck9kdkpDMDBpU0NyNFFMZUNyUEptNmcvMmVpYnlH?=
 =?utf-8?B?cFZJejJRSnhsb1hpZkd3R0w0dkZwbjBWUzhrYXluUFZaT0F6ck91VWxDQnZn?=
 =?utf-8?B?RlIwcWMyQ0hwSTBEREFHR2JoZFZWdm1oVmoxMktvQ2YrOGZueFdiUmRHRlQ5?=
 =?utf-8?B?Q2k3WUZMZ0lDRTlIdkd1ZlRJVGpPdzJuSjZiWHFmdldvclphZDVHL3VPVm1t?=
 =?utf-8?B?bm5wRmhQcjNvM1JHT1RIWUlvazFmdUUzdXBqblZJeVNIYjdvVWcvbXdiMU53?=
 =?utf-8?B?T3FiOGlOdWM0ZU9ZcGVBZ3c3M0Z3QzQ5R2hPOGNCdWN1TkNUK1JXeDYyS0Vv?=
 =?utf-8?B?RzcwSk82UW1OWUpMdnFETEZDdDhON3hmQlFqTFRvNkZiTjNUL2l1djhreGVF?=
 =?utf-8?B?dk9lMnpkQ3RhMjhYTUtSSEl5dFY2QkExZHBhNXJqbk80dlZlYzMrbXRwL1pP?=
 =?utf-8?B?REZoeXNOUGtQeWZBdHZOeEtvdXgwekh6NzZiUU5TeGhMVGN6ejcrODJ2OEdZ?=
 =?utf-8?B?YmhtM3NKbWd1ZGRFaTNUWXNLeDdHQU5PMUcrU2lmZTJ5VGJMQ3NmMERHRTlH?=
 =?utf-8?B?bm5ieHpMTytjM2EzQy9yOFdRVU5YTVhqSU9UY2hSenJlODhXdEYwQ0s5TGk5?=
 =?utf-8?B?TWowQ091TGR4UDZoYjAxWGRCTXN3dUJVYVgrQ0xkak96NHg3YTNxUHhZUXZQ?=
 =?utf-8?B?NGZHeWo5Y0kzYW93VWRFZGg4QUJXT1pJdk5aZVRnWnFzeVBRTzk1V2RReHZZ?=
 =?utf-8?B?bFRWb2RkK2d1cFRhQmJPUmN5REJ5NzhqUis5enN4TnBsYndlbnVEc2FtOU4v?=
 =?utf-8?B?amQ1S3ZsekNNQms5NFhwcldMcWIrRkhxTlkrTHRCYkhLdk5CL3ZVVHcvSXJy?=
 =?utf-8?B?NkZqZmR3R2Y3ZEc3YkViMkFpOW9kTG5QTzBOaG1LOEZTcGphbGNuYXl5SXpy?=
 =?utf-8?B?U2IyRFJVZGVacitpazBnN2pQbUJQU0hjT3FGRVpQMmFqNHlZWmk2YlFDNFpQ?=
 =?utf-8?B?ZThtVXJQd0VNbC9LQnk5bXFFUzliZzluQkdVU1JVRjF4YUZkOTFzWkdrMW1n?=
 =?utf-8?B?K3ZaSFBEUXBXOVRjNDlPSGcxYVN0MGNEVTdvY0QrVDZKWTNHNktWc0xTQUZt?=
 =?utf-8?B?bG5aeEFlMDBXc09PKzBTa3d2VHIvaGF0Z1JObDMrZVNDbGhqZEx4ZHBCUkRH?=
 =?utf-8?B?NlBmbnNUaFNtNTVlbitsYjRzS0taSHA2Mnhvdjc0N2JES3hFL2M3Zk03UXdW?=
 =?utf-8?B?YUV5ME93aDBRM2Vtc25FZFkxNngrK2pvVmZqNVFRcTFocGxvMDYwUXNaZHpk?=
 =?utf-8?B?aDR2aXI5VHpCNEc4TlpBNytzajBacHBXQ0plUVJRK0RsRnl3M2JIR2ljZkZ6?=
 =?utf-8?B?UmhiSzFsWFR1clBhcG8yd2F4NDZGamthTHpzejJCWEI5WFozQnhLZENucUpE?=
 =?utf-8?B?Z1NiakNQTlUrU3lDU1lCbkszRklHTkRTdTg4YTlTQzN1Y1ZMNFF2Mzc2b0Ra?=
 =?utf-8?B?aEhJb0NJZjYycG9yK0pGUnVZOHdpWmNyL09Ca05IZythT3JGc1V4ZE9qRjh4?=
 =?utf-8?B?MisvdjRVNlkvV1cwYndzNmVTUFZLUXVrSVFZNTNXWVpRRWcvWXpnTzRsWTBv?=
 =?utf-8?B?OHJPeTVXNHF0TlFRQlVWa2FKeE1GNkczaEtzZXlpT2I0ZmFVNlQ3RmJISjln?=
 =?utf-8?B?WWNITHVRT043dHNOV0FsVS9ycWt2TjVuMExjZjEyMldhdkZpTHlPVGRIeE1T?=
 =?utf-8?B?dXNueG8vR2hnTFgvN3NQUmpnSkF2VXRmRnU1dmNIVDJzUjU4RW9jb0RaSU5Y?=
 =?utf-8?Q?iQtNtngSJEgSaX/MXq5GiXNPwZJp9KNV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STJ2b2pucXRCaU5OTUdobTc5ZUVKY3lPVjBQQUg2Sjd2Qys1RmhUMHd1TUxR?=
 =?utf-8?B?ZmZORERxdHdQSms5ampncEwzQ05tQ2p1MmhCdmRIcnJ2aVNVTWVwOGFYS1pE?=
 =?utf-8?B?bWNmd0p5d0JMQ09KRWN1RjZaVzJIR0c5M3c0bFg3cU1USldWWGI5Ymlac0gv?=
 =?utf-8?B?Ym1HQklMQTNPWHQ5OGZESFBOaVE1d2xlNEsxajg2V2VwdjBDWUo0WG9hQm9u?=
 =?utf-8?B?YkFSQmtnWDJ3emlkV1M0Ums3RXJGTzBKaU4yVXpQTHUvM2llQWczN1hPOVEy?=
 =?utf-8?B?M2JmdXhZV1BQcVdkZlA3UWZqbWlDcHA4a0p4aklVU21QOEJERFJCR3pnRlUr?=
 =?utf-8?B?eE1wVGpNQ2tkSC9SV0FSU3llQ29DWkg2eUM4QWRuSXBoYnhPd0JZZE1NOFda?=
 =?utf-8?B?NHpMK0QvdEpxcEYzdlRWR3FNc3NjR2hkZFRnNkhlazgwSHVtdmkxT3Y1eE8v?=
 =?utf-8?B?ZE8wNS9VamY1Wi9PN3l0ZHJpWE1jTjI1OFIxN2ZwRWJLUWpvbXllTVZFY2Na?=
 =?utf-8?B?cGVLemhrcGl2YnRTaFpVWnF0RVdQTVg1bFczbHpvSWNhSmpmZWZ6KzdHSDAy?=
 =?utf-8?B?Ukd3Z0tWNDd1d1cxKzVwNDZUUWVQYkhxS2hWZmd1UHJTVzBmS21BeU51LzBw?=
 =?utf-8?B?RlBkZlRIeW55ODRMS1Vxa1haNWJmNzllY3ltckJxOG1rL3M5NFdwYktVTWNE?=
 =?utf-8?B?MGg0S1lIclMyUXdrQkVGNHlPR0U5amVGN1FlakIzVitVTTJ0Zll1aVdVbHMz?=
 =?utf-8?B?dEJpTXB1Uk9IUnFQcDl4d2pFVDZHSkNwMXNwbFZlWFowUjR6TVQzNHlVRCth?=
 =?utf-8?B?QkxweVJnQnJUZHNpQkk5WkwveXF4Q0d3QXlCSUU0VngxRUs3UnlLMyt0RmFq?=
 =?utf-8?B?aFpzVk5sNlZoTEhzZ2V5MUQvVzNjR0pzdW5oVkxXc0FPcWxacGFld0IybGc1?=
 =?utf-8?B?bWE2UUhQd1NNTmF5SjhucXFEWGxmZTNBWkRPbXJMdW5LSjdrakwrbDAzK0p4?=
 =?utf-8?B?US82eDhEUW0vMDh4Uk03L2E0MUhzVjBKZjAvclY1OHNxWWRMQkg1d1Q5aHZY?=
 =?utf-8?B?b0VJMlVqOWZrT0lwNWxqV0JiMGxqb1pwcy9Eckp0RjRjY0hNNTE5Y0UzRnVl?=
 =?utf-8?B?SWZVVzNlTVdidWVEZjU3eDVVSGJwOU1NTEV0SmxobUR5THRXT2h1aGY1MTd0?=
 =?utf-8?B?OUIxRUtvTmhXOTZTZEtpR1NoZ2JkR0pIR3VrcWtnaDBWZ3p2bkd2aitMZzU2?=
 =?utf-8?B?M210VmNDNEdWMjhRYnFWdnQyelJiZFVJcXZ6ZURzcVRPZHNyMTdMK09lZmg3?=
 =?utf-8?B?TU1IZDJQTEUvRDBlRStpM21yQWJHSmVISG93TGYyY285dkExejcrSmsyRWUy?=
 =?utf-8?B?V2lNMGttK0JhUUF4K0ZyYTd3SmpNeDIxelFQZHhWZnFpOEl3c21xbHJQRnFr?=
 =?utf-8?B?c0xQQ0l4cUNFdHdjdUd6SWNFWVFzVjBkSlhKV1FacjhoajU2cDZ2UWU3dndC?=
 =?utf-8?B?S1V0RFU3QmJNaHRoeUp4b09kZHc3QXRvK0duYTVJL2JOWDFtZzBoYmtiUno2?=
 =?utf-8?B?cTNyR3ZkTDRub0E4RGFzWjdFMENlS21QSkp3b1JDeW5OSGpTWm1JSmx0b1dL?=
 =?utf-8?B?WW1KMnRyL0VrVE9BeVUzY3o2bVE1aXFxN0dpUGF0YVp4d1VISE91K2RxN3FH?=
 =?utf-8?B?dnBFLzM4WTZBU0xpT1I1VDJGNGxtNjM4Z1BmcGNGUWswY0VBQ0FYVmRzRThJ?=
 =?utf-8?B?d1dVdVQyZUs2bU5helUvdnZNLzhoVTE4Z0tuaWZmOE1IakEzOVljTlFJajVl?=
 =?utf-8?B?clhKKzE4Sk1naXEwRDdXTm5RNUNLdWxEK3Zab3BaaXNWTGNLWTlJVzJEbTJL?=
 =?utf-8?B?Sys4SjIwdlRyZldSVWNjMUJ3NC9aY1AxYXJxTGlpcC9PTUZGTVBVaVhMZlNn?=
 =?utf-8?B?bFpVTkVRQ1JZMlRoclVheGlkQ25KSFpwY28xdytUZWk4dWIyUy9rN3BxZ0Uy?=
 =?utf-8?B?TGJkWU1aR0p5ZXU3Yng5S1JNNU1GK3hDUmRjWmYwSzFySThvYXFQa3NVcGxv?=
 =?utf-8?B?Z2pvQ1ViMURMMWhHNmZwbHJqTUVrZE83enRENlR5TzJxMXpObnZBaEY1SHZ6?=
 =?utf-8?B?dWhwb205WGtYMk1CY2VGS2NkQjlDRnBTOHBCdE8zc0p5b05oK1JQenhDYTlT?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0378dc19-9daf-44df-e6c1-08de38c569db
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 14:56:07.0651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfOfcQWPjn6zzqHQQo/TRNFGsPn7OFWk+xl2HPiX/yWnfpIuGqT89ONrdbZlfIFxttTlt9sGonxwYz+iYSc76ntx5HS05qFmKTAfptB3WBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF399DBF572
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

On Wed, Dec 10, 2025 at 05:32:08PM +0100, Zbigniew Kempczyński wrote:
> On Thu, Dec 04, 2025 at 12:35:59PM +0100, Francois Dugast wrote:
> > These new tests allow triggering GPU page faults from the context of
> > execution units. They can be used to create single page faults or page
> > fault floods, of various sizes. This is helpful for debugging and for
> > performance profiling.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 60 ++++++++++++++++++++++++--
> >  1 file changed, 56 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index 43be307fb..95146a5f3 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -2172,13 +2172,37 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> >  	munmap(pdata, sizeof(*pdata));
> >  }
> >  
> > +/* compute flags */
> > +#define TOUCH_ONCE		(0x1 << 0)
> > +#define ACCESS_DEVICE_HOST	(0x1 << 1)
> > +
> >  /**
> >   * SUBTEST: compute
> >   * Description: Run a simple compute kernel with the system allocator
> >   * Test category: functionality test
> > + *
> > + * SUBTEST: eu-fault-4k-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-64k-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-2m-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * arg[1]:
> > + *
> > + * @once-device:				touch the buffer only once, from the device
> > + * @once-device-host:				touch the buffer only once, from the device then from the host
> > + * @range-device:				touch the whole buffer, from the device
> > + * @range-device-host:				touch the whole buffer, from the device then from the host
> >   */
> >  static void
> > -test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
> > +test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> > +	     unsigned int flags)
> >  {
> >  	struct drm_xe_sync sync = {
> >  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > @@ -2205,11 +2229,14 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
> >  	compute_input = aligned_alloc(aligned_size, size);
> >  	igt_assert(compute_input);
> >  
> > +	env.array_size = (flags & TOUCH_ONCE) ? 1 : aligned_size / sizeof(float);
> > +	env.skip_results_check = (flags & ACCESS_DEVICE_HOST) ? false : true;
> > +	env.input_addr = to_user_pointer(compute_input);
> > +	env.vm = vm;
> > +
> >  	for (i = 0; i < env.array_size; i++)
> >  		compute_input[i] = rand() / (float)RAND_MAX;
> >  
> > -	env.input_addr = to_user_pointer(compute_input);
> > -	env.vm = vm;
> >  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> >  
> >  	free(compute_input);
> > @@ -2361,6 +2388,13 @@ igt_main
> >  		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
> >  		{ NULL },
> >  	};
> > +	const struct section csections[] = {
> > +		{ "once-device", TOUCH_ONCE },
> > +		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
> > +		{ "range-device", 0 },
> > +		{ "range-device-host", ACCESS_DEVICE_HOST },
> > +		{ NULL },
> > +	};
> >  
> >  	const struct section intel_get_pat_idx_functions[] = {
> >  		{ "madvise-pat-idx-wb-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> > @@ -2604,7 +2638,25 @@ igt_main
> >  
> >  	igt_subtest("compute")
> >  		xe_for_each_engine(fd, hwe)
> > -			test_compute(fd, hwe, SZ_2M);
> > +			test_compute(fd, hwe, SZ_2M, 0);
> 
> Iteration over each engine here doesn't makes sense, eci is not used
> in the test_compute function (it calls run_intel_compute_kernel()
> which in turn passes NULL). If you want to execute on more than
> single ccs you should pick eci which matches COMPUTE class and
> call __run_intel_compute_kernel() directly.

Yes, indeed. As this issue existed before and is not introduced by this
change, I will fix it in the first patch (cleanup).

Francois

> 
> --
> Zbigniew
> 
> > +
> > +	for (const struct section *s = csections; s->name; s++) {
> > +		igt_subtest_f("eu-fault-4k-%s", s->name)
> > +			xe_for_each_engine(fd, hwe) {
> > +				test_compute(fd, hwe, SZ_4K, s->flags);
> > +				break;
> > +			}
> > +		igt_subtest_f("eu-fault-64k-%s", s->name)
> > +			xe_for_each_engine(fd, hwe) {
> > +				test_compute(fd, hwe, SZ_64K, s->flags);
> > +				break;
> > +			}
> > +		igt_subtest_f("eu-fault-2m-%s", s->name)
> > +			xe_for_each_engine(fd, hwe) {
> > +				test_compute(fd, hwe, SZ_2M, s->flags);
> > +				break;
> > +			}
> > +	}
> >  
> >  	igt_fixture {
> >  		xe_device_put(fd);
> > -- 
> > 2.43.0
> > 
